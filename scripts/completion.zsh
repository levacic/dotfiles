# Revert the change caused by oh-my-zsh.
#
# It's just a personal preference that hyphens and underscores _should_, in
# fact, be considered word separators.
#
# Not sure why oh-my-zsh originally set this to an empty string (ie. consider
# everything to be a word separator) but it works well.
#
# @see https://github.com/ohmyzsh/ohmyzsh/issues/8743
# @see https://github.com/ohmyzsh/ohmyzsh/commit/50dc4ab3574f4e265dff816d8d9a0195cd260152

WORDCHARS=''
