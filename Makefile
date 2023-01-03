dpl ?= env.env
include $(dpl)
export $(shell sed 's/=.*//' $(dpl))

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help 

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

run:
	dbt run -s state:modified+ --defer  --state ./target

test:
	dbt test -s state:modified+ --defer  --state ./target

rerun-errors: ### Rerun all my erroneous models AND run changes I made concurrently that may relate to the erroneous models for downstream use
	dbt run --select result:error+ state:modified+ --defer  --state ./target

source-freshness: ### Error if sources are too old
	dbt source freshness
	dbt build --select source_status:fresher+ --state ./target
