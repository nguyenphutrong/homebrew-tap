# Homebrew Tap

Custom Homebrew tap for nguyenphutrong's applications.

## Installation

```bash
brew tap nguyenphutrong/tap
```

## Available Packages

### Quotio (Cask) - v0.6.0

Command center for AI coding assistants on macOS.

```bash
brew install --cask quotio
```

### Agentmap (Formula) - v0.3.0

Prepare codebases for AI agents with structured documentation.

```bash
brew install agentmap
```

## Uninstallation

```bash
# Remove quotio
brew uninstall --cask quotio

# Remove agentmap
brew uninstall agentmap

# Remove tap
brew untap nguyenphutrong/tap
```

## Development

### Testing locally

```bash
# Test cask
brew install --cask ./Casks/quotio.rb

# Test formula
brew install ./Formula/agentmap.rb

# Audit cask
brew audit --cask quotio

# Audit formula
brew audit agentmap
```

## License

MIT
