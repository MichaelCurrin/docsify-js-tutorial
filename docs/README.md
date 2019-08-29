# Docsify Template
> Skeleton of a light docs site built on _Docsify-JS_ and running on Github Pages

Demo site: [link](https://michaelcurrin.github.io/docsify-template/#/).

Convert your docs folder into a pretty docs website using [Docsify-JS](https://docsify.js.org/) and some minimal setup. This project can be used as a template or reference for your own.

My own aim is to turn the docs of many of my existing projects into doc sites with minimal effort to convert them and maintain them.

_Note: The instructions in this repo for for Linux and Mac environments._

## How to serve a docs site with Docsify

1. Add a few files to your existing docs folder. You can use this project's files to get you going.
    - **index page** - Homepage of the your docs site. This will setup the app using the _Docsify_ library, set a theme and apply other configurations.
    - **sidebar** - Describes your menu layout. As _Docsify_ is not aware of directory structure so it may not function as you hope without this file.
    - **cover page** - Optional landing page with background image and minimal text.
2. Update your Github repo's config so that you will get a Github Pages site built from your docs directory. _Docsify_ also works with _Netlify_ as per their docs, but this project just considers the Github Pages case.

Note that this works _without_ editing your existing docs and _without_ building any HTML pages. The rendering is done on the client-side in a single page application, running on _index.html_.


## Quickstart

### Setup

No installation needed. Just a connection to the internet in order to load the _Docsify_ library in the browser.

### Run locally

```bash
$ # Clone with SSH
$ git clone git@github.com:MichaelCurrin/docsify-template.git
$ # Clone with HTTPS
$ git clone https://github.com/MichaelCurrin/docsify-template.git
$ cd docsify-template
$ ./serve.sh
```

Then open http://localhost:3000 in the browser.

User notes:

- When viewing the site, if you scroll down far enough you will see a hamburger menu which lets you dynamically open or close the sidebar.

## Setup your own docs site

The idea is to add to an existing project / git repo, so it is not that useful to create your own project from this repo. So rather copy base structure and configs from this project to your own, then customize them for your needs.

```bash
$ cd <PATH_TO_THIS_REPO>
$ cd docs
```

### Create base structure

```bash
$ cp index.html README.md <PATH_TO_YOUR_REPO>/docs
$ cd <PATH_TO_YOUR_REPO>/docs
$ touch .nojekyll _coverpage.md _sidebar_.md
```

### Configure index page

You can leave the _index.html_ page as it is.

Optionally you can set coverpage and sidebar options to `false`, or delete those rows.

### Configure sidebar

The sidebar is the menu page on the left of the docs and shows on all page.

Use this project's [sidebar](https://raw.githubusercontent.com/MichaelCurrin/docsify-template/master/docs/_sidebar.md) raw file on Github as a reference to edit your own *_sidebar.md* file.

The format should be markdown bullet points which can be nested. Include links to you files - note that paths are relative to docs directory.

With sidebar enabled and not sidebar details set, your index page will use its own page outline as the menu but with no access to subpages. You might even want your entire site to be a single page based on _README.md_, with section headings added to your menu automatically (no need to maintain sidebar).

The top of the side bar will point to the site's root - this will take you to the top of the cover page, rather than the _README.md_. You can create a first item in the sidebar which points to the _README.md_ top element, but that will sort of duplicate having the sidebar heading leading to small confusion for a user.

These approaches were attempted but do not work:

```
# This README in the URL when you click on it.
[Home](README.md#docsify-template)

# This is not a valid ID when clicking from a file other than the _docs/README.md_ file.
[Home](#docsify-template)
```

### Configure cover page

Use this project's [coverpage](https://raw.githubusercontent.com/MichaelCurrin/docsify-template/master/docs/_coverpage.md) raw file on Github as a reference to edit your own *_coverpage.md* file.

You could include a logo image above your project title. For example, you could do this if you have a existent media file.

```
![icon](_media/logo.svg)
```

### Style

How to customize the style of your project.

#### Color

Edit _index.html_.

Set a theme color. Defaults to theme's default if not set - green for Vue and blue for Buble.

This variable affects how some content looks, such as quoted blocks, underlined text and buttons.

```js
window.$docsify = {
  themeColor: '#3F51B5',
};
```

More on Docsify [theme color](https://docsify.js.org/#/configuration?id=themecolor).

#### Themes

Edit _index.html_.

Find the style which is set in the `<head>` tag, which looks like this.

```html
<link rel="stylesheet" href="//unpkg.com/docsify/lib/themes/<THEME>">
```

Replace the end of URL with one of these four themes.

- `vue.css`
- `buble.css`
- `dark.css`
- `pure.css`


You can optionally remove `/lib` from the theme URL to get the _uncompressed_ CSS file.

More on Docsify [themes](https://docsify.js.org/#/themes?id=themes) guide.


## Docsify CLI

The CLI tool is optional. View the Docsify [Quickstart](https://docsify.js.org/#/quickstart) guide to set up the CLI tool and see how to do the following:

- `init`: Setup an initial _README.md_ (duplicated from project root), _index.html_ and _.nojekyll_ in your a target directory such as _docs_. You can do this by hand or using a template if you don't want the CLI to do it for you.
- `serve`: Serve the docs site locally, with hot reload.


## Why not a static site generator?

These are just tools to build a site. What is appropriate depends on your use case, how much you need to customized the site and how much effort you want to spend on installing/running/maintaining the project. I found a static site generator is not a good fit for when I want to build a light docs site around existing docs directories in my projects.

Jekyll and Hugo are options for static site generators which can use themes suited to documentation and they can build off of a docs directory. If you want to read more about those, see my [resources](https://github.com/MichaelCurrin/static-sites-generator-resources) project.

A static site generator can be heavy...

There are dependencies to manage. Such as plugins and themes for _Jekyll_. And plugins for _Hugo_. Plus one or more external _JavaScript_ or _CSS_ files are probably used in the HTML, such as _JQuery_.

There is HTML to build locally and on the remote. While _Docsify_ needs no dependencies to serve a site, _Jekyll_ sites needs `jekyll` installed and _Hugo_ sites need `hugo` available.

A static site needs to to customize it in depth or setup a theme which also takes effort. You may lose or gain functionality when switching between Jekyll themes because they use their own templates and layouts.

You probably have to add _frontm atter_ to your doc files so they can inherit from layouts and have the correct metadata like title.

As with _Docsify_, you will probably have to create a config file which covers the structure of your project for use in the sidebar.

Unlike building static files with HTML, with with Docsify there is a single page application running off of a _index.html_ - on each request, a markdown file is fetched by the client and rendered as HTML with a theme and menu. The performance will depend more on the server when serving static HTML pages (prebuild and serve page on the client) or on the client when using a single page application (build structure on the client).

Also, the _Docsify_ approach will only work if JavaScript is enabled.

The _Docsify_ site says it supports back to Internet Explorer 11, so that at least helps for a wider audience of users.
