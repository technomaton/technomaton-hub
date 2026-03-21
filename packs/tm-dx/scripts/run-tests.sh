#!/usr/bin/env bash
set -euo pipefail
[[ -f package.json ]] && npm test --silent || true
[[ -f pytest.ini || -f pyproject.toml ]] && pytest -q || true
[[ -f pom.xml ]] && mvn -q -DskipITs test || true
[[ -f build.gradle ]] && ./gradlew test || true
