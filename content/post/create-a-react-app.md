---
date: "2017-05-11"
title: "Create a React App from Scratch"
tags: ["tech","react"]
---

A basic react application needs npm, yarn, babel, and webpack. This is a step by step guide to installing these things and setting up a minimal initial react project.

I'll assume you have npm and yarn already installed. Go install those if you don't regularly use them. You can substitute npm commands for the yarn commands below, if you like. `yarn add <package>` becomes `npm install --save <package>`. `yarn add <package> --dev` becomes `npm install --save-dev <package>`. But, I use yarn so my instructions are tailored to it.

## Setup Directory

Create a directory.

    mkdir react-minimal

`cd` into the directory you created.

## Yarn

Initialize this directory as a project using `yarn`.

    yarn init

Add `.gitignore` with the following.

    node_modules

## Babel

Use `yarn` to install `babel` with the following.

    yarn add babel-core babel-preset-latest babel-preset-react --dev

Add a `.babelrc` file and put the following into it

    {
      "presets": [
        ["latest", { "modules": false }],
        "react"
      ]
    }

## Webpack

Use yarn to install webpack and the babel-loader for webpack.

    yarn add webpack babel-loader

Create a `src/main.js` file that outputs `Hello World!`.

    console.log('Hello World!');

Create a `webpack.config.js` file with the following in it.

    const path = require('path');
    module.exports = {
      context: path.join(__dirname, 'src'),
      entry: [
        './main.js',
      ],
      output: {
        path: path.join(__dirname, 'www'),
        filename: 'bundle.js',
      },
      module: {
        rules: [
          {
            test: /\.js$/,
            exclude: /node_modules/,
            use: [
              'babel-loader',
            ],
          },
        ],
      },
      resolve: {
        modules: [
          path.join(__dirname, 'node_modules'),
        ],
      },
    };

## Compile

Open the `.gitignore` and add the following section.

    www/bundle.js

Open the package.json file and add the following section.

    "scripts": {
      "build": "webpack"
    }

Now compile using the following command.

    yarn run build

## React

Now we need to install react.

    yarn add react react-dom

## Make Pages

Create a `www/index.html` with the following content.

    <html>
    <head>
      <script src="/bundle.js" ></script>
    </head>
    <body>
      Hello World
      <div id="mount"></div>
    </body>
    </html>

Update `src/main.js` to the following.

    console.log('Hello World!');
    import React from 'react';
    import ReactDOM from 'react-dom';
    import Counter from './Counter';

    document.addEventListener('DOMContentLoaded', function() {
      ReactDOM.render(
        React.createElement(Counter),
        document.getElementById('mount')
      );
    });

Create a `src/Counter.js` file with the following contents.

```
import React from 'react';
/**
 * A counter button: tap the button to increase the count.
 */
class Counter extends React.Component {
  constructor() {
    super();
    this.state = {
      count: 0,
    };
  }
  render() {
    return (
      <button
        onClick={() => {
          this.setState({ count: this.state.count + 1 });
        }}
      >
        Count: {this.state.count}
      </button>
    );
  }
}
export default Counter;
```

Create a `.babelrc` file with the following.

    {
      "plugins": ["transform-react-jsx"]
    }

## Serve the Files

You've now created your react app and you're ready to serve the `www` folder. You can upload it to a web host or run some type of server locally. I do a lot of PHP development and it's server is convenient for local testing so I switch to the `www` directory and then start the server with the following command.

    php -S localhost:8080

## Github

This completed react project is available in my [repo on github](https://github.com/codazoda/react-minimal). You can clone it from there if you want to look over the source or if you have any trouble with these instructions.

## React Thoughts

I've been using react for about two years. As an old-school software developer I've found it difficult to reason about although most developers say that is exactly why you should use react.

This setup process is pretty complex. I'd be hesitant to use react for any small projects. It took me well over an hour to setup this minimal framework, although I was also documenting it in this blog post as I did the setup.

On the development machine you now have the following packages installed. Pretty much all of them are necessary to work in react. That's not technically true, you can use react without this stuff, but no one works that way. So, here's the list of software you've installed to make all this happen.

    - npm
    - yarn
    - babel
    - webpack
    - react

Each of these packages has a fairly long learning curve and each of them have their own list of dependencies. I'm going to ignore npm and yarn for now, since I assumed you already had them. Babel and Webpack, however, install a LOT of stuff.

If you look into your `node_modules` directory you'll see that you have installed 393 different packages. Lucky for you these are only necessary for development and not for deployment. You'll be deploying just the `www` directory. That directory contains only the following 2 files.

    - package.js
    - index.html

You'll notice, however, that your package.js file is something like 722K. Whoa! A `Hello World` react app is three quarters of a meg of JS code. Imagine sending that to a bunch of mobile devices with crappy connections. Sure it'll be gzipped, but still, this is large.

There are smaller alternatives, such as preact, and I may explore those in the future.

## Links

[React](https://facebook.github.io/react/)  
[Build Your Own Starter](http://andrewhfarmer.com/build-your-own-starter/#0-intro)
