# Docsify JS Tutorial
> Tutorial on how to build a docs site with _Docsify-JS_ and _Github Pages_

[![Made with latest Docsify](https://img.shields.io/npm/v/docsify?label=docsify)](https://docsify.js.org/)
[![GitHub tag](https://img.shields.io/github/tag/MichaelCurrin/docsify-js-tutorial.svg)](https://GitHub.com/MichaelCurrin/docsify-js-tutorial/tags/)
[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/MichaelCurrin/docsify-js-tutorial/blob/master/LICENSE)

Links:

- [Docsify JS Tutorial](https://michaelcurrin.github.io/docsify-js-tutorial/#/) docs site for this repo.
- [Docsify JS Template](https://github.com/MichaelCurrin/docsify-js-template) - a separate repo which accompanies this tutorial and can be reused easily through _Use this template_ button.

This project will guide you on how to convert your project's docs folder into a pretty and elegant docs website. This project's own docs site is built on _Docsify-JS_ so serves as a good example.


<!-- TODO move content to docs -->

## 🎯 Project aims

My aims for building a docs site are:

- add as little code and configuration as possible
- make it easy to maintain
- quick to get setup on existing projects
- have no layout files
- reduce dependencies

The docs site tool used here is [Docsify-JS](https://docsify.js.org/) which is a frontend JS library written in VueJS. But if you have never used before or never coded in JS before, you'll be guided through. The only JS you need to write in your config values. You also need to edit some HTML values and possibly write a YAML file for your navbar, which again is more configuration than code.

This project's tutorial covers the basics and provides minimal setup instructions. You can add the quickstart project to your **existing** docs folder. If you doc files are markdown files, you don't have to rename them and their formatting can mostly stay the same i.e. no frontmatter or special syntax and the pages still render well as plain markdown even. But some links may need updating since `/docs` folder is now the root of the app.

Unlike static site builders like Jekyll or Hugo, you do **not** need to install or run a site generator or change the formatting or metadata of your markdown files. Your also don't need any separate config file - the configuration is handled in the _index.html_ page, which is also where dependencies are fetched in the browser and where the app starts.

_Docsify_ works as a single-page application on this one page - data from your markdown files is pulled in and displayed within the _Docsify_ UI shell. There are no template layout files to manage and you can choose from some themes easily without things breaking like when you switch themes in other static site generators.


## 👩‍🏫 Follow the tutorial

The tutorial is available in two forms:

- Github Pages: [docs site](https://michaelcurrin.github.io/docsify-js-tutorial/#/). This also live demo of the kind of site you would have after completing the tutorial.
- Project docs: View the docs as plain markdown format in the repo, either locally or on Github. See the [docs](/docs) directory.

The tutorial references the `docs` directory of my [Docsify JS Template](https://github.com/MichaelCurrin/docsify-js-template) if you want to jump that.

See also the [Nested Example](/nested_example/README.md) section for understanding links in markdown and the sidebar.


## Contributing

The repo is open for accepting contributions through a Pull Request.
