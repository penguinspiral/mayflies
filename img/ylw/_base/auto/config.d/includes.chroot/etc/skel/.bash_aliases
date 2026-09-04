# Mayflies drop-in bash(1) configuration
# Sourced by .bashrc configuration

# Prompt length
PROMPT_DIRTRIM=3

# Prompt colour
_START_WHITE_EM='\[\e[1;37m\]'
_START_YLW_EM='\[\e[1;33m\]'
_END_COLOUR='\[\e[0m\]'

PS1="${_START_WHITE_EM}\u${_END_COLOUR}@${_START_YLW_EM}\h${_END_COLOUR}:${_START_WHITE_EM}\w${_END_COLOUR}\$ "
