# dribbble_desktop

A ruby script that scrapes rss feed of &quot;shots&quot; from dribbble.com, puts the images in a folder, generates an html file that you can load using WebDesktop. Poof - dribbble shots tiled nicely on your desktop. Written by [Chad Humphries](http://spicycode.com) at the Hacker B &amp; B.

<sup>**NOTE: this is all drafted and explained for a OSX user. Other systems will need other instructions and/or something completely different than this script**</sup>

## How to Use

  1. `mkdir dribbble_desktop`
  2. Add dribbble_desktop.rb file to your dribbble\_desktop directory.
  3. `cd dribbble_desktop`
  4. then run `ruby dribbble_desktop.rb` <br/><sup>**_NOTE: make sure that you are connected to the interwebs. This scrapes the RSS feed of dribbble.com's "Everyone" shots._**</sup>
  5. Download &amp; install [WebDesktop](http://code.google.com/p/webdesktop-macosx/downloads/detail?name=WebDesktop.zip&can=2&q=) <br/><sup>**_NOTE: OSX ONLY. Sorry Windows users... you will have to figure something else out._**</sup>
  6. Run the WebDesktop app and Open File `command + O` (open the dribbble.html file in your dribbble_desktop directory, generated by running the ruby script.)
  7. That's it! You now have the latest dribbble shots on your desktop.

## To Change the images in the html file

  1. In a new Terminal window run: `cd dribbble_desktop && rm -rf images && ruby dribbble_desktop.rb`
  2. After the script is done running... refresh your WebDesktop.
