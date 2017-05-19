---
date: "2017-05-19"
title: "Create a Preact App from Scratch"
tags: ["tech","react", "preact"]
---

I wrote these instructions after having written my previous instructions [Create a React App from Scratch](blog/post/create-a-react-app). The process is almost identical. The result is a much smaller app.

A basic preact application needs npm, yarn, babel, and webpack. This is a step by step guide to installing these things and setting up a minimal initial preact project.

I'll assume you have npm and yarn already installed. Go install those if you don't regularly use them. You can substitute npm commands for the yarn commands below, if you like. `yarn add <package>` becomes `npm install --save <package>`. `yarn add <package> --dev` becomes `npm install --save-dev <package>`. But, I use yarn so my instructions are tailored to it.

## Setup Directory

Create a directory.

    mkdir preact-minimal

`cd` into the directory you created.

## Yarn

Initialize this directory as a project using `yarn`.

    yarn init

Add `.gitignore` with the following.

    node_modules

## Babel

Use `yarn` to install `babel` with the following.

    yarn add babel-core babel-preset-latest babel-preset-preact --dev

Add a `.babelrc` file and put the following into it

    {
      "presets": [
        ["latest", { "modules": false }],
        "preact"
      ]
    }

## Webpack

Use yarn to install webpack and the babel-loader for webpack.

    yarn add webpack babel-loader --dev

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

## Preact

Now we need to install preact.

    yarn add preact preact-dom --dev

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
    import Preact from 'preact';
    import PreactDOM from 'preact-dom';
    import Counter from './Counter';

    document.addEventListener('DOMContentLoaded', function() {
      PreactDOM.render(
        Preact.createElement(Counter),
        document.getElementById('mount')
      );
    });

Create a `src/Counter.js` file with the following contents.

```
import Preact from 'preact';
/**
 * A counter button: tap the button to increase the count.
 */
class Counter extends Preact.Component {
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

  "plugins": [
    ["transform-react-jsx", { "pragma":"preact.h" }]
  ]

## Serve the Files

You've now created your preact app and you're ready to serve the `www` folder. You can upload it to a web host or run some type of server locally. I do a lot of PHP development and it's server is convenient for local testing so I switch to the `www` directory and then start the server with the following command.

    php -S localhost:8080

## Github

This completed preact project is available in my [repo on github](https://github.com/codazoda/react-minimal). You can clone it from there if you want to look over the source or if you have any trouble with these instructions.

## Preact Thoughts

I've been using preact for about two years. As an old-school software developer I've found it difficult to reason about although most developers say that is exactly why you should use preact.

This setup process is pretty complex. I'd be hesitant to use preact for any small projects. It took me well over an hour to setup this minimal framework, although I was also documenting it in this blog post as I did the setup.

On the development machine you now have the following packages installed. Pretty much all of them are necessary to work in preact. That's not technically true, you can use preact without this stuff, but no one works that way. So, here's the list of software you've installed to make all this happen.

    - npm
    - yarn
    - babel
    - webpack
    - preact

Each of these packages has a fairly long learning curve and each of them have their own list of dependencies. I'm going to ignore npm and yarn for now, since I assumed you already had them. Babel and Webpack, however, install a LOT of stuff.

If you look into your `node_modules` directory you'll see that you have installed about 393 different packages. Here's a list of the number of packages that each of them installs.

    - babel (112)
    - webpack (285)
    - preact (?)

Lucky for you these are only necessary for development and not for deployment. You'll be deploying just the `www` directory. That directory contains only the following 2 files.

    - package.js
    - index.html

In react the transpiled package.js file was 722K. Using preact, it's just 136B! Yes, that's bytes, not kilobytes. And that's without the package.js file minified yet.



## Links

[Preact]() 
[Build Your Own Starter](http://andrewhfarmer.com/build-your-own-starter/#0-intro)
