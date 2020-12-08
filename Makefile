.PHONY: docs

h help:
	@egrep '(^\S)|^$$' Makefile

docs:
	docsify serve docs

docs-py:
	cd docs && python3 -m http.server 3000
