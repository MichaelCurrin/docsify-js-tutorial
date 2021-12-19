# DocsifyJS Tutorial
> Build a Markdown-based docs site using _DocsifyJS_ and _GitHub Pages_

[![GitHub tag](https://img.shields.io/github/tag/MichaelCurrin/docsify-js-tutorial?color=3271a8)](https://GitHub.com/MichaelCurrin/docsify-js-tutorial/tags/)
[![stars - docsify-js-tutorial](https://img.shields.io/github/stars/MichaelCurrin/docsify-js-tutorial?style=social)](https://github.com/MichaelCurrin/docsify-js-tutorial)
[![forks - docsify-js-tutorial](https://img.shields.io/github/forks/MichaelCurrin/docsify-js-tutorial?style=social)](https://github.com/MichaelCurrin/docsify-js-tutorial)

[![Made with Docsify latest](https://img.shields.io/npm/v/docsify?label=docsify&color=3271a8)](https://docsify.js.org/ "Go to Docsify homepage")


Convert your **docs** folder into a pretty and modern docs website, built around your Markdown content and a theme. 

Using a JavaScript library called "DocsifyJS", this tutorial shows you how by doing some light set up. This can all be done on the GitHub and is simple enough for those without JavaScript experience and does not require using Node.

?> See [docsify.js.org](https://docsify.js.org/) homepage or the [docsify](https://www.npmjs.com/package/docsify) package on NPM.

Unlike other JavaScript-based frameworks, DocsifyJS needs just a few lines of JavaScript as configuration and the rest of your content is mostly Markdown and YAML. It is built on Vue, but you don't need to know anything about Vue to get the benefits.

This project's site itself is also running on _DocsifyJS_. :tada:

Start below with the basics, or skip to the later sections with the sidebar to get to menu customization, plugins and styling.

Code snippets and recommendations are provided here as kind of cheatsheet or cookbook, so you don't have to spend a lot of time pouring over all the possible options and features covered in the docs that you probably don't need to know.

?> _DocsifyJS_ is sometimes just called _Docsify_ in this guide. Also known as _Docsify.js_.

View the source for this tutorial site, which is also built using Docsify:

[![MichaelCurrin - docsify-js-tutorial](https://img.shields.io/static/v1?label=MichaelCurrin&message=docsify-js-tutorial&color=3271a8&logo=github)](https://github.com/MichaelCurrin/docsify-js-tutorial "Go to DocsifyJS Tutorial repo on GitHub")


## Purpose of this tutorial

This project is for you if you answer _yes_ to any of the following:

- Are you new to making a docs site?
- Tired of writing HTML/CSS/JS and just want to write docs using plain Markdown?
- What is DocsifyJS?
- Want to add features and style to your DocsifyJS site?
- Looking for a template which is based on real world use?
- Can I make a build a docs site without having a build step?


## Set up a _Docsify_ site to run

This project provides three approaches for choosing a Docsify site to run:

- Use the [Quickstart local server](#quickstart-local-server)
    - Clone this repo and start serving the docs repo immediately.
- [Set up your own docs site](#setup-your-own-docs-site) from scratch.
    - Convert your _docs_ directory into a docs site hosted on GitHub Pages. Copy from some templates files to get up and running with as little effort as possible.
- Use my [DocsifyJS Template](https://github.com/michaelcurrin/docsify-js-template/) repo
    - A minimal template which goes with this tutorial.
    - Click [Use this template](https://img.shields.io/badge/Use_this_template-green.svg?style=for-the-badge) to add a copy to you own repos. you'll be able to starting serving a site on GitHub Pages or locally.

_Note: The instructions in this repo are intended for Linux and macOS environments._


## _Docsify_ in action

Some docs site I have built. These give you an idea of content, layout and customization

- [unicron](https://michaelcurrin.github.io/unicron/#/)
- [twitterverse](https://michaelcurrin.github.io/twitterverse/#/)
- [python-twitter-guide](https://michaelcurrin.github.io/python-twitter-guide/#/)


## Why use _Docsify_?

My requirement was to build a docs site with minimal file/dependency set up and to use existing docs directories, without restructuring or formatting the docs. I found _Docsify_ is ideal for this.

I like that once I have the HTML set up that Incan focus on markdown content and writing a menu using YAML. And there is no build step. Its just a HTML and external JS as static assets. Just deploy to GH Pages or elsewhere.

When you use _Docsify_ with its defaults or very simple tweaks, you get a pretty UI with menus, themes, mobile functionality and a cover page. Page loads are seamless in the app shell, as it is a SPA. These are things that take more effort and code changes or additions, if you want to do them with static-site generators. _Docsify_ also had documentation as its main purpose, unlike some other tools.

There are some downsides like _Docsify_ does not have static site support yet (which makes it weak for SEO rankings) and there are only 4 themes, which are just color scheme changes. And the dark one doesn't have good contrast for certain things.

![icon](_media/docs_brackets.png)

This great [article](https://dev.to/evilmartians/keeping-oss-documentation-with-docsify-lefthook-and-friends-11e5) on dev.to covers a journey from README to Wiki to Jekyll and finally _Docsify_, if you are interested to compare those.


## Resources
> Docs and Docsify-related links

### My projects

- [DocsifyJS Tutorial](https://github.com/michaelcurrin/docsify-js-tutorial/) repo on GitHub.
- [DocsifyJS Template](https://michaelcurrin.github.io/docsify-js-template/) project.
- [MkDocs Quickstart](https://michaelcurrin.github.io/mkdocs-quickstart/) project
    - As an alternative to Docsify, try this demo / tutorial / template around MkDocs.

### Official Docsify repos

- Docsify main repo - [docsifyjs/docsify](https://github.com/docsifyjs/docsify)
- Docsify CLI repo - [docsifyjs/docsify-cli](https://github.com/docsifyjs/docsify-cli)


## _Docsify_ basics

This is where the tutorial starts - with an intro to _Docsify_.

A _Docsify_ site works works _without_ the need to edit your existing docs and _without_ building any HTML pages. The rendering is done on the client-side in a single page application, running on _index.html_.

### Structure

Main components of a _Docsify_ site:

- **cover page**
    - Optional.
    - Landing page with background color or image and some minimal text.
- **homepage**
    - First page that a user sees, after the cover page. This is a content page written in markdown and it could be the only page of your site if you like.
- **index page**
    - HTML file base of the app.
    - This includes JS and CSS calls for setting up and styling the _Docsify_ app. Plus some JS code which you set to customize the app.
- **sidebar config**
    - Optional.
    - Describes the menu layout for the **left sidebar**, using custom ordering and nested structure. _Docsify_ is not aware of directory structure, so this is where you get to define your menu. Alternatively, let _Docsify_ fill the sidebar for you, based on the structure of your homepage (`docs/README.md`) file - this works best if you only have a single content Markdown page. If you have multiple pages each with their own auto sidebar, you can us the _navbar_ (top of the screen) to switch between them.
- **navbar config**
    - Optional.
    - Describes the menu layout for the **top right menu**.

Once you have that set up in _docs_ directory and have pushed to GitHub, you can set up GitHub Pages serving the _docs_ directory. Note: _Docsify_ also works with _Netlify_ as per their docs, but this project just considers the GitHub Pages case.

### Linking to pages

Instructions for creating valid _Docsify_ links in your markdown files.

The _Docsify_ site is served from the `docs` directory with restrictions on links between files. Therefore you must ensure your markdown files (including the [sidebar](#sidebar)) are valid.

As usual external resource can be linked e.g. `https://example.com`.

#### Rules for internal links

DocsifyJS will render Markdown links in your docs as appropriate paths in the DocsifyJS structure.

Apply these rules to the target part of markdown URLs `[Text](target.md#some-id)`.

- Links must always be relative to the `docs` directory and **not** to the file containing the link.
    - e.g. `foo.md`, which becomes `/#/foo`.
    - e.g. `baz/fizz.md`, which becomes `/#/baz/fizz`.
- Links may contain a leading forward slash. This has no effect so can be ignored.
    - e.g. `/foo.md`, which becomes `/#/foo`.
- Links may use an ID.
    - e.g. To link to heading on the homepage, use `#my-project`, which gets converted to `/#/?id=my-project`.
    - e.g. To link to another page, use `foo.md#my-project`, which becomes `/#/foo?idmy-project` (note no path extension).
- Do **not** reference the `docs` directory in the path. e.g. `/docs/foo.md`
- Do **not** refer to content outside of the `docs` directory.  e.g. `../README.md`.
- If you use relative links between files in the `docs` directory - make sure to enable this in the app config.

#### Subdirectory links

Warning. In the default mode, if you want to link to `my-dir/README.md`, this will **not** work as expected.

```markdown
[My text](my-dir/)
```

It will become equivalent to this.

```markdown
[My text](/#/my-dir)
```

Which will be a broken URL. Or weird looking e.g. `/?id=docsify-cli#/vue-integration/`.

If you are linking to a file in a directory like `my-dir

Get around this by using an HTML link.

```html
<a href="my-dir/">My text</a>
```

Or by adding a forward slash - which might break your site like on GitHub Pages subpath sites.

```markdown
[My text](/my-dir/)
```

If you switch to history [Router Mode](#router-mode), this won't matter.

#### HTML links

It's best to avoid using HTML tags with hyperlinks and rather use Markdown where possible.

HTML tag hyperlinks will be rendered literally and so will **break** in the _Docsify_ path structure e.g. `href="foo.md"` is bad. But `[](foo.md)` is good.

You can set them up manually, which makes them harder to maintain if your site structure changes. e.g. `href="/#/id=my-project"` or `href="/#/foo.md?id=my-project"`.

Also note that the root prefix is needed for _Docsify_ paths to work, but you'll also need to hard-code your repo name in which is fragile too. e.g. `href="/my-repo/#/id=my-project"`


## Quickstart local server
> Serve an existing project locally

Follow these steps to set up and run an existing _Docsify_ project locally. In this case, we get a local copy of this _DocsifyJS Tutorial_ project and serve it.


### 1. Install

Clone this repo to your machine with one of these commands:

```bash
$ # Clone with SSH:
$ git clone git@github.com:MichaelCurrin/docsify-js-tutorial.git

$ # Clone with HTTPS:
$ git clone https://github.com/MichaelCurrin/docsify-js-tutorial.git
```

?> **Note:** No installation is needed. When the HTML page is opened in the browser, the _Docsify_ library will be fetched from a CDN by the browser.

[run_docsify_locally.md](//gist.githubusercontent.com/MichaelCurrin/4c8060dcc9d8841f842eeebc7a1436d8/raw/run_docsify_locally.md ':include')


?> **Note** When viewing the site, if you scroll down far enough you will see a hamburger menu which lets you dynamically open or close the sidebar. This is always visible on mobile view but not so easy to find, while the sidebar starts out closed on mobile.


## Set up your own docs site
> Convert your docs directory into a docs site

This tutorial is based on the _Docsify_ [Quickstart](https://docsify.js.org/#/quickstart) guide, but rather than giving snippets of file this tutorial lets you copy entire template files to your project, there are `TODO` items in the templates making it clear what to edit.

Plus, in the template, there are some useful or pretty configurations which have been set after investigating the configurations guide and trying them out on my own project.

Follow to steps in this section copy a base structure and configs from this project to your own, then customize them for your needs.


### 1. Create base structure

The repo has an accompanying [DocsifyJS Template](https://github.com/MichaelCurrin/docsify-js-template) repo. Follow instructions in that project's root README to copy the base project to your own project's docs. Note this will **overwrite** any existing files in docs, so make sure you have them backed up or any version control.

Next, view the contents of the docs directory to see what was added.

?> Note that _Docsify_ provides a `404 - Not found` page for a bad URL so you do not need to create a 404 page yourself.

?> The minimum you'll need for your docs site is a `README.md` - either your own or the one copied from above. If you have any other markdown files or folders in your `docs` directory, leave them there are they will also be used for your site.

To see what the base site look like, start a server now using a command from the [serve](#21-serve) section. Open the web page URL and keep it open so you can check on it as you make changes in the following sections. If you use the _Docsify_ server, the page will auto refresh on a file save, otherwise you will have to manually refresh.


### 2. Configure homepage

Edit your homepage (_docs/README.md_). Complete the `TODO` items, using the suggestions in this section.

- Anything outside of your _docs_ directory will **not** be served. Therefore you might want copy the the content from your project root's _README.md_ to the homepage. After that, you could make the root _README.md_ very short, if you don't want to worry about keeping two identical files in sync.
- You might want to opt for short homepage file if you prefer to put more documentation in other _docs_ files.
- Note that you are not required to put in links to other docs file within your homepage file. As that is what the _Docsify_ sidebar. If you do put in any links in your homepage, they must be relative to the _docs_ directory, such as `file.md`. See [Doc links](#doc-links) for more info.


### 3. Configure navbar

Optionally define a menu for the top right of the page.

See [Custom navbar](https://docsify.js.org/#/custom-navbar) and [loadNavbar](https://docsify.js.org/#/configuration?id=loadnavbar) in the docs.

?> **Note:** If you enable a cover page and the navbar, the navbar will appear on the cover page. This makes it difficult to navigate as you have to scroll up all the time to get the navbar. Also, if not using a cover page, the navbar will cover the homepage heading but only on a mobile device. Some CSS is needed to fix both of these issues, not covered here. Alternatively, use `mergeNavbar: true,` if your app config to move the navbar items to the top of the sidebar on a mobile view. This works great.


### 4. Configure sidebar

It's best to include a sidebar. You let it be defined automatically from a file's structure, or you can define a sidebar using an ordered description of pages (which may be nested).

See [loadSidebar](https://docsify.js.org/#/configuration?id=loadsidebar) in the docs.

#### Auto sidebar

You may choose to display the sidebar, but have it populated automatically from headings on a single HTML file - the homepage (_docs/README.md_). This is the way that this project's own docs site is set up.

This solution is great if you are happy to move all your doc content into a **single** large markdown file, as it means not having to worry about manually updating a navigation bar when you docs change. Especially if you have a many files to manage or they are likely to change in name or structure.

You can also have multiple markdown files in folders, each group with its own sidebar config.

To set up auto sidebar:

1. Delete *_sidebar.md*.
2. Open _index.html_ to edit it.
3. Set `loadSidebar: false` and save.

!> **Warning:** If you go for this option without a configured sidebar, do not leave any links in your _docs/README.md_ which refer to other doc files. Although the link may be valid, once you click on the link, the sidebar on that page will reflect the target page rather than the outline of the _docs/README.md_ page, which is inconsistent and jarring behavior.


#### Custom sidebar

You can choose to configure a custom sidebar. This is necessary to link to the multiple doc files.

##### Guidelines

How to set up a sidebar file:

- The format should be bullet points in markdown format.
- Each menu item should be a markdown link e.g. `[Name](link)`. An item may exist on the menu without a link - this is useful for grouping items together under a menu heading.
- The links must be follow restrictions noted above in [Linking to pages](#linking-to-pages). If the doc files change (e.g. are renamed or moved), you need to remember to update the sidebar config.
- The bullet points may optionally be nested, using indentation. You may create arbitrary indentation in your sidebar, even if all you files are at the same level in the _docs_ directory.

Example:

[\_sidebar.md](https://raw.githubusercontent.com/MichaelCurrin/docsify-js-tutorial/master/nested-example/_sidebar.md ':include :type=code')

?> The sidebar is a markdown file, so you can styling as a `**Title**`.

##### Set up custom sidebar

1. Ensure `loadSidebar: true` is set in the _index.html_ file.
    - The value of `true` means `*_sidebar.md*` will be referenced by the app.
    - The sidebar is already enabled in the quickstart [index.html](https://github.com/MichaelCurrin/docsify-js-tutorial/blob/master/quickstart/index.html).
2. Edit the *_sidebar.md* file.
3. Add items using the guidelines above.

##### Note on Home link

The clickable text above the standard sidebar takes you to the cover page. You can scroll down to the homepage (`docs/README.md`), but there are no links on the page to the homepage. So add a link to the Homepage with a first entry at the top.

Example of a link to the page page, using root page path and ID of the heading on the homepage.

```markdown
- [Home](/#my-app)
```

Parts:

- Root path (`/`)
    - The leading forward slash is **required** here for correct behavior to get to the homepage as root page. As the anchor tag will be invalid on other pages such as `foo.md` which has path `/#/foo/`).
- Homepage heading ID (e.g. `#my-app`)
    - This is the ID of the heading on the Homepage (README.md).
    - The ID follows the markdown style of headings as slugs (lowercase and hyphens).
    - You can also find the ID on page directly if you aren't sure.. Go to the coverpage, scroll down to the homepage and click on the heading. The URL will be something like `http://localhost:3000/#/?id=my-app`. The part we want is the end e.g. `my-app`.

This is really the text of heading element, which has been made lowercase and hyphenated. Copy this to the sidebar file and prefix it with a hash symbol.

?> **Note:** An alternative would be use the top right nav bar to point to the Homepage, rather than sidebar as here.


### 5. Configure cover page

Docsify provides a cover page - a simple page that a visitor sees before scrolling down to the homepage which has centered text, a background and a summary of your application.

If you want to use it, make sure `coverpage: true` is set in your app config.

Then create and edit a *docs/_coverpage.md* file. You can also use the template project's [cover page](https://raw.githubusercontent.com/MichaelCurrin/docsify-js-template/master/docs/_coverpage.md) on GitHub as a reference.

You can add additional buttons to the bottom of the homepage, but there should be no gaps between the lines in your file. And the _last_ one will be solid while the others will be transparent.

You can delete the cover page and disable it in _index.html_.

#### Cover background image

You can change the background image for your cover page.

If you do not set a cover background, you'll just get a **random** one on every page load - it might be a solid color or a gradient.

The _Docsify_ site explains how to set a background image or color [here](https://docsify.js.org/#/cover?id=custom-background).

Your background image code should come at the **end** of your coverpage file. As _Docsify_ looks for an image there then uses CSS to place the image behind the content and give it a faded grey look.

See code examples below for adding a custom background image:

- Solid color. The text label **must** be the word `color`.
    ```markdown
    ![color](#f0f0f0)
    ```
- Gradient color.
    - Choosing a custom gradient was supported but does **not** work anymore, so it is not covered here.
- Image. The text label can be anything - use some fallback text in case the image is broken.
    ```markdown
    ![Cover background image](_media/cover-bg.jpg)
    ```
    
You probably want to set the `themeColor` in the `index.html` to go well with your coverpage. See [Theme color](#6.1-theme-color) below.

e.g. This tutorial has a grey value for cover and blue value for theme color.

#### Cover logo

You could include an image (logo, photo) above your project title. For example, you could do this if you have a file in a *docs/_media* directory.

```markdown
<!-- background image -->

![icon](_media/logo.svg)
```

### 6. Configure Style

Edit `index.html`.

Not covered here - see [jhildenbiddle/docsify-themeable](https://github.com/jhildenbiddle/docsify-themeable) for more control on custom styling and theming.

#### 6.1 Theme color

Optionally set a theme color. This affects how some content looks, such as quoted blocks, underlined text and buttons. This will default to theme's default if not set manually. i.e. green for _Vue_ and blue for _Buble_.

```javascript
window.$docsify = {
  themeColor: '#3F51B5',
};
```

More on Docsify [theme color](https://docsify.js.org/#/configuration?id=themecolor).

#### 6.2 CSS Themes

Find the style which is set in the `<head>` tag, which looks like this.

```html
<link rel="stylesheet" href="//unpkg.com/docsify/lib/themes/<THEME>">
```

Replace the end of URL with one of these four themes. They have the same layout but different colors.

- `vue.css`
- `buble.css`
- `dark.css`
- `pure.css`

?> You can optionally remove `/lib` from the theme URL to get the _uncompressed_ CSS file.

Read more on the _Docsify_ [themes](https://docsify.js.org/#/themes?id=themes) guide.

Note: The _Buble_ theme has sidebar headings which are not distinguished from the sub items. Therefore you can add this to _index.html_ to get bold headings similar. Based on _vue.css_.

```html
<style>
  .sidebar .sidebar-nav>ul>li {
    font-weight: 700;
    margin: 0;
  }
</style>
```

### 6.3 More styling

You can easily reuse the theme color set early:

```css
.myButton {
  background-color: var(--theme-color);
}
```

Here is a some useful button styling I added to a site. The [Bess CSS Button Generator](https://www.bestcssbuttongenerator.com/) site was useful for discovering some attributes.

```css
.myButton {
    background-color: var(--theme-color);
    color: white;
    /* Slightly larger */
    font-size: 1.0em;
    /* Round the edges */
    border-radius: 8px;
    padding: 6px 12px;
    /* Change cursor on hover */
    cursor: pointer;
}
.myButton:hover {
    filter: brightness(110%)
}
/* Shift the button down on click */
.myButton:active {
    position:relative;
    top: 2px;
}
```

### 7. Advanced configuration

The configuration steps above already get you a prettier and more usable site in my opinion than the barebones one which the _Docsify_ `init` command or their _Quickstart_ guide gives you. This section covers advanced steps - you may skip these and jump straight to the [GitHub Pages](#setup-github-pages-site) section.

#### App configuration

You can update the config parameters passed in on the _index.html_ page. There are some useful things there in like adjusting the sidebar levels, putting a logo in the sidebar or setting your root _README.md_ as your homepage. There is even a search bar you can add.

**Links**

- For available parameters, these are documented on the _Docsify_ [Configuration](https://docsify.js.org/#/configuration) page.
- For defaults, see the _Docsify_ repo's [src/core/config.js](https://github.com/docsifyjs/docsify/blob/develop/src/core/config.js) script.
- To see an app config in use, see [index.html](https://gi?id=twitter-policiesthub.com/MichaelCurrin/docsify-js-template/blob/master/docs/index.html) of DocsifyJS Template project.


**Sidebar**

Config options relating to the sidebar. Default values are shown here.

```js
window.$docsify = {
    // Recommended to set this to true - when transitioning between pages,
    // it can look weird if you don't get to the top of the page.
    auto2top: false

    // Maximum sidebar depth.
    maxLevel: 6,

    // How many sub levels to show in the sidebar.
    // This is useful for precision for a custom sidebar, but you can leave this out.
    // Try a value of 2 to add subheadings. This is particularly useful if you have
    // a lot of headings on a page.
    subMaxLevel: 0,

    // Add your logo to the top of our sidebar menu.
    logo: '/_media/icon.svg',

    // Name which appears at the top of the sidebar.
    name: 'docsify'
};
```

**Homepage**

Configure the homepage settings. You might not need this, but in case you want to use a different homepage target. These recommendations come from the docs.

```javascript
window.$docsify = {
    // Change to /home.md rather than /README.md file.
    homepage: 'home.md',

    // Specify the README.md at the root of your repo, rather than in the docs directory.
    homepage: 'https://raw.githubusercontent.com/docsifyjs/docsify/master/README.md'
};
```

#### Set favicon

You can use a custom _favicon_, if you added one.

Add this to the `head` tag in `index.html`.

```html
<link rel="icon" href="_media/favicon.ico">
```

#### Add scripts

To run your own script tags, you must enable it with a parameter.

- `index.html
    ```javascript
    window.$docsify = {
        executeScript: true,
    }
    ```
- `page.md`
    ```html
    <script>
        console.log('My script');
    </script>
    ```

Note that Vue is enabled by default.

See [executeScript](https://docsify.js.org/#/configuration?id=executescript) in the docs for more info.

If you want to run an external script, using the [External script plugin](#add-plugins).

- `index.html`
    ```html
    <script src="//cdn.jsdelivr.net/npm/docsify/lib/plugins/external-script.min.js"></script>
    ```
- `page.md`
    ```html
    <script src="main.js"></script>
    ```

Note that this does _not_ support embedding gists, even if use `executeScript`. There is a JS error on running `document.write` on an asynchronously loaded script.

#### Add plugins

Optionally add plugins to extend your site. This is typically done by adding a JS link at the bottom of your `index.html` page.

Here is a narrowed down list of plugins of interest:

| Plugin                                                                   | Description                                                                                     |
| ------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------- |
| [External script](https://docsify.js.org/#/plugins?id=external-script)   | You need thus plugin if you want to place a `script` tag on the page that loads a `.js` script. |
| [Google Analytics](https://docsify.js.org/#/plugins?id=google-analytics) | Configure the app with your GA ID to add tracking.                                              |
| [Tabs](https://docsify.js.org/#/plugins?id=tabs)                         | A Docsify.js plugin for displaying tabbed content from markdown.                                |

Also of interest:

- For pulling in JSON data and not just markdown files:
    - [bandorko/docsify-variables](https://github.com/bandorko/docsify-variables)
    - [kissybnts/docsify-json-variables](https://github.com/kissybnts/docsify-json-variables) or on [npm](https://www.npmjs.com/package/docsify-json-variables)
- The DocsifyJS site covers long lists of plugins and how to use them:
    - [List of Plugins](https://docsify.js.org/#/plugins?id=list-of-plugins)
    - [Awesome plugins](https://docsify.js.org/#/awesome?id=plugins)

##### Use the Edit on GitHub plugin

Load and configure this plugin to add the `Edit on GitHub` link in the top right of each page (excluding the cover page).

- [njleonzhang/docsify-edit-on-github](https://github.com/njleonzhang/docsify-edit-on-github) on GitHub.


Load this plugin inside the `head` tag. 

```html
<script src="//unpkg.com/docsify-edit-on-github/index.js"></script>
```

Then your configuration set up in the `body` tag will using a vlue set by the script.

Configure the plugin in the `body`. See below.

**Basic usage**

Function call:

```javascript
EditOnGitHubPlugin.create(docBase)
```

Here we just use one argument and ignore rest.

Arguments:

- `docBase`
    - Required.
    - It should be a full URL to the **document folder** of your GitHub project.
    - Here is the general form - use your own repo details and typically `BRANCH` is `master` and `DIRECTORY` is `docs`.
        ```
        https://github.com/USERNAME/REPONAME/blob/BRANCH/DIRECTORY/
        ```
    - Example based on this repo:
        ```javascript
        const docBase = 'https://github.com/MichaelCurrin/docsify-js-tutorial/blob/master/docs/';

        EditOnGitHubPlugin.create(docBase);
        ```

Full example:

```javascript
const repo = 'https://github.com/MichaelCurrin/docsify-js-tutorial';

window.$docsify = {
    name: 'DocsifyJS Tutorial',
    repo: repo,

    plugins: [
        EditOnGitHubPlugin.create(
            repo + '/blob/master/docs/'
        )
    ],
};
```

?> Note that `repo` is defined first and then used in two places. This makes the code easy to maintain as it avoids duplication.

?> Note that plugins are generally not defined on app config inside the `plugins` field, but it applies here at least. Docsify handles it [here](https://github.com/docsifyjs/docsify/blob/develop/src/plugins/front-matter/index.js).

Then save and view the site.

**Advanced usage**

Function call:

```javascript
EditOnGitHubPlugin.create(docBase, docEditBase, title)
```

Arguments:

- `docBase`
    - As in above section.
- `docEditBase`
    - Optional - defaults to the first argument if not set.
- `title`
    - Optional - defaults to `'Edit on github` (unfortunately lowercase).
    - Set to override the message. e.g. `'Improve this page'` or `'Edit on GitHub'` or `'📝 Edit this page'`.
    - Example:
        ```javascript
        EditOnGitHubPlugin.create(
           repo,
           null,
           'Improve this page'
        );
        ```

#### Router mode

See [Router mode](https://docsify.js.org/#/configuration?id=routermode) in the docs.

The default is hash.

```javascript
window.$docsify = {
  routerMode: 'hash'
};
```

This gives URLs like:

- `/#/about`

The advantage is that navigating between pages does _not_ trigger an entire refresh of the page (and a white screen for a bit)

But, if you want slash URLs without the reload, you can configure Docsify to do this.

This relies on the the browser's HTML5 History API, so won't work in older browsers.

```javascript
window.$docsify = {
  routerMode: 'history'
};
```

Then your paths will be like:

- `/about`

The JS will push state to the browser to control navigation, avoiding a reload.

?> This can make things weird with the Docsify dev server when saving a file and refreshing but this should be okay on a deployed site.

The caveat is that any bad URLs will not fallback to the app, going server error page. And clicking on an external URL to get to your site will also break.

So you need to accept that and check your links carefully or you need to configure a page routing on Nginx or Netlify for example, to handle your routing properly (see Vue Router docs). GitHub Pages unfortunately does not let you configure that.

When it comes to converting your site to a static site for SEO benefit, this is something that is worth setting.

<!-- (I wish I'd know about this at the point when I tried that the first time) -->


## Set up GitHub Pages site

If you followed the steps above, you'll have a locally running docs site.

Now, commit and push the files to GitHub.

Next, edit your repo's setting on GitHub. Select the option to serve the `docs` directory of the `master` branch as GitHub Pages site. When you refresh the settings page, then you will see a link to your site there.

Open the link in the browser.

- [localhost:3000](http://localhost:3000)

To make the most of Docsify, update your content using the next section.


## Write content
> How to update and add to the content of your doc files so that they work well in Docsify


### Embed

You can embed content such as 

- Media - video, audio, iframes (`.html`)
- Code that appears as a code block
- Markdown or HTML that gets rendered on the page seamlessly.

#### Embed format

Add the `":include"` parameter in a markdown URL reference. Here is the format:

```markdown
[LABEL](PATH ":include")
```

If you want to embed as a **code block**, you can use the automatic formatting. But markdown and HTML files need to be marked as a code using `type` parameter if you want them as code rather than HTML.

```
":include :type=code"
```

The path could be:

- On the static server.
    e.g. `foo/hello.md`

    ```markdown 
    [hello.js](/path/to/hello.md ":include")
    ```
- URL for a file on a public GitHub repo.
    - e.g.
        ```markdown
        [hello.md](//raw.githubusercontent.com/UserName/repo-name/main/hello.md ":include")

        [\_sidebar.md](//raw.githubusercontent.com/MichaelCurrin/docsify-js-tutorial/master/nested-example/_sidebar.md ":include :type=code")
        ```
    - Make sure to use the **raw** URL so you only reference plain text andbnot the entire GitHub UI HTML.
    - A protocol of `//` is recommended, since `https://` is needed for a remote and `http://` for localhost, to avoid a CORS error.
- A gist reference.
    - See instructions in this [guide](https://gist.github.com/MichaelCurrin/c2bece08f27c4277001f123898d16a7c).

See the _Docsify_ [Embed Files](https://docsify.js.org/#/embed-files) help for forcing types and using fragments.


#### Embed examples

##### JS code snippet

Render a code snippet - formatted automatically.

Code:

```markdown
[example.js](_media/example.js ':include' )
```

Result:

[example.js](_media/example.js ':include' )

If you have a site on GitHub Pages subpath, make sure to avoid leading forward slash.

##### Markdown as code snippet

Render markdown as code snippet. Use the `type` parameter.

Code:

```markdown
[\_sidebar.md](_coverpage.md ':include :type=code')
```

Result:

[\_sidebar.md](_coverpage.md ':include :type=code')

##### Markdown as rendered HTML

Render target Markdown file as HTML. Leave out the `type` parameter.

Code:

```markdown
[example.md](https://docsify.js.org/_media/example.md ":include")
```

Result:

[example.md](https://docsify.js.org/_media/example.md ":include")

Raw Markdown at that URL:

[example.md](https://docsify.js.org/_media/example.md ":include :type=code")


#### Warnings

!> Do not put the URL in a bullet point as it will become an ordinary link.

!> Do not put two embed items in a sequence without some characters in between, otherwise you will get a JS error rending the page. Putting an empty line between them is **not** sufficient.

!> If you embed a URL of a GitHub file, remember to use the _Raw_ URL otherwise you will get an error.


### Use DocsifyJS styling

To break up your doc content and highlight paragraphs, you can now use styling that comes with DocsifyJS.

Here are examples. Note that these will look weird when viewed directly as markdown but DocsifyJS will render them.

#### Info block

Code:

```markdown
?> Info content.
```

Result:

?> Info content.

#### Warning block

Code:

```markdown
!> Warning content.
```

Result:

!> Warning content.


## Add Vue to Docsify

Docsify is built on Vue.js. So the community has provided a section of the docs for adding Vue to a Docsify page.

I followed that guide to put together a Vue demo and basic Vue-Docsify integration intro.

You still have to add Vue to your external JS assets, but at least the app is initialized for you, which saves some code.

Go to <a href="vue-integration">Vue Example</a> on this site.

That sample has its own files like `_sidebar.yml` and `index.html`, so it is a demo site hosted within this main tutorial site.


## Docsify CLI
> Summary of using Docsify's command-line tool


See resources:

- [Docsify Quickstart](https://docsify.js.org/#/quickstart) on _Docsify_ homepage.
- [Docsify CLI](https://docsifyjs.github.io/docsify-cli) project's docs.


### Set up

Follow the instructions in [Quickstart local server](#quickstart-local-server).

### Docsfiy subcommands

#### init subcommand

> Creates new docs

Set up an initial _README.md_ (duplicated from project root), _index.html_ and _.nojekyll_ in your a target directory. If you don't want the CLI to do it for you, you can create the files by hand or use this project's _quickstart_ directory to get you going.

e.g.

```bash
$ docsify init docs
```

#### serve subcommand

> Run local server to preview site.

Serve the target directory as a docs site locally. This includes hot reload, to refresh the page on file changes. See [serve](#21-serve) options above.

e.g.

```bash
$ docsify serve docs
```
```
Serving .../docsify-js-tutorial/docs now.
Listening at http://localhost:3000
```

Serves at [localhost:3000/](http://localhost:3000/), or a different port if there is already a _Docsify_ server running.

This uses is the main use for Docsify - an `index.html` page is served, the JS is loaded on the frontend and then markdown pages are requested and converted to HTML as needed. It is a **Single-Page Application**, so will work great from a user perspective but will score low on search engines. Even though the SEO crawlers can handle JavaScript, there is limited "crawl budget" for a JavaScript-based SPA so this means less of your site is crawled or your site is rated poorly. Constrast with the option below.

#### start subcommand

> Server for SSR

This command is for Server-Side Rendering.

e.g.

```bash
$ docsify start docs
```
```
[SSR] Serving docs now.
Listening at http://localhost:4000
```

Serves at [localhost:3000/](http://localhost:3000/)

This runs a Node.js server which pre-renders then serves HTML to the browser. This should make almost no difference to the end-user.

This approach is ideal for scoring higher on search engines, as the pre-rendered HTML is easy for a crawler to read and it does not use up the "crawl budget".

This command is easy to run locally.

Unfortunately this solution does **not** work on static site solutions like GitHub Pages or Netlify. The Docsify docs recommend using the `now` command to publish a Node.js app for free to [vercel.com/](https://vercel.com/) (previously [zeit.co](https://zeit.co/)).


## Static site vs SPA

### Server side rendering

Although SEO crawlers can do better at sites like single page application, _Docsify_ is still said to **not** be SEO-friendly, compared with static sites where all HTML is pre-rendered. Even though crawlers are getting better at handling JS for SPAs, I've read that this eats up the crawl budget so the crawler doesn't get far in your site.

However, _Docsify_ provides the option of pre-rendering all the views as static HTML. This can improve SEO.

See [Server-Side Rendering](https://docsify.js.org/#/ssr) section of the _Docsify_ docs.

I don't think it'll includes a sitemap file.

### Why not use a static site generator?

_Docsify_ is a Single-Page Application library. It is **not** a static-site generator (though, hopefully this will change when Docsify version 5 comes out).

If you are into Rust, check out [mdBook](https://rust-lang.github.io/mdBook/) to generate an online book from Markdown. It works great as a docs site generator.

_Jekyll_ and _Hugo_ are excellent options for static site generators, not just for docs sites. They can use themes suited to documentation and they can build off of a _docs_ directory. See more info in my [Jekyll Resources](https://michaelcurrin.github.io/dev-resources/resources/jekyll/). 

If you are interested in a Jekyll template that is built around presenting a docs site specifcally, see [jekyll-gh-actions-quickstart](https://github.com/MichaelCurrin/jekyll-gh-actions-quickstart).

These are just tools to build a site. What is appropriate depends on your use-case, how much you need to customized the site and how much effort you want to spend on installing/running/maintaining the project.

I find _Docsify_ light to add to a project and to use for new projects. So it is a great fit for me.

A static site generator can be heavy to set up and manage.

There are dependencies to manage - they might have to be upgraded if their are security vulnerabilities or they are no longer available. Such as plugins and themes for _Jekyll_. And plugins for _Hugo_. Plus you probably need a couple of _JavaScript_ or _CSS_ files that either you or a theme added. Such as _Query_. This _Docsify_ project only needs exactly one _JavaScript_ and one _CSS_ file.

There is HTML to build locally and on the remote. While _Docsify_ needs no dependencies to serve a site, _Jekyll_ sites needs `jekyll` installed and _Hugo_ sites need `hugo` available.

A static site needs to be customized in depth or needs a theme set up which also takes effort. You may lose or gain functionality when switching between Jekyll themes because they use their own templates and layouts. MkDocs is another light alternative but have to install some themes and plugins locally.

You probably have to add _front matter_ to your doc files so they can inherit from layouts and have the correct metadata like title.

As with _Docsify_, you will probably have to create a config file which covers the structure of your project for use in the sidebar.

Unlike building static files with HTML, with with Docsify there is a single page application running off of a _index.html_ - on each request, a markdown file is fetched by the client and rendered as HTML with a theme and menu. The performance will depend more on the server when serving static HTML pages (prebuild and serve page on the client) or on the client when using a single page application (build structure on the client).

Also, the _Docsify_ approach will only work if _JavaScript_ is enabled.

The _Docsify_ site says it supports back to Internet Explorer 11, so that at least helps for a wider audience of users.
