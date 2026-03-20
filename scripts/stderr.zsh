# Prefix error output with a warning sign and a red `[stderr]` tag.
if [[ -z "$_STDERR_PREFIXED" ]]; then
  export _STDERR_PREFIXED=1
  exec 2> >(while IFS= read -r line; do print -Pn "%F{red}⚠️ [stderr]%f " >&2; printf '%s\n' "$line" >&2; done)
fi
