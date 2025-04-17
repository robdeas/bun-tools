#!/bin/bash
#
# MIT License
# 
# Copyright (c) 2025 Rob Deas
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

set -e

APP_NAME=""
PLUGINS=()

# Helper function
function usage() {
  echo "Usage: $0 <project-name> [--plugins forms typography aspect-ratio]"
  exit 1
}

# Parse arguments
while [[ "$#" -gt 0 ]]; do
  case "$1" in
    --plugins)
      shift
      while [[ "$1" != "" && "$1" != --* ]]; do
        PLUGINS+=("$1")
        shift
      done
      ;;
    -*)
      echo "Unknown option: $1"
      usage
      ;;
    *)
      if [[ -z "$APP_NAME" ]]; then
        APP_NAME="$1"
      else
        echo "Unexpected argument: $1"
        usage
      fi
      shift
      ;;
  esac
done

if [[ -z "$APP_NAME" ]]; then
  usage
fi

echo "🔧 Creating SvelteKit project: $APP_NAME"
bunx sv create "$APP_NAME"
cd "$APP_NAME"

echo "📦 Installing project dependencies"
bun install

echo "🎨 Installing Tailwind CSS v3 and base dependencies"
bun add -D tailwindcss@3 postcss autoprefixer

echo "⚙️ Initializing Tailwind CSS config"
bunx tailwindcss@3 init

echo "🛠 Creating PostCSS config"
cat > postcss.config.js << 'EOF'
export default {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
EOF

echo "📁 Writing Tailwind config"
cat > tailwind.config.js << 'EOF'
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./src/**/*.{html,js,svelte,ts}'],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOF

echo "🎨 Adding Tailwind directives to src/app.css"
mkdir -p src
cat > src/app.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

/* Your custom styles below */
EOF

echo "🔗 Ensuring app.css is imported in +layout.svelte"
LAYOUT_FILE="src/routes/+layout.svelte"
if ! grep -q "import '../app.css'" "$LAYOUT_FILE"; then
  sed -i '1i import "../app.css";' "$LAYOUT_FILE"
  echo "✅ Added import to $LAYOUT_FILE"
else
  echo "ℹ️ Import already present in $LAYOUT_FILE"
fi

# Optional plugin installation
if [[ ${#PLUGINS[@]} -gt 0 ]]; then
  echo "📦 Installing Tailwind plugins: ${PLUGINS[*]}"
  for plugin in "${PLUGINS[@]}"; do
    bun add -D @tailwindcss/"$plugin"
  done

  echo "🔌 Updating Tailwind config to include plugins"
  PLUGIN_IMPORTS=$(printf "require('@tailwindcss/%s'), " "${PLUGINS[@]}")
  sed -i "s/plugins: \[\]/plugins: [${PLUGIN_IMPORTS::-2}]/" tailwind.config.js
fi

echo "🚀 Setup complete! Starting dev server..."
bun run dev
