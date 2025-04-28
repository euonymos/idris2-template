# Idris2 Project Template

Based on [nix-idris](https://github.com/CS-222-Idris2/nix-idris).

## Setting up a new project

```bash
# create new directory
mkdir my-project
cd my-project

# initialize git
git init

# use flake template
nix flake init -t github:euonymos/idris2-template
nix flake lock

# first commit
git add -A
git commit -m "initial commit"
```

## Accessing the development environment

To enter the development shell:

```sh
nix develop
```

If you have nix-direnv set up:

```sh
echo "use flake" > .envrc
direnv allow
```
