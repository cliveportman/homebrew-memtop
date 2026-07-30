# homebrew-memtop

Homebrew tap for [memtop](https://github.com/cliveportman/memtop) — per-app
memory usage for macOS.

```sh
brew tap cliveportman/memtop
brew install memtop
```

Or in one step:

```sh
brew install cliveportman/memtop/memtop
```

## Why a tap and not homebrew-core

homebrew-core asks for a notability threshold — 30 forks, 30 watchers, or 75
stars — before it will take a formula. That is nothing to do with the software;
there are simply more formulae than anyone can maintain unconditionally. Until
memtop clears that bar, this is where it lives.

## Releasing

The formula pins a version, so a new memtop release means two commits in two
repos:

1. Tag the release in `cliveportman/memtop` and push the tag.
2. Update `url` and `sha256` here:

```sh
curl -sL https://github.com/cliveportman/memtop/archive/refs/tags/vX.Y.Z.tar.gz \
  | shasum -a 256
```

Then `brew audit --strict --online cliveportman/memtop/memtop` before pushing.

`brew install --HEAD memtop` tracks `main` directly if you want to skip all of
that.
