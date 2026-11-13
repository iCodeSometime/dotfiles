# config.nu
#
# Nushell 0.114+ config. Minimal-override style: the built-in defaults live
# inside the `nu` binary, and this file only changes the keys we care about.
# We assign individual keys (e.g. `$env.config.show_banner = false`) instead of
# replacing the whole `$env.config` record, so future Nushell versions can add
# or change keys without this file breaking.
#
# See a live, version-correct reference for every setting with:
#   config nu --doc | nu-highlight | less -R

# ---------------------------------------------------------------------------
# Editor
# ---------------------------------------------------------------------------
# Used by `config nu`, `config env`, and Ctrl-O to edit the command line.
# Pick one; a bare string for simple editors, a list when args are needed.
$env.config.buffer_editor = "nvim"


# ---------------------------------------------------------------------------
# General shell behavior
# ---------------------------------------------------------------------------
# $env.config.show_banner = false             # no startup banner
$env.config.edit_mode = "emacs"             # "emacs" or "vi"
$env.config.error_style = "fancy"           # "fancy" (boxed) or "plain"
$env.config.footer_mode = 25                # show table footer when >= 25 rows
$env.config.float_precision = 2
$env.config.bracketed_paste = true
$env.config.recursion_limit = 50

# Cursor shape per edit mode (helpful for vi users; harmless for emacs)
$env.config.cursor_shape = {
    emacs: line
    vi_insert: line
    vi_normal: block
}

# ---------------------------------------------------------------------------
# History
# ---------------------------------------------------------------------------
# SQLite history is the modern default: dedupes, tracks cwd, exit code, etc.
# `isolation: true` keeps each session's in-progress history private until saved.
$env.config.history = {
    file_format: sqlite
    max_size: 1_000_000
    sync_on_enter: true
    isolation: true
}

# ---------------------------------------------------------------------------
# Completions
# ---------------------------------------------------------------------------
$env.config.completions = {
    algorithm: "fuzzy"          # "prefix" or "fuzzy"
    sort: "smart"
    case_sensitive: false
    quick: true                 # auto-select when only one match
    partial: true               # partial completion of common prefix
    use_ls_colors: true
}

# ---------------------------------------------------------------------------
# ls / rm
# ---------------------------------------------------------------------------
$env.config.ls = {
    use_ls_colors: true
    clickable_links: true
}
$env.config.rm = {
    always_trash: false         # set true to route `rm` through the OS trash
}

# ---------------------------------------------------------------------------
# Table rendering
# ---------------------------------------------------------------------------
$env.config.table = {
    mode: rounded               # try: rounded, heavy, light, compact, none
    index_mode: always          # always | never | auto
    show_empty: true
    header_on_separator: false
    padding: { left: 1, right: 1 }
    trim: {
        methodology: wrapping   # "wrapping" or "truncating"
        wrapping_try_keep_words: true
        truncating_suffix: "..."
    }
}

# ---------------------------------------------------------------------------
# Datetime display
# ---------------------------------------------------------------------------
$env.config.datetime_format = {
    normal: "%Y-%m-%d %H:%M:%S"
    table: "%Y-%m-%d %H:%M"
}

# macOS only: keep the system `open` reachable while Nushell's `open` shadows it.
# Uncomment on macOS if a tool (e.g. Emacs) needs /usr/bin/open.
# alias nu-open = open
# alias open = ^open
