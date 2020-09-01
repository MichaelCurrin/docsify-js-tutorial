.PHONY: docs

help:
	@egrep '(^\S)|^$$' Makefile

docs:
	docsify serve docs

docs-py:
	cd docs && python3 -m http.server 3000

vue:
	cd vue_example && python3 -m http.server 3000
