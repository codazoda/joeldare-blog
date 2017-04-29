---
date: "2016-06-07"
title: "How to Code"
tags: ["tech"]
---

## Give Your Computer Instructions

It's easy to start giving your computer instructions. You've already got the tool you need; your web browser. Lets open a special window called the *console*.

Select the *View* menu, then *Developer*, and *JavaScript Console*. The menu will look similar to this.

![JavaScript Console Menu](/blog/image/javascript-console.png)

## Hello World

It's tradition to have your first program say hello to the world. Type the following into the console and press enter.

    alert("Hello World")

Your computer should respond by showing you a dialog that says, "Hello World". It will look something like the alert box below.

![Alert Dialog](/blog/image/alert-dialog.png)

JavaScript is case sensitive. If you got an error, instead of the dialog, try the command again. This time, make sure that you use capital and lowercase letters exactly the way it's listed above.

Click the *OK* button and the dialog will close. Congratulations, you just wrote code!

The first word `alert` is a *command* built into JavaScript. JavaScript is a programming language that works in the web browser. The `alert` command takes a parameter, enclosed in parentheses, that tells the browser what you want to display.

## Data Types

There are three main data types you should know about. They are *String*, *Number*, and *Boolean*. You already used a string in the `alert` command above. A string is just like a quote in a book and is surrounded by quotes. Numbers are entered without the quotes. A boolean is either `true` or `false`.

Lets try another example. Type the following command into the console.

    alert("2+2")

You'll notice we used a string (surrounded by quotes) and the computer responded by saying exactly what you told it to, "2+2". The console also returns the word `undefined` this time. That's normal, it's the consoles strange way of saying that it worked correctly. It didn't say `undefined` the first time because I asked it to tell you, "nice work". Now, remove the quotes and try again.

    alert(2+2)

This time, the computer responds with, "4". It recognized that you were using numbers and calculated the total instead of showing you the string.

## Console Output

You can also use the console for your output instead of using an alert box. To do that you use the `console.log()` *method*. The word *Method* is computer jargon for a type of *command*. Give it a try with the following.

    console.log("Hello Console");

This method is similar to the `alert` method but our output will only appear in the console. It's a bit faster than the alert dialog because we don't have to click *OK* every time.

You may have noticed this line ended in a semi-colon. You don't need it but it's popular convention to end your lines with a semi-colon. Lets do that going forward.

## Variables

A variable is a piece of information that is remembered for us. Variables can store all of the data types we've talked about so far (*strings*, *numbers*, and *booleans*). You create new variables with the `var` statement. Lets setup a variable to store our message from before. Type the following line.

    var message = "Hello World";

Now, you can output the message using the name you assigned it, `message`.

    console.log(message);

This time you didn't use quotes and the console should have said, "Hello World".

Now try changing your message to something else and output it again.

    message = "Cool";
    console.log(message);

This time the output is, "Cool". Notice we didn't use the `var` keyword. That's because you only use that statement to create new variables. This time we were changing the value stored in the `message` variable that had already been created above.

We can assign as many variables as we need.

## Doing Math

You saw the result of `2+2` above. Your programs can do all kinds of calculations including addition, subtraction, multiplication and division. The characters you use for these calculations are listed below.

| Char | Description    |
|------|----------------|
| `+`  | Addition       |
| `-`  | Subtraction    |
| `*`  | Multiplication |
| `/`  | Division       |

Lets try a division problem. We'll divide `2.5` by `100`.

    console.log(2.5 / 100);

If you typed it correctly, you should see `0.025` in the console.

## Prompting for Information

You can also ask a user for information.

    var name = prompt("What is your name?");
    alert(name);

The `prompt` command shows a dialog that has a field that you can type into. We set the `name` variable to whatever the user types into the dialog and then we output that information.

## Concatenation

You can use the plus *operator* to join two strings together. Try the following.

    alert("Hello " + name);

The string "Hello " and the variable `name` were joined together. Joining two strings together is called concatenation. The plus operator adds two numbers together or joins two strings together. Try all these variations to see what they do.

    alert(2+4);
    alert("2+4");
    alert("2" + "4");
    alert("2" + 4);
    alert(2 + "4");

The last two are interesting. If any part of the argument contains a string, JavaScript will treat all of it as a string. Experiment with other variations on your own.

## Functions

You've used the `alert()` and `console.log()` methods. You can also create your own functions that work the same way. *Function* is another word that describes a computer *command*. Lets write a function that calculates how much money you need to save every month in order to end up with $600 after 12 months.

    function saveMonthly() {
        var needed = 600;
        var monthly = needed / 12;
        return monthly;
    }

This function uses two variables; `needed` and `monthly`. Then it uses the `return` statement to return that information. Copy and paste the code into your console.

The function won't do anything yet. We set it up so we could run it later. Lets run the function to see the amount we need to save.

    saveMonthly();

Your function returns the monthly amount. You may notice that the console didn't say `undefined` this time. Each time you run a command in the console it shows you what that command returns. If a command doesn't have a return value defined, you'll see `undefined`. The consoles way of saying the command worked isn't so strange after all.

## Arguments

We can also create arguments for our function. We want to pass the amount needed to the function and have it return the amount we need to save each month. Enter the following function into the console.

    function saveMonthly(amount) {
        var monthly = amount / 12;
        return monthly;
    }

Now we call our function with the amount we need and it calculates the monthly amount we should save.

    saveMonthly(600);

## Accessing the Page

So far, we've done everything in JavaScript with an alert box or the console. You can also alter the web page you're viewing. Lets change the background color on this page.

    var body = document.body.style;
    body = 'background-color: silver';

The entire web page that you're looking at should turn a light gray color.

## Continue Learning

The goal of this page is to get your feet wet with computer programming. You've just learned a valuable and marketable skill and I hope you're excited about it. Programming can be frustrating but it's also extremely rewarding.
