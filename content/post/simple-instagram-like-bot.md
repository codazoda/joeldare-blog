---
date: "2016-04-26"
title: "Simple Instagram Like Bot"
lastmod: "2017-04-18"
tags: ["tech"]
---
This is a very simple Instagram like bot written in JavaScript.

Google Chrome Extension
=======================

The easiest and safest tool to use is my [Magis extension for Google Chrome][magis]. Gain new followers and likes on Instagram. Magis reminds you to be active and provides keyboard shortcuts to make liking and commenting fast. Set a goal to like and comment on 10 posts an hour to significantly increase your Instagram engagement with just two minutes of work. Build brand awareness. Get more leads. Grow website traffic.

[Magis extension for Google Chrome][magis]

Magis tries not to break the spirit of Instagram, like the bot does, and the extension is updated frequently preventing problems when Instagram changes their web interface.

[magis]: https://chrome.google.com/webstore/detail/kahkfpeemmmjcbkffjmebbgkdmjglobi

JavaScript Version
==================

This script requires some extra work but it's free. Here are the steps to take to use the JavaScript version of my Instagram like bot.

- Highlight and copy the entire code block below
- Open your browser and visit intagram.com
- Enter a hash tag in the search box
- Open the first post under “Most Recent”
- Open the JavaScript console in your browser
- Paste this code into the console

Here's the code. Because of frequent changes at Instagram this code is sometimes broken. Instagram is also cracking down on bot use like this and there is some risk to your Instagram account. Use this script at your own risk or see the Chrome extension listed above for a safer option.

	function getHeartElement() {
	    var knownHeartElementNames = ["coreSpriteHeartOpen", "coreSpriteLikeHeartOpen"];
	    var i = 0;
	    // Loop through the known heart elements until one works
	    for (i = 0; i < knownHeartElementNames.length; i++) {
	        var heartElement = document.querySelector('.' + knownHeartElementNames[i]);
	        if (heartElement != undefined) {
	            break;
	        }
	    }
	    return heartElement;
	}

	function doLike() {
	    var likeElement = getHeartElement();
	    var nextElement = document.querySelector('.coreSpriteRightPaginationArrow');
	    likeCount++;
	    console.log('Liked ' + likeCount);
	    var nextTime = Math.random() * (14000 - 4000) + 4000;
	    likeElement.click();
	    setTimeout(function() {nextElement.click();}, 1000);
	    if (likeCount < 25) {
	        setTimeout(doLike, nextTime);
	    } else {
	        console.log('Nice! Time for a break.');
	    }
	}

	var likeCount = 0;
	doLike();

Opening the Console
-------------------

The easiest way to open the javascript console is using the shortcut key combination. Here are the key combinations for several popular browsers.

| Browser                   | Keys                           |
|---------------------------|--------------------------------|
| Google Chrome for Mac     | //command//, //option//, //J// |
| Firefox for Mac           | //command//, //option//, //K// |
| Safari for Mac            | //command//, //option//, //C// |
| Google Chrome for Windows | //control//, //shift//, //J//  |
| Firefox for Windows       | //control//, //shift//, //I//  |
| Google Chrome for Linux   | //control//, //shift//, //J//  |
| Firefox for Linux         | //control//, //shift//, //I//  |


Legacy Version
==============

This is a very simple Instagram like bot written for the iMacros plugin. The plugin is available for IE, Chrome, and Firefox. This version is out of date and much more complicated than the JavaScript version above; use that instead.


Getting Ready
-------------

In order to run this bot you need to install the iMacros plugin for your browser platform. Here are the links for Chrome and Firefox (it's also available for IE but you'll have to search for that one yourself).

[iMacros for Chrome][imacros-chrome]  
[iMacros for Firefox][imacros-firefox]

[imacros-firefox]: http://www.joeldare.com/wiki/lib/exe/fetch.php?tok=6ca271&media=https%3A%2F%2Faddons.mozilla.org%2Fen-us%2Ffirefox%2Faddon%2Fimacros-for-firefox%2F)
[imacros-chrome]: http://www.joeldare.com/wiki/lib/exe/fetch.php?tok=ae6c61&media=https%3A%2F%2Fchrome.google.com%2Fwebstore%2Fdetail%2Fimacros-for-chrome%2Fcplklnmnlbnpmjogncfgfijoopmnlemp

Running the Bot
---------------

In order to use the bot, do the following:

- Open Instagram in your browser
- Search for a specific tag you want
- Click on the first image
- Open the iMacros plugin in your browser
- Run the bot with the “Play Loop” option

The Macro Code
--------------

iMacros scripts are stored in the browser as bookmarks, so you'll want to save the script before you can use it. To start a new script hit “Record” and then stop. Overwrite the macro with the code below then save it with a name like “Instagram Like Bot”.

Here's the code for the bot itself.

	SET !VAR1 EVAL("var randomNumber=Math.floor(Math.random()*5 + 3); randomNumber;")
	TAG POS=1 TYPE=A ATTR=TXT:Like
	TAG POS=1 TYPE=A ATTR=TXT:Next
	WAIT SECONDS={{!VAR1}}


Features
--------

- Very simple script
- Random pauses so it acts like a human
- You can watch it run
- You can run it in a background tab