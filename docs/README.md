# Docsify Template
> Live demo of a light docs site built on _Docsify-JS_ and running on Github Pages

Demo site: [link](https://michaelcurrin.github.io/docsify-template/#/).

Convert your docs folder into a pretty docs website using [Docsify-JS](https://docsify.js.org/) and some minimal setup. This project can be used as a template or reference for your own.


## Basics to get a site working

1. Add a few files to your existing docs folder. You can use this project's files to get you going.
    - **index page** - Homepage of the your docs site. This will setup the app using the _Docsify_ library, set a theme and apply other configurations.
    - **sidebar** - Describes your menu layout. As _Docsify_ is not aware of directory structure so it may not function as you hope without this file.
    - **cover page** - Optional landing page with background image and minimal text.
2. Update your Github repo's config so that you will get a Github Pages site built from your docs directory. _Docsify_ also works with _Netlify_ as per their docs, but this project just considers the Github Pages case.

Note that this works _without_ editing your existing docs and _without_ building any HTML pages. The rendering is done on the client-side in a single page application, running on _index.html_.

## Setup a site

Since the idea is to add to an existing project, is it not that useful to create your own project from this repo. But you should copy the sample files from this project in your own project's docs directory.

### Copy files

TBC

### Configure index page

TBC

### Configure sidebar

Note file paths are relative to docs directory.

With sidebar enabled and not sidebar details set, your index page will use its own page outline as the menu but with no access to subpages.

The top of the side bar will point to the site's root - this will take you to the top of the cover page, rather than the _README.md_. You can create a first item in the sidebar which points to the _README.md_ top element, but that will sort of duplicate having the sidebar heading leading to small confusion for a user.

### Configure cover page

TBC

### Style

Edit _index.html_.

#### Color

Set a theme color. Defaults to theme's default if not set - green for Vue and blue for Buble.

This variable affects how some content looks, such as quoted blocks, underlined text and buttons.

```js
window.$docsify = {
  themeColor: '#3F51B5',
};
```

More on Docsify [theme color](https://docsify.js.org/#/configuration?id=themecolor).

#### Themes

Choose a style you like.

Options:

- `vue.css`
- `buble.css`
- `dark.css`
- `pure.css`

`<link rel="stylesheet" href="//unpkg.com/docsify/lib/themes/<THEME>.css">`

Remove `lib/` from the theme URL to get the uncompressed CSS file.

More on Docsify [themes](https://docsify.js.org/#/themes?id=themes) guide.


### Docsify CLI

View the Docsify [Quickstart](https://docsify.js.org/#/quickstart) guide for instructions on setting up the CLI tool and running a site.

The CLI tool is optional and is useful for the following:
- Setup an initial _README.md_ (duplicated from project root), _index.html_ and _.nojekyll_ in your a target directory such as _docs_. You can do this by hand or using a template if you don't want the CLI to do it for you.
- Serve the docs site locally, with hot reload.


## Why not a static site generator?

If you were using a static site generator like Jekyll, you might have to add front matter to your docs, in addition to setting Jekyll config for theme and menu layout.

Also, with a static site generator you would build HTML files to serve, while with Docsify there is a single page application running off of a _index.html_ - on each request, a markdown file is fetched by the client and rendered as HTML with a theme and menu.
