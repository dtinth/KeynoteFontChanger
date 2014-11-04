
This is probably the world's first JavaScript for Automation script written in Literate CoffeeScript.
Yes, the very file you are reading is an executable script.
To run it, see the instructions at bottom.


Change Keynote Master Font
==========================

__Helvetica__ has haunted me again.
As you might know in my [Yosemite System Font Patcher](https://github.com/dtinth/YosemiteSystemFontPatcher) project, for me the Helvetica font feels too _ancient_.

Now, I am creating a presentation using Keynote. With its default theme, all slide texts are in Helvetica Neue. And there are 12 master slides to edit.

Yeah, just 12 slides, that's not much, I could have done it manually, but I was too lazy.
So I come to my friend, JavaScript for Automation.


The Plan
--------

I opened the Script Editor Dictionary and looked into Keynote. I found out that:

- The Keynote `Application` contains documents (that is opening in the app).
- Each `Document` contains `masterSlides`.
- Each `MasterSlide` contains `textItems`.
- Each `TextItem` has the `objectText` property, which is a `RichText`.
- The `RichText` contains the `font` property, which is the PostScript name of the font.


The Font
--------

For the presentation I'm working on, I think I'll use Avenir Next again.
We first need to specify the PostScript name.
We can obtain the PostScript name using the Font Book application.

    TARGET_FONT = 'AvenirNext-Regular'


The Script
----------

Now, let's get the current document from the Keynote application.

    document = Application('Keynote').documents[0]

And for each master slide in it, we will replace the fonts in each text item.

    for slide in document.masterSlides
      for textItem in slide.textItems
        textItem.objectText.font = TARGET_FONT

Well, it's _that_ simple.


How to run this script?
-----------------------

First, install CoffeeScript using `npm`.

```bash
npm install -g coffee-script
```

Then compile this README.litcoffee into JavaScript and pass it to `osascript` command line tool.

```bash
coffee -cp README.litcoffee | osascript -l JavaScript
```
