# Docsify Template
> How to build a docs site with _Docsify-JS_ and Github Pages

Convert your docs folder into a pretty docs website using [Docsify-JS](https://docsify.js.org/) and some minimal setup instructions. This Docsify Template site is running on _Docsify_.

My own aim is to turn the docs of many of my existing projects into doc sites, with minimal effort to convert them and then maintain them and their dependencies.

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

## Quickstart to run locally

### 1. Install

Clone this repo to your machine using the [steps](#clone-this-repo) above.

No installation is needed. The _Docsify_ library is fetched in the browser - it's fetched remotely so internet connection is needed.

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

You can also add aliases to your `~/.bashrc` or `~/.alias` to make them quick to use across projects.

```bash
alias pserve='python3 -m http.server 3000'
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

See the _Docsify_ [Configuration](https://docsify.now.sh/configuration) page for more detailed customization than covered in this tutorial. There are some useful things there in like adjusting the sidebar levels,  putting a logo in the sidebar or setting your root _README.md_ as your homepage. There is also a search bar you can add to site.

### 3. Configure homepage

Edit the _docs/README.md_ homepage. Complete the `TODO` items, using the suggestions in this section.

- Anything outside of your _docs_ directory will **not** be served online. Therefore you might want copy the the content from your project root's _README.md_ to the _docs/README.md_. After that, you might want to make the root _README.md_ very short, if you don't want to worry about keeping two identical files in sync.
- You might want to opt for short _docs/README.md_ file if you prefer to put more documentation in other _docs_ files.
- Note that you are not required to put in links to other docs file within your _docs/README.md_ file. As that is what the _Docsify_ sidebar. If you do put in any links in _docs/README.md_, they must be **relative** to the _docs_ directory such as `file.md`, as absolute URLs such `/docs/file.md` will not work within the _docs_ site.


### 4. Configure menu structure

#### Doc links

If you have put links from one of your doc files to another, you might have to edit your existing doc files to avoid the links breaking when viewed as docs site.

References should be relative to the _docs_ directory not to the file itself, even if a file is inside a directory within _docs_. This is unlike the expected of markdown.

Any link references which start as `docs/file.md`  or `/docs/file.md` will cause errors, because the server is only aware of directories within _docs_.

#### Sidebar

The sidebar is the menu page on the left of the docs and shows on all pages.

If you **do not** want to configure a sidebar, delete *_sidebar.md* from your _docs_ directory, set the sidebar option to `false` in _index.html_ and skip to the next section.

If you **do** have files in your _docs_ directory you want to appear in the menu page, then edit the *_sidebar.md* file. The format should be markdown bullet points which can be nested. Include links to you files - note that paths are relative to docs directory.

Here is an example sidebar config:

```markdown
- [Foo](foo.md)
- [Bar](bar.md)
- Baz
    * [Fizz](baz/fizz.md)
    * [Foo Bar](baz/foobar.md)
```

##### Sidebar without config

You could have a sidebar enabled in _index.html_, but without sidebar config set (empty file or no file). Then your index page will use its **own** page outline as the menu. But with no access to subpages, as _Docsify_ is not aware of them_.

You may even **want** your entire site to be a single page based on _README.md_ content and no other doc files. As you will get the benefit of the look of a single page site and any section headings added to your menu will be added to your menu pane automatically (no need to maintain a sidebar file).

##### Link to homepage

The button at the top of sidebar is a link to site's root path. This will be the cover page, if you have one.

If you a menu button which takes you to the homepage rather, add an item which has a reference to the root path plus with the ID of the heading of _docs/README.md_.

e.g.

```
- [Home](/#my-project)
```

### 5. Configure cover page

The cover page is the first page that a visitor sees before scrolling down to the homepage.

If you want to use it, edit your *docs/_coverpage.md* file and complete the `TODO` items. You can also use this project's [cover page](https://raw.githubusercontent.com/MichaelCurrin/docsify-template/master/docs/_coverpage.md) on Github as a reference.

The _Docsify_ site explains how to set a background image or color [here](https://docsify.now.sh/cover?id=custom-background).

You can delete the cover page and disable it in _index.html_.

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
