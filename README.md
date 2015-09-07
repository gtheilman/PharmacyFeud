# Pharmacy Feud #

Does the world need yet another computerized version of the Family Feud game show?   Of course not.

[Demo](https://pharmd.umc.edu/pharmacyfeud/index.html?gameData=medicaid)

I use this program as a "framing device" during lectures. 

If you watch Family Feud, you'll notice that there is actually
very little time devoted to the game. Some have stated that each 1/2 hour show only has [3 minutes](https://www.youtube.com/watch?v=GD8tCm3nol8) of actual gameplay.
Most of the show is talking to the players and joking around.   I use the time between students giving answers to talk
about the responses that have come up on the board and how they relate to the topic of the lecture.  

And I do throw in the occasional joke.


![GameBoard](https://raw.githubusercontent.com/gtheilman/PharmacyFeud/master/media/pharmacyfeud.JPG)


The original version I wrote for myself made an AJAX call to the server to retrieve data with which to populate the board. To simplify use by other institutions, this version looks for a file in the "gameData" folder containing the JSON needed. There are examples in the folder. To create your own questions, just create new javascript files in that folder using the ones already there as models. They are just text files and you can edit them in Notepad. Give the new question file a unique name and make sure that when you save it the extension is ".js" (not ".txt" or ".html"). 

Sometimes I'll be asking questions where the numbers don't add up to 100 or the answers are simply ranked (like the Medicaid example above).   In those cases, I just put the answers in rank-order and then assign arbitrary points to each answer (with the highest ranked answer getting the most points).   Students don't seem to care.

To use this without having to first put on a website (i.e., run it directly on a laptop), you have a few options:
*  Just try opening the <code>index.html</code> file with Firefox.  It might work.   It doesn't seem to work with Chrome or Internet Explorer.
*  Download a small webserver like [Mongoose](https://www.cesanta.com/mongoose) on your laptop.   Put it in the same directory on your hard drive as the <code>index.html</code> file.   Run Mongoose and then browse to the <code>index.html</code> file.  If you are using Mongoose, it will likely be at <code>http://localhost:8080</code>

To load the game data, load the <code>index.html</code> file with the gameData filename as part of the URL, e.g.,

<code>index.html?gameData=medicaid</code>

<code>index.html?gameData=std</code> 

<code>index.html?gameData=freak</code> 

<code>index.html?gameData=bore</code> 

Don't include the ".js" in the URL.  Just the part of the filename before the period (e.g, **medicaid**~~.js~~).

The game board will open in *another* window without a menu bar or other distractions. 

If you load the page and nothing happens:

* Make you aren't covering up the game board with another window
* Make sure your browser is not blocking popup windows or blocking external content

The window that opens is sized to correctly line up all the elements on the game board.   However,there are a few minor
differences between browsers.  If things don't look entirely lined up correctly, resize the window with the mouse a
little and see if that helps.


Before playing the game, make sure that the new window has focus. That is, click somewhere on the window with your mouse to make sure that window is 'active'. 


Rather than have a team of students stand up in front of the room the entire time, I usually pit "left side of the room" versus "right side of the room". 


I usually start the game by having two students from either side of the room stand next to a wireless keyboard sitting on a box in front of the screen at the front of the auditorium. The SPACEBAR is the button for Team 1 to ring-in. The ENTER key is the ring-in button for Team 2. Sometimes I'll put a little piece of Post-It note on the keys to make it more obvious.


Whoever rings in first locks out the other player. So, it's not necessary to guess who clicked first.

The question at the top of the screen doesn't appear until AFTER I read it out loud and someone rings-in.  


From there, I control the board using a small wireless keyboard I can carry around the auditorium. I just pick somewhere random and have students sitting in their seats make guesses.

* Number keys 1 - 8 reveal the answers
* The 0 (zero) key cycles through the number of strikes. That is, it shows one strike the first time it is pressed, two strikes the second time and three strikes the third time. 
* The 9 key always plays a single strike. This is for incorrect answers during the face-off and when a team tries to steal. 
* At the end, click on the score of whichever team won that round. The points from up top will be transferred to their score. 

You could also have an assistant sit with the keyboard and control the board while you play "host".

Scores from the previous round are carried over to subsequent rounds. If you need to clear out the team scores, close all browser windows.


I did not create the sound files or the background.   While I do not believe my use of sound files and images infringes on anyone's copyright, if it does let me know and I will take down the offending material.

If you use this software in your classroom, please send me an email so I can document it in my yearly faculty activity report.


Gary Theilman (gtheilman@umc.edu)
