# https://stackoverflow.com/a/10858332
check_defined = \
    $(strip $(foreach 1,$1, \
        $(call __check_defined,$1,$(strip $(value 2)))))
__check_defined = \
    $(if $(value $1),, \
      $(error Undefined $1$(if $2, ($2))))
check_binary = \
    $(strip $(foreach 1,$1, \
        $(call __check_binary,$1,$(strip $(value 2)))))
__check_binary = \
    $(if $(shell command -v $1),, \
      $(error Missing binary: $1$(if $2, ($2))))
# Extending boilerplate pattern
check_path = \
    $(strip $(foreach 1,$1, \
        $(call __check_path,$1,$(strip $(value 2)))))
__check_path = \
    $(if $(shell [ -e $1 ]),, \
      $(error Missing file: $1$(if $2, ($2))))
