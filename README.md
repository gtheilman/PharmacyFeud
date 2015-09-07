# Pharmacy Feud #

Yet another version of the Family Feud game show.   Runs in a web browser.

[Demo](https://pharmd.umc.edu/pharmacyfeud/index.html?gameData=medicaid)

I use this program as a "framing device" during lectures. If you watch Family Feud, you'll notice that there is actually
very little time devoted to the game. Some have stated that each 1/2 hour show only has 3 minutes of actual gameplay.
Most of the show is talking to the players and joking around.   I use the time between students giving answers to talk
about the responses that have come up on the board and how they relate to the topic of the lecture.  And I do throw in
the occasional joke.


![GameBoard](https://raw.githubusercontent.com/gtheilman/PharmacyFeud/master/media/pharmacyfeud.JPG)


The original version I wrote for myself made an AJAX call to the server to retrieve data with which to populate the board. To simplify use by other institutions, this version looks for a file in the "gameData" folder containing the JSON needed. There are examples in the folder. To create your own questions, just create new javascript files in that folder using the ones already there as models. They are just text files and you can edit them in Notepad. Give the new question file a unique name and make sure that when you save it the extension is ".js" (not ".txt" or ".html"). 

To use this without having to first put on a website (i.e., run it directly on a laptop), you have a few options:
*  Just try opening the <code>index.html</code> file with Firefox.  It might work.   It doesn't seem to work with Chrome or Internet Explorer.
*  Download a small webserver like [Mongoose](https://www.cesanta.com/mongoose) on your laptop.   Put it in the same directory on your hard drive as the <code>index.html</code> file.   Run Mongoose and then browse to the <code>index.html</code> file.  If you are using Mongoose, it will likely be at <code>http://localhost:8080</code>

To load the game data, load then index.html file and add the gameData filename to the URL, e.g.,

index.html?gameData=medicaid 

index.html?gameData=std 

index.html?gameData=freak 

index.html?gameData=bore 

Don't include the ".js" in the URL.  Just the part of the filename before the period.

The game board will open in another window that doesn't have a menu bar or other distractions. 

If you load the page and nothing happens:

* Make you aren't covering up the game board with another window
* Make sure your browser is not blocking popup windows or blocking external content

The window that opens is sized to correctly line up all the elements on the game board.   There are a few minor
differences between browsers.  If thing don't look entirely lined up correctly, resize the window with the mouse a
little and see if that helps.


If you want make the window "larger", use your browser's zoom function rather than using the mouse to resize the window.


Before playing the game, make sure that the new window has focus. That is, click somewhere on the window with your mouse to make sure that window is 'active'. 


Rather than have a team of students stand up in front of the room the entire time, I usually pit "left side of the room" versus "right side of the room". 


I usually start the game by having two students from either side of the room stand next to a wireless keyboard sitting on a box in front of the screen at the front of the auditorium. The SPACEBAR is the button for Team 1 to ring-in. The ENTER key is the ring-in button for Team 2. Sometimes I'll put a little piece of Post-It note on the keys to make it more obvious.


Whoever rings in first locks out the other player. So, it's not necessary to guess who clicked first.


From there, I control the board using a small wireless keyboard I can carry around the auditorium. I just pick somewhere random and have students sitting in their seats make guesses.

* Number keys 1 - 8 reveal the answers
* The 0 (zero) key cycles through the number of strikes. That is, it shows one strike the first time it is pressed, two strikes the second time and three strikes the third time. 
* The 9 key always plays a single strike. This is for incorrect answers during the face-off and when a team tries to steal. 
* At the end, click on the score of whichever team won that round. The points from up top will be transferred to their score. 


Scores from the previous round are carried over to subsequent rounds. If you need to clear out the team scores, close all browser windows.


While I do not believe my use of sound files and images infringes on anyone's copyright, if it does let me know and I will take down the offending material.

If you use this software in your classroom, please send me an email so I can document it in my yearly faculty activity report.


Gary Theilman (gtheilman@umc.edu)
