#!/bin/bash

git init

touch .gitignore
git add .
git commit -m "Init commit"
git remote add origin git@bitbucket.org:fr0ster/sap.m.walkthrough.stepbystep.ivi.git
git remote add upstream git@github.com:fr0ster/sap.m.walkthrough.stepbystep.ivi.git


for ((i = 1; i <= 18; i++)); do
	if [ "$i" -lt 10 ]; then
		# if body
		echo 'A' | unzip ../sap.m.zip/sap.m.tutorial.walkthrough.0"$i".zip -d .
	else
		# else body
		echo 'A' | unzip ../sap.m.zip/sap.m.tutorial.walkthrough."$i".zip -d .
	fi
	rm package.json -f
	rm ui5.yaml -f
	npm init -y
	ui5 init
	sed -i 's/.\/resources\/sap-ui-core.js/https:\/\/sapui5.hana.ondemand.com\/resources\/sap-ui-core.js/g' ./webapp/index.html
	git add .
	git commit -m "Step $i"
done
