# Hugo: Hello World

This is a base setup to start a Hugo project from. It has a nix flake for easy environment setup, and a `Makefile` to relevant document commands.

## Setup

#### Install `nix`
- Install [`nix`](https://nixos.org/download/)
- Enable experimental features: `nix-command` &  `flakes`

#### Load environment
- Run `nix develop`

or

- Install [`direnv`](https://direnv.net/docs/installation.html)
- Add a `.envrc` file in your project root with
  ```
  use flake
  ```
- Run `direnv allow`

## Run

- Run `make run-server`
- Visit site at `localhost:1313/`

## Extend

- Choose any theme and install via gitmodule or by vendoring
- Delete layouts folder: `rm -r layouts/`
