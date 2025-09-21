help:		## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-\/]+:.*?## / {printf "\033[32m%-10s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
