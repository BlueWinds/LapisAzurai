Lapis Azurai
===========

The source repository for [Lapis Azurai](http://winds.blue/about).

# Reporting Issues
The preferred venue for reporting issues - bugs, typos, feature requests, improvements, new content - is via comment on the [development blog](http://winds.blue/). Find the most recent release post and add a comment. Not as fancy as github issues, but better simple and centralized than featurefull and scattered across multiple venues.

# Compiling
The git repository doesn't include the compiled files, necessary for actually playing. If you just want to play the game, check the [development blog](http://winds.blue/) for the latest download.

The rest of this section is dedicated to setting up a development environment so you can modify the source. It will assume at least vague familiarity on your part with command line, and that you're running Linux. Instructions will vary for other environments.

The game's source code resides in, surprise surprise, the /src directory. It is written in [Coffeescript](http://coffeescript.org/) and CSS, and runs in a web browser. Browsers don't know how to handle coffeescript though - it needs to be compiled to javascript first, and all the files moved into their proper locations.

For that, you'll need to install [NodeJS](http://nodejs.org/). Once that's installed, use npm to pull in all the other development dependencies from the command line:

```
$ cd /wherever/you/downloaded/the/repository
$ npm install
```

Now you compile the game with

```
$ npm start
```

This will compile the game, then watch for changes to any of the source code and recompile. If that went well (no errors), you can now open "/dist/index.html" and it will load your new freshly compiled copy of the game. It also runs a process which recompiles and then refreshes the browser automatically if you change the source. :)

When ready to distribute, `npm run build-dist` cleans up the current build, starts a new one, removes the live-reload script, and then compresses a ready-to-ship LapisAzurai.zip. Easy peasy!

# License

## tl;dr
Share all you like, upload pictures to image boards, make a torrent. Give credit (a link to "created by BlueWinds at http://winds.blue" is enough).

Use the game engine to make your own stuff without getting it touch (including commercially), but ask me first if you want to use my characters or art in a commercial manner.

## Longer
* Everything in the "/src/content" folder is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 License](http://creativecommons.org/licenses/by-nc-sa/4.0/)
  That means you can copy and distribute this folder (and any graphics, text, characters, etc. within) freely, as long as you (A) give credit (B) do not sell it (C) do not include it in another work that is being *sold*.
  If you do include it, or a derivative of it in another work, that work must be similarly licensed.
* All code in the "/src/engine" folder is licensed under [the GPL v2](http://www.gnu.org/licenses/gpl.txt)
  This means that you can redistribute this folder freely as long as you (A) give credit.
  If you do include it (or a derivative of it) in another work, that work must also be similarly licensed.
* Each library in the "/src/lib" directory has its own license. See the header of each file there for details (most are MIT or public domain).

# Credits

* Design, coding, writing and characters are all by BlueWinds (http://winds.blue).
* Art is commissioned or created by BlueWinds. All images included are released under CC-NC-SA
** Map by Junior Mclean (http://lordfreeza.deviantart.com/)
** Character art by Indy K (http://indy-k.deviantart.com/)
** Amandais, Colinth and Tomenoi are modifications of public domain images (original sources unknown) by BlueWinds (http://winds.blue)
** All other location art by Hoang Viet Anh (http://mitteam.deviantart.com/)
