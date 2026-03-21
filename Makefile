.PHONY: validate export clean new-pack all vendor-skill update-vendor check-upstream validate-vendor

all: validate export

validate:
	@bash scripts/validate.sh

export:
	@bash scripts/export-agentskills.sh

clean:
	@rm -rf dist/

new-pack:
	@bash scripts/new-pack.sh

# Vendor management
vendor-skill:
	@bash scripts/vendor-skill.sh --source $(source) --version $(version) --skills "$(skills)"

update-vendor:
	@bash scripts/vendor-skill.sh --source $$(grep -A2 "name: $(name)" imports.lock | grep 'source:' | sed 's/.*source: "//;s/"//') --version $(version) --skills "$$(grep -A2 "name: $(name)" imports.lock | grep -A20 'skills:' | grep 'name:' | sed 's/.*name: //' | tr '\n' ',' | sed 's/,$$//')"

check-upstream:
	@bash scripts/check-upstream.sh

validate-vendor:
	@bash scripts/validate-vendor.sh
