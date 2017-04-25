# Joel Dare

This is my personal home page created with [Hugo](http://gohugo.io/) as a static site.

## Usage

Add posts to the `/contenta/post` folder with some TOML front matter like the following.

	---
	title: "spf13-vim 3.0 release and new website"
	description: "spf13-vim is a cross platform distribution of vim plugins and resources for Vim."
	tags: [ ".vimrc", "plugins", "spf13-vim", "vim" ]
	date: "2012-04-06"
	lastmod: 2015-12-23
	categories:
	  - "Development"
	  - "VIM"
	slug: "spf13-vim-3-0-release-and-new-website"
	---

To compile the site and test it locally run the following command.

    hugo serve -w

To compile the static files into the `/docs` directory run the following command.

	hugo

## Dependencies

- Hugo
- hugo-joeldare-theme (Github Submodule)

You can install Hugo with Homebrew using the following command.

    brew update && brew install hugo

You will checkout /hugo-joeldare-theme/ as a submodule so you'll want to bring that in to your checkout of this repo with the following.

	git submodule update --init --recursive
