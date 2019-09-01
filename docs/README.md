# Docsify Template
> How to build a docs site with _Docsify-JS_ and Github Pages

Convert your docs folder into a pretty docs website using [Docsify-JS](https://docsify.js.org/) and some minimal setup instructions. This project's site is running on _Docsify_.

My own aim is to turn the docs of many of my existing projects into doc sites, with minimal effort to convert them and then maintain them and their dependencies.

_Note: The instructions in this repo are intended for Linux and Mac environments._

![icon](_media/docs_brackets.png)

## How to serve a docs site with Docsify

1. Add a few files to your existing docs folder. You can use this project's files to get you going.
    - **index page** - Homepage of the your docs site. This will setup the app using the _Docsify_ library, set a theme and apply other configurations.
    - **sidebar** - Describes your menu layout. As _Docsify_ is not aware of directory structure so it may not function as you hope without this file.
    - **cover page** - Optional landing page with background image and minimal text.
2. Update your Github repo's config so that you will get a Github Pages site built from your docs directory. _Docsify_ also works with _Netlify_ as per their docs, but this project just considers the Github Pages case.

Note that this works _without_ editing your existing docs and _without_ building any HTML pages. The rendering is done on the client-side in a single page application, running on _index.html_.

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

## Quickstart to run locally

### 1. Install

Clone this repo to your machine using the [steps](#clone-this-repo) above.

No installation is needed. The _Docsify_ library is fetched in the browser - it's fetched remotely so internet connection is needed.

### 2. Run

#### 2.1 Serve

Choose any approach you wish to serve the docs folder. There are many listed [here](https://gist.github.com/willurd/5720255) or choose chose of these:

-   From docs directory.
    ```bash
    $ cd docs
    $ python3 -m http.server 3000
    ```
-   From project root.
    ```bash
    $ docsify serve docs
    ```

Whatever you choose, you might want to add it as a alias in a file like `~/.bashrc` or `~/.alias`.

```bash
alias docs='docsify serve docs'
```

#### 2.2 View

Then open http://localhost:3000 in the browser.

User notes:

- When viewing the site, if you scroll down far enough you will see a hamburger menu which lets you dynamically open or close the sidebar.


## Setup your own docs site

The idea is to add to an existing project / git repo, so it is not that useful to create your own project from this repo.

Follow to steps in this section copy a base structure and configs from this project to your own, then customize them for your needs.

### 1. Get this project locally

Clone this repo to your machine using the [steps](#clone-this-repo) above.

### 2. Create base structure

Navigate to your project's docs directory.

```bash
$ cd <PATH_TO_YOUR_REPO>
$ cd docs
```

Create a file for Github Pages use. This can remain empty - its existence just tells Github Pages to include the underscore files in builds.

```bash
$ touch .nojekyll
```

Copy the template files from this project's _quickstart_ directory to your _own_ project.

```bash
$ cp <PATH_TO_THIS_REPO>/quickstart/* .
```

That will work as a basic doc site if you start serving it now, but continue with the steps below so it is customized for your needs.

See the _Docsify_ [Configuration](https://docsify.now.sh/configuration) page for more detailed customization than covered in this tutorial. There are some useful things there in like adjusting the sidebar levels,  putting a logo in the sidebar or setting your root _README.md_ as your homepage.

### 3. Configure homepage

Edit the homepage (_docs/README.md_) and complete the `TODO` items, using the suggestions in this section.

- Anything outside of your _docs_ directory will **not** be served online. Therefore you might want copy the the content from your project root's _README.md_ to the _docs/README.md_. After that, you might want to make the root _README.md_ very short, if you don't want to worry about keeping two identical files in sync.
- You might want to opt for short _docs/README.md_ file if you prefer to put more documentation in other _docs_ files.
- Note that you are not required to put in links to other docs file within your _docs/README.md_ file. As that is what the _Docsify_ sidebar. If you do put in any links in _docs/README.md_, they must be **relative** to the _docs_ directory such as `file.md`, as absolute URLs such `/docs/file.md` will not work within the _docs_ site.


### 4. Configure menu structure

#### Doc links

If you have put links from one of your doc files to another, you might have to edit your existing doc files to avoid the links breaking when viewed as docs site.

Any references from the project (i.e. start with `docs`  or `/docs` are **not** valid. e.g. `[link](/docs/foobar.md)`.

References should be relative to the docs directory, even if the current file is in a subdirectory. A

If the link is relative to that file, it is fine. You can go up levels if you need to. e.g. `[link](../foorbar.md)`.

#### Sidebar

The sidebar is the menu page on the left of the docs and shows on all pages.

If you **do not** want to configure a sidebar, delete *_sidebar.md* from your _docs_ directory, set the sidebar option to `false` in _index.html and skip to the next section.

If you **do** have files in your _docs_ directory you want to appear in the menu page, then edit the _sidebar.md_ file. The format should be markdown bullet points which can be nested. Include links to you files - note that paths are relative to docs directory.

You can use this project's [sidebar](https://raw.githubusercontent.com/MichaelCurrin/docsify-template/master/docs/_sidebar.md) raw file on Github as a reference. This project does have a valid sidebar and docs directory structure, the sidebar is just disabled in the _index.html_ for the live site, as covered below.

##### Option for sidebar without config

You can have sidebar enabled in _index.html_, but no sidebar config set (empty file or no file). Then your index page will use its **own** page outline as the menu. But with no access to subpages, as _Docsify_ is not aware of them_.

You may even **want** your entire site to be a single page based on _README.md_ content and no other doc files. As you will get the benefit of the look of a single page site and any section headings added to your menu will be added to your menu pane automatically (no need to maintain a sidebar file).

##### Tangent about the button at the top of the sidebar

This is more a note for myself - you can skip this section.

Note that the button at the top of sidebar will point to the site's root. Using a cover page, this will take you to the top of the cover page, rather than the _README.md_. You can create a first item within the sidebar list which points to the _README.md_ top element, but that will sort of duplicate having the sidebar heading leading to small confusion for a user.

These approaches were attempted but do not work:

```
# This README in the URL when you click on it.
[Home](README.md#docsify-template)

# This is not a valid ID when clicking from a file other than the _docs/README.md_ file.
[Home](#docsify-template)
```

### 5. Configure cover page

The cover page can give a clean look with minimal text for someone arriving on your site.

If you want to use it, edit your *docs/_coverpage.md* file and complete the `TODO` items. Use this project's [cover page](https://raw.githubusercontent.com/MichaelCurrin/docsify-template/master/docs/_coverpage.md) raw file on Github as a reference.

Otherwise you can delete the file and disable it in _index.html_.

#### Image

You could include an image (logo, photo) above your project title. For example, you could do this if you have a file in a *docs/_media* directory.

```
![icon](_media/logo.svg)
```

### 6. Style

How to customize the style of your project.

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

Replace the end of URL with one of these four themes.

- `vue.css`
- `buble.css`
- `dark.css`
- `pure.css`

You can optionally remove `/lib` from the theme URL to get the _uncompressed_ CSS file.

More on Docsify [themes](https://docsify.js.org/#/themes?id=themes) guide.


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
