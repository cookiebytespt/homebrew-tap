# CookieBytes Homebrew Tap

Homebrew formulae and casks published by [CookieBytes](https://cookiebytes.pt).

## Usage

```sh
brew tap cookiebytespt/tap
```

## Casks

| Cask | Description |
| --- | --- |
| [`recorte`](Casks/recorte.rb) | Design and cut software for Liyu GF series vinyl cutters/plotters |

```sh
brew install --cask cookiebytespt/tap/recorte
```

## Updating a cask

1. Publish the GitHub release (the release workflow attaches `Recorte-<version>.zip` and its `.sha256`).
2. Bump `version` and `sha256` in `Casks/recorte.rb`:

   ```sh
   VERSION=0.3.0
   curl -sL https://github.com/cookiebytespt/Recorte/releases/download/$VERSION/Recorte-$VERSION.zip.sha256
   ```

   or let Homebrew do it: `brew bump-cask-pr --version $VERSION cookiebytespt/tap/recorte`.
