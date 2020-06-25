# DocsifyJS Tutorial
> Tutorial on how to build a docs site with _DocsifyJS_ and _Github Pages_

[![Made with latest Docsify](https://img.shields.io/npm/v/docsify?label=docsify)](https://docsify.js.org/)
[![GitHub tag](https://img.shields.io/github/tag/MichaelCurrin/docsify-js-tutorial.svg)](https://GitHub.com/MichaelCurrin/docsify-js-tutorial/tags/)
[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](#license)

## Links

### Learn about DocsifyJS

[![DocsifyJS Tutorial](https://img.shields.io/badge/site-DocsifyJS_Tutorial-green?style=for-the-badge)](https://michaelcurrin.github.io/docsify-js-tutorial/#/)

### Start with a template

[![DocsifyJS Template](https://img.shields.io/badge/site-DocsifyJS_Template-blue?style=for-the-badge)](https://michaelcurrin.github.io/docsify-js-template/#/)


## 👩‍🏫 About the online tutorial

The [Docsify](https://docsify.js.org/#/) site has great quickstart, but I found that it did not guide me through what to do next. And all the config options and plugins were overwhelming and I probably won't need most of them, at least for a while. So I created this as a tutorial to guide you through setting up a site, whether new to or experienced with DocsifyJS.

This tutorial takes you from basic site setup and content to optional configuration of styling, menus and plugins. It aims to cover common use-cases in a logical sequence, rather than covering everything you could do. You can also jump to a later step if you want to use that as a reference.

It also assumes you already have a docs directory in a project and you want to turn it into a docs site. The tutorial gives you some tips and pitfalls to avoid, based on the author's experience.

This project's own site is built on _DocsifyJS_ so serves as a good example. It serves from the `docs` directory. There is no main application to separate from `docs` directory, so serving from that directory is just convenient.

See also the [Nested Example](/nested_example/README.md) section on the repo for understanding links in markdown and the sidebar.


## 🖨️ Use a template

If want to skip the tutorial and want a base project which has some sample data then go to the template repo linked at the top.

That is a template repo which was created to accompany this tutorial, so the layout and conventions will mostly be the same. The template only implements the basic steps from the tutorial.

Click _Use this template_ button and follow the instructions in the *README.md* doc.


## 🎯 Project aims

Some background on how I arrived at DocsifyJS as a docs site builder.

My aims for building a docs site are:

- add as little code and configuration as possible
- make it easy to maintain
- quick to get setup on existing projects
- have no layout files
- reduce dependencies

The docs site tool used here is [DocsifyJS](https://docsify.js.org/) which is a frontend JS library written in VueJS. But if you have never used before or never coded in JS before, you'll be guided through. The only JS you need to write in your config values. You also need to edit some HTML values and possibly write a YAML file for your navbar, which again is more configuration than code.

This project's tutorial covers the basics and provides minimal setup instructions. You can add the quickstart project to your **existing** docs folder. If you doc files are markdown files, you don't have to rename them and their formatting can mostly stay the same i.e. no frontmatter or special syntax and the pages still render well as plain markdown even. But some links may need updating since `/docs` folder is now the root of the app.

Unlike static site builders like Jekyll or Hugo, you do **not** need to install or run a site generator or change the formatting or metadata of your markdown files. Your also don't need any separate config file - the configuration is handled in the _index.html_ page, which is also where dependencies are fetched in the browser and where the app starts.

_Docsify_ works as a single-page application on this one page - data from your markdown files is pulled in and displayed within the _Docsify_ UI shell. There are no template layout files to manage and you can choose from some themes easily without things breaking like when you switch themes in other static site generators.


## Contributing

The repo is open for accepting contributions through a Pull Request.


## License

Released under [MIT](/LICENSE).

- You can modify and reuse this project.
- A copy of the license and copyright notice must be included with the software, according to this [MIT definition](https://choosealicense.com/licenses/#mit).
- Please link back to this repo somewhere in your project.
