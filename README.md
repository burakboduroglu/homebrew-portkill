# Homebrew Tap for portkill

This repository contains the Homebrew Formula for [portkill](https://github.com/burakboduroglu/portkill), a CLI that kills processes listening on TCP ports on macOS and Linux.

## Install

```bash
brew tap burakboduroglu/portkill
brew install portkill
portkill --version
```

You can also install without a separate tap step:

```bash
brew install burakboduroglu/portkill/portkill
```

## Upgrade

```bash
brew update
brew upgrade portkill
```

## npm Global Install Conflict

If `portkill` was previously installed with npm, Homebrew may report that `/opt/homebrew/bin/portkill` already exists.

Remove the npm global install, then link the Homebrew formula:

```bash
npm uninstall -g @burakboduroglu/portkill
brew link portkill
portkill --version
```

Or inspect the files Homebrew would overwrite:

```bash
brew link --overwrite portkill --dry-run
```

## Updating the formula

Releases are cut in the [portkill](https://github.com/burakboduroglu/portkill)
repository: pushing a `vX.Y.Z` tag runs a workflow that publishes to npm,
creates the GitHub release, and attaches the tarball as `portkill-X.Y.Z.tgz`.

That workflow's run summary prints the two lines this formula needs. Copy them
into `Formula/portkill.rb`:

```ruby
  url "https://github.com/burakboduroglu/portkill/releases/download/vX.Y.Z/portkill-X.Y.Z.tgz"
  sha256 "..."
```

Then update the `chalk` and `commander` resources if either moved, and check the
formula before pushing:

```bash
brew audit --strict --online burakboduroglu/portkill/portkill
brew install burakboduroglu/portkill/portkill
portkill --version
```

To compute a checksum by hand:

```bash
shasum -a 256 portkill-X.Y.Z.tgz
```
