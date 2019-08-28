# Docsify Template
> Live demo of a light docs site built on _docsify-js_ and running on Github Pages

Convert your docs folder into a pretty docs website using _docsify_ and some minimal setup. This project can be used as a template or reference for your own.

See the [Docsify](https://docsify.js.org/) website.


## How it works

Note that this works without editing your existing docs and without building any HTML page.

If you were using a static site generator like Jekyll, you might have to add front matter to your docs, in addition to setting Jekyll config for theme and menu layout.

Also, with a static site generator you would build HTML files to serve, while with docsify there is a single page application running off of a _index.html_ - on each request, a markdown file is fetched by the client and rendered as HTML with a theme and menu.

## Setup

### Overview steps

1. Add a few files to your existing docs folder. You can use this project's files to get you going.
    - Add an _index.html_ file. This will setup the app using the _docsify_ library, set a theme and apply other configurations.
    - Add file describing your menu layout, as _docsify_ is not aware of directory structure.
2. Turn your Github repo into a Github pages site which builds from the docs directory.

### Detailed Steps


You can optionally use the command-line tool to
- Setup an initial _README.md_ and _index.html_ in your docs directory.
- Serve the docs site locally, with hot reload.


## License

MIT License - [LICENSE](/LICENSE).
