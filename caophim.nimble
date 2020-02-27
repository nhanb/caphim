# Package

version       = "0.1.0"
author        = "Nhan"
description   = "Yet another image board"
license       = "MIT"
srcDir        = "src"
binDir        = "bin"
bin           = @["caophim", "janitor"]
skipExt       = @["nim"]



# Dependencies

# using nim devel because current release (1.0.6) has a json unmarshalling bug:
# https://github.com/nim-lang/Nim/issues/13531
requires "nim >= 1.1.1"

requires "jester >= 0.4.3"

# I'm only using karax for its backend html generation features.
# No fancy frontend stuff is used.
# Also need to force install karax from current master branch because the latest
# published version 1.1.0 does not render `verbatim` correctly:
requires "karax#f6bda9a"
