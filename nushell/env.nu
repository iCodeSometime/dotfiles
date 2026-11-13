# env.nu
#
# Nushell 0.114+ environment file. Loaded BEFORE config.nu.
# Ported from ~/.zprofile, ~/.profile, ~/.zshenv, and ~/.zshrc.
#
# Key idea: Nushell can't `source` zsh/bash scripts or `eval` shell strings,
# so anything that worked via `eval "$(... shellenv)"`, an `init.zsh`, or a
# shell *function* (nvm, rvm) has been converted to a Nu-native equivalent.
#
# `path add` (from std/util) PREPENDS, so entries added LATER in this file take
# precedence. The "shadow system tools" group is intentionally added last.

use std/util "path add"

# ---------------------------------------------------------------------------
# Homebrew  (replaces: eval "$(/opt/homebrew/bin/brew shellenv)")
# ---------------------------------------------------------------------------
# brew shellenv only emits sh/zsh/fish syntax, so we set its results directly.
# These paths are fixed on Apple Silicon.
$env.HOMEBREW_PREFIX = "/opt/homebrew"
$env.HOMEBREW_CELLAR = "/opt/homebrew/Cellar"
$env.HOMEBREW_REPOSITORY = "/opt/homebrew"
$env.MANPATH = $"/opt/homebrew/share/man:($env.MANPATH? | default '')"
$env.INFOPATH = $"/opt/homebrew/share/info:($env.INFOPATH? | default '')"
path add "/opt/homebrew/sbin"
path add "/opt/homebrew/bin"

# ---------------------------------------------------------------------------
# Standard tool bins (plain PATH additions, order among these is unimportant)
# ---------------------------------------------------------------------------
path add "~/.cargo/bin"                                          # Rust (was: . ~/.cargo/env)
path add "~/.dotnet/tools"                                       # .NET SDK tools
path add "~/.aspire/bin"                                         # .NET Aspire
path add "~/.lmstudio/bin"                                       # LM Studio CLI (lms)
path add "~/.rd/bin"                                             # Rancher Desktop
path add "/opt/local/bin"                                        # MacPorts
path add "~/Library/Application Support/JetBrains/Toolbox/scripts" # JetBrains Toolbox
path add "~/.antigravity/antigravity/bin"                        # Antigravity
path add "~/.orbstack/bin"                                       # OrbStack CLIs (orb, docker, etc.)
path add "~/.grok/bin"
path add "~/.local/bin"
path add "~/.asdf/shims"

# ---------------------------------------------------------------------------
# Tools that should shadow the system versions (added last = highest priority)
# ---------------------------------------------------------------------------
path add "/opt/homebrew/lib/ruby/gems/3.3.0/bin"                 # Homebrew Ruby gems
path add "/opt/homebrew/opt/ruby/bin"                            # Homebrew Ruby
path add "/opt/homebrew/opt/llvm/bin"                            # Homebrew LLVM/clang
path add "/Library/Frameworks/Python.framework/Versions/3.12/bin" # Python 3.12 (python.org)

# ---------------------------------------------------------------------------
# Environment variables
# ---------------------------------------------------------------------------
#$env.HF_ENDPOINT = "https://hf-mirror.com"                       # Hugging Face mirror

# ---------------------------------------------------------------------------
# OCaml — opam  (replaces the ~/.opam/opam-init/init.zsh source)
# ---------------------------------------------------------------------------
# `opam env` has no Nushell mode. Simplest reliable approach: add the active
# switch's bin to PATH. Confirm your switch name with `opam switch show`
# (commonly "default"); change the two paths below if yours differs.
if ("~/.opam/default/bin" | path expand | path exists) {
    $env.OPAM_SWITCH_PREFIX = ("~/.opam/default" | path expand)
    path add "~/.opam/default/bin"
}

# ---------------------------------------------------------------------------
# dotnet
# ---------------------------------------------------------------------------
$env.DOTNET_ROOT = $"($env.HOME)/.dotnet"


# ---------------------------------------------------------------------------
# bash-like aliases
# ---------------------------------------------------------------------------
alias fg = job unfreeze
