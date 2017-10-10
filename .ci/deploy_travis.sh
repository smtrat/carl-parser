#!/usr/bin/env bash

if [[ ${TASK} == "DEPLOY" ]]; then

	BRANCH="deploy-`git rev-parse --short HEAD`"
	git checkout --orphan $BRANCH

	git add .gitignore CMakeLists.txt README.md
	git add cmake/ resources/ src/ test/
	git add -f lib/
	git add -f src/generated/

	git commit -m "Prebuild parser"
	git tag -fa deploy-latest -m "latest version"

	git remote add github https://${GH_TOKEN}@github.com/smtrat/carl-parser.git
	git push github $BRANCH --tags --force
fi
