# Docsify Template
> How to build a docs site with _Docsify-JS_ and Github Pages

Convert your docs folder into a pretty docs website using [Docsify-JS](https://docsify.js.org/) and some minimal setup instructions. This project's doc site itself is also running on _Docsify_.

Two main sections of this project:

- [Quickstart local server](#quickstart-local-server) - Get a demo site running.
- [Setup your own docs site](#setup-your-own-docs-site) - Convert your docs directory into a docs site hosted on Github pages. Uses templates files to get up and running with as little effort as possible.

_Note: The instructions in this repo are intended for Linux and Mac environments._

![icon](_media/docs_brackets.png)

## Docsify basics

A _Docsify_ doc site works works _without_ the need to edit your existing docs and _without_ building any HTML pages. The rendering is done on the client-side in a single page application, running on _index.html_.

Files needed to build a docs site with _Docsify_:

- **cover page** - Optional landing page with background color or image and some minimal text.
- **homepage** - First page that a user sees, after the cover page.
- **sidebar** - Describes your menu layout. As _Docsify_ is not aware of directory structure so it may not function as you hope without this file.
- **index page** - Base of the app. This will setup the app using the _Docsify_ library, set a theme and apply other configurations.

Once you have that setup in _docs_ directory and have pushed to Github, you can setup Github Pages serving the _docs_ directory. Note: _Docsify_ also works with _Netlify_ as per their docs, but this project just considers the Github Pages case.

## Get a local copy of this repo

```
$ # Clone with SSH
$ git clone git@github.com:MichaelCurrin/docsify-template.git
$ # Clone with HTTPS
$ git clone https://github.com/MichaelCurrin/docsify-template.git
```

```bash
$ cd docsify-template
```

## Doc links

Instructions for creating valid Docsify links in your markdown files.

The _Docsify_ site is served from the `docs` directory with restrictions on links between files. Therefore you must ensure your markdown files (including the [sidebar](#sidebar)) are valid.

As usual external resource can be linked e.g. `https://example.com`.

## Rules for internal links

Apply these rules to the latter part of markdown URLs such as `[Text](page.md)`.

- Links must always be relative to the `docs` directory and **not** to the file containing the link.
    - e.g. `foo.md`, which becomes `/#/foo`.
    - e.g. `baz/fizz.md`, which becomes `/#/baz/fizz`.
- Links may contain a leading forward slash. This has no effect so can be ignored.
    - e.g. `/foo.md`, which becomes `/#/foo`.
- Links may use an ID.
    - e.g. To link to heading on the homepage, use `#my-project`, which gets converted to `/#/?id=my-project`.
    - e.g. To link to another page, use `foo.md#my-project`.
- Do not reference the `docs` directory in the path. e.g. `/docs/foo.md`
- Do not refer to content outside of the `docs` directory.  e.g. `../README.md`


## Quickstart local server

Follow these steps to setup and run a Docsify project locally.

### 1. Install

Clone this repo to your machine - see the [steps](#get-a-local-copy-of-this-repo) above.

No installation is needed. When the HTML page is opened in the browser, the _Docsify_ library will be fetched from a CDN by the browser.

### 2. Run

#### 2.1 Serve

Start running a local server to preview your site.

Here are some options below, otherwise there is a much longer list [here](https://gist.github.com/willurd/5720255).

-   From docs directory.
    ```bash
    $ cd docs
    $ python3 -m http.server 3000
    $ python2 -m SimpleHTTPServer 3000
    ```
-   From project root.
    ```bash
    $ # Requires Docsify CLI.
    $ docsify serve docs
    ```

You can also add aliases to either your `~/.bashrc` or `~/.aliases` files to make them quick to use across projects.

```bash
alias pserve='python3 -m http.server 3000'
alias docs='docsify serve docs'
```

#### 2.2 View

Then open http://localhost:3000 in the browser.

User notes:

- When viewing the site, if you scroll down far enough you will see a hamburger menu which lets you dynamically open or close the sidebar.


## Setup your own docs site

This tutorial is based on the _Docsify_ [Quickstart](https://docsify.js.org/#/quickstart) guide, but rather than giving snippets of file this tutorial lets you copy entire template files to your project, there are `TODO` items in the templates making it clear what to edit. Plus in the template, there are some useful or pretty configurations which have been set after investigating the configurations guide and trying them out on my own project.

Follow to steps in this section copy a base structure and configs from this project to your own, then customize them for your needs.

### 1. Get this project locally

Clone this template repo to your machine using the [steps](#get-a-local-copy-of-this-repo) above, so you can use it copy files from later.

### 2. Create base structure

1. Navigate to your existing project's `docs` directory.
    ```bash
    $ cd <PATH_TO_YOUR_REPO>/docs
    ```
2. Copy the copy the contents of the template project's _quickstart_ directory to your own project. Note the trailing dot on the first path in order to include hidden files.
    ```bash
    $ cp <PATH_TO_TEMPLATE_REPO>/quickstart/. .
    ```
3. View the contents of the docs directory to see what was added. Note that _Docsify_ provides a `404 - Not found` page for a bad URL so you do not need to.
4. To see what the base site look like, start a server now using a command from the [serve](#21-serve) section. Open the web page URL and keep it open so you can check on it as you make changes in the following sections. If you use the _Docsify_ server, the page will auto refresh on a file save, otherwise you will have to manually refresh.


### 3. Configure homepage

Edit your homepage (_docs/README.md_). Complete the `TODO` items, using the suggestions in this section.

- Anything outside of your _docs_ directory will **not** be served. Therefore you might want copy the the content from your project root's _README.md_ to the homepage. After that, you could make the root _README.md_ very short, if you don't want to worry about keeping two identical files in sync.
- You might want to opt for short homepage file if you prefer to put more documentation in other _docs_ files.
- Note that you are not required to put in links to other docs file within your homepage file. As that is what the _Docsify_ sidebar. If you do put in any links in your homepage, they must be relative to the _docs_ directory, such as `file.md`. See [Doc links](#doc-links) for more info.


### 4. Configure menu structure

If for some reason you do not want a navigation sidebar on the frontend, then you should delete *_sidebar.md* from your _docs_ directory, set the `loadSidebar` option to `false` in _index.html_ and then skip to the next section -  [Configure Cover Page](#5-configure-cover-page)

The sidebar is enabled in _index.html_ of the quickstart. A Docsify site is unaware of project structure, unless you provide it.

#### Auto sidebar

You may choose to display the sidebar, but have it populated automatically from headings on the homepage (_docs/README.md_).

This solution is great if you are happy to move all your doc content into a **single** markdown file, as it means not having to worry about manually updating a navigation bar when you docs change. Especially if you have a many files to manage or they are likely to change in name or structure.

To setup auto sidebar:

1. Delete *_sidebar.md*.
2. Open _index.html_ to edit it.
3. Set `loadSidebar: false` and save.

Warning: If you go for this option without a configured sidebar, do not leave any links in your _docs/README.md_ which refer to other doc files. Although the link may be valid, once you click on the link, the sidebar on that page will reflect the target page rather than the outline of the _docs/README.md_ page, which is inconsistent and jarring behavior.

#### Custom sidebar

You can choose to configure a custom sidebar. This is necessary to link to the multiple doc files.

Guidelines for setting up a sidebar file:

- The format should be bullet points in markdown format.
- Each menu item should be a markdown link e.g. `[Name](link)`. An item may exist on the menu without a link - this is useful for grouping items together under a menu heading.
- The links must be follow restrictions noted above in [Doc links](#doc-links). If the doc files change (e.g. are renamed or moved), you need to remember to update the sidebar config.
- The bullet points may optionally be nested, using indentation. You may create arbitrary indentation in your sidebar, even if all you files are at the same level in the _docs_ directory.


To setup a custom sidebar:

1. Edit the *_sidebar.md* file.
2. Add items using guide above. Example:
    ```markdown
    - [Home](#docsify-template)
    - [Foo](foo.md)
    - [Bar](bar.md)
    - Baz
        * [Fizz](baz/fizz.md)
        * [Foo Bar](baz/foobar.md)
    ```


#### Note on homepage link

The clickable text above the standard sidebar takes you to the cover page. You can scroll down to the homepage (_docs/README.md_), but there are no links on the page to the homepage. Therefore a link to the homepage has been included in the example above.

More specifically, the link is a reference to an anchor tag on the root URL, where anchor tag refers the ID of the homepage heading element.

This ID is created already by _Docsify_. To find it, go to the coverpage, scroll down to the homepage and click on the heading. The URL will be something like `http://localhost:3000/#/?id=docsify-template`. The part we want is the end e.g. `docsify-template`. This is really the text of heading element, which has been made lowercase and hyphenated. Copy this to the sidebar file and prefix it with a hash symbol.

### 5. Configure cover page

The cover page is the first page that a visitor sees before scrolling down to the homepage.

If you want to use it, edit your *docs/_coverpage.md* file and complete the `TODO` items. You can also use this project's [cover page](https://raw.githubusercontent.com/MichaelCurrin/docsify-template/master/docs/_coverpage.md) on Github as a reference.

You can add additional buttons to the bottom of the homepage, but there should be no gaps between the lines in your file. And the last one will be solid while the others will be transparent.

The _Docsify_ site explains how to set a background image or color [here](https://docsify.js.org/#/cover?id=custom-background). A background image should come _after_ the buttons in your file, as _Docsify_ looks for an image there then uses CSS to place the image behind the content and give it faded grey look.

You can delete the cover page and disable it in _index.html_.

#### Image

You could include an image (logo, photo) above your project title. For example, you could do this if you have a file in a *docs/_media* directory.

```
![icon](_media/logo.svg)
```

### 6. Configure Style

Edit _index.html_.

#### 6.1 Color

Optionally set a theme color. This affects how some content looks, such as quoted blocks, underlined text and buttons. This will default to theme's default if not set manually. i.e. green for _Vue_ and blue for _Buble_.

```js
window.$docsify = {
  themeColor: '#3F51B5',
};
```

More on Docsify [theme color](https://docsify.js.org/#/configuration?id=themecolor).

#### 6.2 Themes

Find the style which is set in the `<head>` tag, which looks like this.

```html
<link rel="stylesheet" href="//unpkg.com/docsify/lib/themes/<THEME>">
```

Replace the end of URL with one of these four themes:

- `vue.css`
- `buble.css`
- `dark.css`
- `pure.css`

You can optionally remove `/lib` from the theme URL to get the _uncompressed_ CSS file.

More on Docsify [themes](https://docsify.js.org/#/themes?id=themes) guide.

### 7. Advanced configuration

_This advanced section is optional, so you may skip to [Github Pages](#setup-github-pages-site) section._

The configuration steps above already get you a prettier and more usable site in my opinion than the barebones one which the _Docsify_ `init` command or their _Quickstart_ guide gives you.

For further configuration, look at the _Docsify_ [Configuration](https://docsify.js.org/#/configuration) page.

There are some useful things there in like adjusting the sidebar levels, putting a logo in the sidebar or setting your root _README.md_ as your homepage. There is even a search bar you can add.

If you want know a summary view of what the defaults are for the app on _index.html_, see the _Docsify_ [config.js](https://github.com/docsifyjs/docsify/blob/develop/src/core/config.js) script.

You can customize _index.html_ with a custom favicon if one exists.

```html
<link rel="icon" href="_media/favicon.ico">
```

## Setup Github Pages site

If you followed the steps above, you'll have a locally running docs site.

Now, commit and push the files to Github.

Next, edit your repo's setting on Github. Select the option to serve the `docs` directory of the `master` branch as Github Pages site. When you refresh the settings page, then you will see a link to your site there.

Open the link in the browser.

## Docsify CLI

The CLI tool is optional. It can be used to do the following.

- `docsify init docs`: Setup an initial _README.md_ (duplicated from project root), _index.html_ and _.nojekyll_ in your a target directory. If you don't want the CLI to do it for you, you can create the files by hand or use this project's _quickstart_ directory to get you going.
- `docsify serve docs`: Serve the target directory as docs site locally, with hot reload for if you save any file changes. See [server](#21-serve) options above.

View the Docsify [Quickstart](https://docsify.js.org/#/quickstart) guide for how to install the CLI in your global node packages and then to use it.


## Why not a static site generator?

These are just tools to build a site. What is appropriate depends on your use case, how much you need to customized the site and how much effort you want to spend on installing/running/maintaining the project. I found a static site generator is not a good fit for when I want to build a light docs site around existing docs directories in my projects.

Jekyll and Hugo are options for static site generators which can use themes suited to documentation and they can build off of a docs directory. If you want to read more about those, see my [resources](https://github.com/MichaelCurrin/static-sites-generator-resources) project.

A static site generator can be heavy...

There are dependencies to manage - they might have to be upgraded if their are security vulnerabilities or they are no longer available. Such as plugins and themes for _Jekyll_. And plugins for _Hugo_. Plus you probably need a couple of _JavaScript_ or _CSS_ files that either you or a theme added. Such as _Query_. This _Docsify_ project only needs exactly one _JavaScript_ and one _CSS_ file.

There is HTML to build locally and on the remote. While _Docsify_ needs no dependencies to serve a site, _Jekyll_ sites needs `jekyll` installed and _Hugo_ sites need `hugo` available.

A static site needs to to customize it in depth or setup a theme which also takes effort. You may lose or gain functionality when switching between Jekyll themes because they use their own templates and layouts.

You probably have to add _front matter_ to your doc files so they can inherit from layouts and have the correct metadata like title.

As with _Docsify_, you will probably have to create a config file which covers the structure of your project for use in the sidebar.

Unlike building static files with HTML, with with Docsify there is a single page application running off of a _index.html_ - on each request, a markdown file is fetched by the client and rendered as HTML with a theme and menu. The performance will depend more on the server when serving static HTML pages (prebuild and serve page on the client) or on the client when using a single page application (build structure on the client).

Also, the _Docsify_ approach will only work if JavaScript is enabled.

The _Docsify_ site says it supports back to Internet Explorer 11, so that at least helps for a wider audience of users.

Although SEO crawlers can do better at sites like single page application, _Docsify_ is still said not to be SEO-friendly, compared with static sites where all HTML is pre-rendered.
