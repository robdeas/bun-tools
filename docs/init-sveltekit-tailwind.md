### ✅ `init-sveltekit-tailwind.sh`

Sets up Tailwind CSS **v3** with **SvelteKit** using **Bun**. Automates project creation, dependency installation, configuration, and style integration, with optional plugin support.

#### Prerequisites

* **Bun:** This script relies heavily on the Bun runtime and package manager. Ensure `bun` is installed and accessible in your system's PATH. ([Installation Instructions](https://bun.sh/))

#### Usage

1.  Save the script as `init-sveltekit-tailwind.sh`.
2.  Make it executable: `chmod +x init-sveltekit-tailwind.sh`
3.  Run it:
    ```bash
    ./init-sveltekit-tailwind.sh <your-project-name> [--plugins plugin1 plugin2 ...]
    ```
    **Arguments:**
    * `<your-project-name>`: (Required) ...
    * `--plugins plugin1 ...`: (Optional) ...
    **Examples:**
    ```bash
    ./init-sveltekit-tailwind.sh my-cool-app
    ./init-sveltekit-tailwind.sh my-fancy-app --plugins forms typography
    ```

#### <details><summary>What the Script Does (Click to expand)</summary>

Upon execution, the script performs the following steps sequentially:

1.  **Parses Arguments:** ...
2.  **Creates SvelteKit Project:** ...
    ... (rest of the detailed steps) ...
12. **Starts Development Server:** ...

</details>

#### <details><summary>Error Handling (`set -e`)</summary>

Okay, let's create documentation specifically for using the script, distinct from a tutorial on how to do it manually. This documentation should live alongside the script (e.g., in a README.md file or as comments within the script itself, though a separate README is usually better).

Here's a suggested structure and content for a README.md:

SvelteKit + Tailwind CSS Quick Setup Script
This script automates the process of creating a new SvelteKit project and integrating Tailwind CSS v3, along with optional official Tailwind plugins.

Current Date: Friday, April 18, 2025 (Note: Commands and tool versions may change over time)

Purpose
This script streamlines the initial setup for a SvelteKit project that uses Tailwind CSS for styling. It handles:

Project scaffolding via create-svelte.
Installation of necessary dependencies (tailwindcss, postcss, autoprefixer).
Configuration of Tailwind CSS and PostCSS.
Integration of Tailwind's base styles into the SvelteKit app.
Optional installation and configuration of official Tailwind CSS plugins.
Starting the development server.
Prerequisites
Bun: This script relies heavily on the Bun runtime and package manager. Ensure bun is installed and accessible in your system's PATH. You can find installation instructions at https://bun.sh/.
Usage
Save the script to a file (e.g., setup-svelte-tailwind.sh).
Make the script executable (optional but recommended): chmod +x setup-svelte-tailwind.sh
Run the script from your terminal, providing a project name:


./setup-svelte-tailwind.sh <your-project-name> [--plugins plugin1 plugin2 ...]
Or using bash:

bash setup-svelte-tailwind.sh <your-project-name> [--plugins plugin1 plugin2 ...]
Arguments:

<your-project-name>: (Required) The name of the directory where the new SvelteKit project will be created.
--plugins plugin1 plugin2 ...: (Optional) A list of official Tailwind CSS plugins to install and configure. The script expects the short names (e.g., forms, typography).
Examples:

Basic Setup:


./setup-svelte-tailwind.sh my-cool-app
Setup with Forms and Typography plugins:


./setup-svelte-tailwind.sh my-fancy-app --plugins forms typography
What the Script Does
Upon execution, the script performs the following steps sequentially:

Parses Arguments: Reads the project name and any specified plugins.
Creates SvelteKit Project: Runs bunx sv create <your-project-name> to scaffold a new SvelteKit project. You will be prompted by create-svelte to choose project options (template, TypeScript usage, etc.).
Navigates into Project: Changes the current directory to ./<your-project-name>.
Installs Base Dependencies: Runs bun install to install SvelteKit's dependencies.
Installs Tailwind Dependencies: Runs bun add -D tailwindcss@3 postcss autoprefixer to add Tailwind and its peer dependencies.
Initializes Tailwind Config: Runs bunx tailwindcss@3 init to create a basic tailwind.config.js.
Creates PostCSS Config: Generates a postcss.config.js file configured to use tailwindcss and autoprefixer.
Updates Tailwind Config: Modifies tailwind.config.js to include ./src/**/*.{html,js,svelte,ts} in the content array.
Adds Tailwind Directives: Creates src/app.css (if it doesn't exist) and adds the necessary @tailwind directives (base, components, utilities).
Imports app.css: Ensures import '../app.css'; is present at the top of src/routes/+layout.svelte.
(Optional) Installs & Configures Plugins:
If --plugins were provided, installs each specified plugin via bun add -D @tailwindcss/<plugin-name>.
Updates tailwind.config.js to require and include these plugins.
Starts Development Server: Executes bun run dev to build the project and start the local development server.
Error Handling (set -e)
The script begins with set -e. This means it will exit immediately if any command fails (returns a non-zero status).

Why? This ensures the script doesn't proceed with potentially problematic steps if a critical part (like project creation or dependency installation) fails. It avoids leaving the project in an inconsistent or partially broken state.
Simplicity: This script prioritizes this "fail-fast" approach over complex error recovery logic, which is more robust given the potential for changes in underlying tools over time. If the script fails, check the last few lines of output to see which command caused the error.
Notes
The script interacts with create-svelte, which may prompt you for input during project creation.
The script modifies src/routes/+layout.svelte by prepending an import statement if it's not already present.
The final step (bun run dev) starts the development server, which will keep running until you manually stop it (usually with Ctrl+C).
This script provides a specific setup (Tailwind v3 via Bun). Adapt it if you have different needs.

</details>

#### Notes

* The script interacts with `create-svelte`...
* It modifies `src/routes/+layout.svelte`...
* The final step `bun run dev` keeps running...

#### Why not Tailwind v4?

---



