.PHONY: validate export clean new-pack all

all: validate export

validate:
	@bash scripts/validate.sh

export:
	@bash scripts/export-agentskills.sh

clean:
	@rm -rf dist/

new-pack:
	@bash scripts/new-pack.sh
