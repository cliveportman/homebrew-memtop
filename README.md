# homebrew-memtop

Homebrew tap for [memtop](https://github.com/cliveportman/memtop) — per-app
memory usage for macOS.

```sh
brew tap cliveportman/memtop
brew trust cliveportman/memtop
brew install memtop
```

The `brew trust` step is not optional. Homebrew 6 refuses to load formulae from
third-party taps until you explicitly trust them, and the error it gives you if
you skip it is clear enough but easy to hit. It is a sensible default: a tap is
arbitrary Ruby from a stranger on the internet, and Homebrew would rather you
said so out loud. Read [the formula](Formula/memtop.rb) first if you like — it
is twenty lines and installs a single shell script.

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
