# 🧰 bun-tools

> Simple shell scripts and CLI helpers for working with Bun, SvelteKit, and Tailwind CSS.

This repo is just a collection of convenience scripts for repeating common setups. Nothing here is magic—just well-documented steps automated for speed.

## 🛠 Tools so far

- `init-sveltekit-tailwind.sh`: Set up Tailwind CSS v3 in a new SvelteKit project (with optional plugin support)
- [More coming soon... probably!]

MIT licensed, contributions welcome!

## 📦 What’s in the box?

These tools aren’t frameworks or full templates—just easy-to-repeat scripts and commands for example to set up projects quickly.

### ✅ `init-sveltekit-tailwind.sh`

Sets up Tailwind CSS **v3** with **SvelteKit** using **Bun**.
* **[>> Go to Detailed Documentation and Usage Instructions](./docs/init-sveltekit-tailwind.md)**

- Installs dependencies (`tailwindcss@3`, `postcss`, `autoprefixer`)
- Initializes Tailwind + PostCSS configs
- Adds default `app.css` with Tailwind directives
- Updates your `+layout.svelte` to import styles
- Optional plugins (`forms`, `typography`, etc.) via `--plugins`

#### Why not Tailwind v4?
As of now, Tailwind CSS v4 has compatibility issues with Bun + SvelteKit. This script sticks to v3 for a stable setup.
This is why I decided to publish it, I am bored with fixing up projects and want a nice starter project I can use in a public place.
It might even be useful to other people.

#### 🧪 Usage

```bash
./init-sveltekit-tailwind.sh my-app
./init-sveltekit-tailwind.sh my-app --plugins forms typography