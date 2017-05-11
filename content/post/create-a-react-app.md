# Create a React App from Scratch

A basic react application needs npm, yarn, babel, and webpack. This is a step by step guide to installing these things and setting up a minimal initial react project.

I'll assume you have npm and yarn already installed. Go install those if you don't regularly use them. You can substitute npm commands for the yarn commands below, if you like. `yarn add <package>` becomes `npm install --save <package>`. `yarn add <package> --dev` becomes `npm install --save-dev <package>`.

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

## Links

[React](https://facebook.github.io/react/)
[Build Your Own Starter](http://andrewhfarmer.com/build-your-own-starter/#0-intro)
