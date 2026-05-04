# Homebrew Tap for portkill

This repository contains the Homebrew Formula for [portkill](https://github.com/burakboduroglu/portkill), a CLI that kills processes listening on TCP ports on macOS and Linux.

## Install

```bash
brew tap burakboduroglu/portkill
brew install portkill
```

## Upgrade

```bash
brew update
brew upgrade portkill
```

## Release Checklist

1. Publish the npm package in the `portkill` app repository.
2. Publish a GitHub Release on `burakboduroglu/portkill` with a tag like `v0.4.5`.
3. Upload the npm package tarball as `portkill-0.4.5.tgz` to that release.
4. Update `Formula/portkill.rb` with the new `version`, URL, and `sha256`.
5. Update npm runtime resources if dependencies changed.
6. Run `brew audit --strict --online burakboduroglu/portkill/portkill`.
7. Run `brew install burakboduroglu/portkill/portkill`.
8. Commit and push this tap repository.

To calculate checksums:

```bash
shasum -a 256 portkill-0.4.5.tgz
shasum -a 256 chalk-5.6.2.tgz commander-13.1.0.tgz
```
