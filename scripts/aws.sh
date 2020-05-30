# Auto-complete `awscli` commands.
#
# @link https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-completion.html
if command -v aws_completer > /dev/null 2>&1; then
    complete -C aws_completer aws
fi
