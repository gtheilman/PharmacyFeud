<!--- Javascript libraries --->

<script src='//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js'></script>
<script type='text/javascript' src='js/jquery.flippy.min.js'></script>
<script src='js/jquery.easing.1.3.js' type='text/javascript'></script>
<script src='js/jquery.flipCounter.1.2.pack.js' type='text/javascript'></script>
<script src='js/jquery.bpopup.min.js'></script>
<script src='js/jquery.cookie.js'></script>


<!--- Model below this line --->


<audio id='ding'>
    <source src='audio/ding.mp3'></source>
    <source src='audio/ding.ogg'></source>
</audio>
<audio id='strike'>
    <source src='audio/strike.mp3'></source>
    <source src='audio/strike.ogg'></source>
</audio>
<audio id='buzzer'>
    <source src='audio/buzzer.mp3'></source>
    <source src='audio/buzzer.ogg'></source>
</audio>
<audio id='transferpoints'>
    <source src='audio/transferpoints.mp3'></source>
    <source src='audio/transferpoints.ogg'></source>
</audio>
<audio id='FamilyFeud'>
    <source src='audio/FamilyFeud.mp3'></source>
    <source src='audio/FamilyFeud.ogg'></source>
</audio>


<!--- View below this line --->

<!doctype html>
<html lang='en'>
<head>
    <meta charset='utf-8'/>

    <title></title>
    <meta name='description' content='Family Feud'/>
    <meta name='author' content='Gary Theilman'/>

    <!-- mobile viewport optimisation -->
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>

    <!-- stylesheets -->
    <link rel='stylesheet' href='css/yaml/core/base.min.css' type='text/css'/>
    <link rel='stylesheet' href='css/styles.css' type='text/css'/>


</head>
<body>


<!--- Question Text Row - 100% --->
<div class='ym-grid question'>
    <div class='ym-gbox item.questionText'>
        <span id='question'></span>
    </div>
</div>

<!--- Blank row separating total points display from answers --->
<div class='ym-grid'>
    <div class='ym-gbox'>
        <div id='QuestionTotalScoreSeparator'>.</div>
    </div>
</div>


<!--- Row containing total Points display --->
<div class='ym-grid '>
    <div class='ym-g40 ym-gl'>
        <div class='ym-gbox'>
            &nbsp;  <!-- Nothing -->
        </div>
    </div>
    <div class='ym-g20 ym-gl totalPointsDisplay'>
        <div class='ym-gbox'>
            <div id='totalpointscounter'><input type='hidden' name='totalpointscounter-value' value='0'/></div>
        </div>
    </div>
    <div class='ym-g40 ym-gr'>
        <div class='ym-gbox'>
            &nbsp;  <!-- Nothing -->
        </div>
    </div>
</div>

<!--- Blank row separating total points display from answers --->
<div class='ym-grid'>
    <div class='ym-gbox'>
        <div id='TotalScoreAnswersSeparator'>.</div>
    </div>
</div>

<!--- First Two Answers Row (e.g., Answer 1 and Answer 5) --->
<div class='ym-grid'>
    <div class='ym-g25 ym-gl'>
        <div class='ym-gbox'>
            &nbsp;  <!-- Nothing -->
        </div>
    </div>
    <div class='ym-g25 ym-gl'>
        <div class='ym-gbox'>
            <span id='answer1'></span>
        </div>
    </div>
    <div class='ym-g25 ym-gl'>
        <div class='ym-gbox'>
            <span id='answer5'></span>
        </div>
    </div>
    <div class='ym-g25- ym-gr'>
        <div class='ym-gbox'>
            &nbsp;  <!-- Nothing -->
        </div>
    </div>
</div>

<!--- Answer 2 and Answer 6) --->
<div class='ym-grid'>
    <div class='ym-g25 ym-gl'>
        <div class='ym-gbox'>
            &nbsp;  <!-- Nothing -->
        </div>
    </div>
    <div class='ym-g25 ym-gl'>
        <div class='ym-gbox'>
            <span id='answer2'></span>
        </div>
    </div>
    <div class='ym-g25 ym-gl'>
        <div class='ym-gbox'>
            <span id='answer6'></span>
        </div>
    </div>
    <div class='ym-g25- ym-gr'>
        <div class='ym-gbox'>
            &nbsp;  <!-- Nothing -->
        </div>
    </div>
</div>


<!--- team 1 score,  Answer 3, Answer 7, team2score) --->
<div class='ym-grid'>
    <div class='ym-g25 ym-gl'>
        <div class='ym-gbox'>
            <div id='team1pointscounter' style='position:relative;left:175px;top:25px;'>
                <input type='hidden' name='team1pointscounter-value' value='0'/></div>
        </div>
    </div>
    <div class='ym-g25 ym-gl'>
        <div class='ym-gbox'>
            <span id='answer3'></span>
        </div>
    </div>
    <div class='ym-g25 ym-gl'>
        <div class='ym-gbox'>
            <span id='answer7'></span>
        </div>
    </div>
    <div class='ym-g25- ym-gr'>
        <div class='ym-gbox'>
            <div id='team2pointscounter' style='position:relative;left:-150px;top:25px;'>
                <input type='hidden' name='team2pointscounter-value' value='0'/></div>
        </div>
    </div>
</div>


<!--- Answer 4 and Answer 8) --->
<div class='ym-grid'>
    <div class='ym-g25 ym-gl'>
        <div class='ym-gbox'>
            &nbsp;  <!-- Nothing -->
        </div>
    </div>
    <div class='ym-g25 ym-gl'>
        <div class='ym-gbox'>
            <span id='answer4'></span>
        </div>
    </div>
    <div class='ym-g25 ym-gl'>
        <div class='ym-gbox'>
            <span id='answer8'></span>
        </div>
    </div>
    <div class='ym-g25- ym-gr'>
        <div class='ym-gbox'>
            &nbsp;  <!-- Nothing -->
        </div>
    </div>
</div>


<!--- Blank row separating answers display from bottom --->
<div class='ym-grid'>
    <div class='ym-gbox'>
        &nbsp;  <!-- Nothing -->
    </div>
</div>



<div id='Strike3'><img src='img/Strike3.png'></img></div>
<div id='Strike1'><img src='img/Strike1.png'></img></div>
<div id='Strike2'><img src='img/Strike2.png'></img></div>

<div id='Team1RingsIn'>1</div>
<div id='Team2RingsIn'>2</div>


</body>
</html>


<!--- Javascript below this line --->


<script>
        $(document).ready(function($) {


 
    // temporary JSON to test board

    var item = {
        'item.questionText': 'Name something brown',
        'answers': [
            {
                'number': 1,
                'response': 'cows',
                'points': '25'
            },
            {
                'number': 2,
                'response': 'shoes',
                'points': '20'
            },
            {
                'number': 3,
                'response': 'ties',
                'points': '15'
            },
            {
                'number': 4,
                'response': 'dirt',
                'points': '10'
            },
            {
                'number': 5,
                'response': 'chocolate',
                'points': '10'
            },
            {
                'number': 6,
                'response': 'cars',
                'points': '9'
            },
            {
                'number': 7,
                'response': 'dogs',
                'points': '6'
            },
            {
                'number': 8,
                'response': 'potatoes',
                'points': '5'
            }
        ]
    };

 
        var audioFamilyFeud = document.getElementById('FamilyFeud');
        var currentWindow = window.name;
    if (currentWindow != 'feudwindow') {
            window.open('#listlast(cgi.script_name, "/")#?item=#url.item#','feudwindow','toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=yes,width=1350,height=900');

    window.history.back();
} else {
    audioFamilyFeud.play();
} 

 


    $.cookie('totalpoints', '0');  // This is the value at top of screen that gets higher as guesses are revealed   

    var questionSet = '';   // This is the encrypted text that references which series of questions are being played



    // set initial value if not already done
    if ($.cookie('team1points') > 0) {
        /* Value already there from previous round */
    } else {
        $.cookie('team1points', '0');
    }

    // set initial value if not already done
    if ($.cookie('team2points') > 0) {
        /* Value already there from previous round */
    } else {
        $.cookie('team2points', '0');
    }

    $.cookie('strikecount', '1');

    $.cookie('lockedout', '0');

<cfloop index= 'i' from='1' to='8'>
    <cfoutput>
            /*Initial Screen Setup*/
        if (answer#i#points > 0  ) {
            $('##answer#i#').text('#i#').addClass('AnswerHidden');
    } else {
            $('##answer#i#').html('#i#').addClass('AnswerNull');
    }


        var keycode#i# = 48 + #i#;
            $(document).keypress(function(e) {
            if(e.which == keycode#i# && $('##answer#i#').hasClass('AnswerHidden')   ) {

        var audio#i# = document.getElementById('ding');
                    audio#i#.play();
        var countanswer#i#spaces = 17 - answer#i#text.length ;
            var answer#i#spaces = '';
            for (var i = 0; i<countanswer#i#spaces; i++)
        {

            answer#i#spaces = answer#i#spaces + '&nbsp;';
        }
            var answertext = answer#i#text +  answer#i#spaces + answer#i#points;
                    $('##answer#i#').flippy({
                color_target: 'black',
                duration: '700',
                direction: 'bottom',
                verso: answertext,
            onMidway: function(){
                    $('##answer#i#').removeClass('AnswerHidden').addClass('AnswerRevealed');
            }

            });




            var newtotal = $.cookie('totalpoints', Number) + answer#i#points;
                    $('##totalpointscounter').flipCounter(
                    'startAnimation', // scroll counter from the current number to the specified number
                    {
                        number: $.cookie('totalpoints', Number), // the number we want to scroll from
                        end_number: newtotal, // the number we want the counter to scroll to
                        easing: jQuery.easing.easeOutCubic, // this easing function to apply to the scroll.
                        duration: 1000 // number of ms animation should take to complete
                    }
            );
                $.cookie('totalpoints', newtotal);
                    $('##question').html(item.questionText);
        }
        });
    </cfoutput>
</cfloop>


    if (answer1points > 0) {
        $('#answer1').text('1').addClass('AnswerHidden');
    } else {
        $('#answer1').html('1').addClass('AnswerNull');
    }







    var ding = document.getElementById('ding');



$.each(item.answers,function(key,value){


    var keycode[value.number] = 48 + value.number;

    $(document).keypress(function (e) {
        if (e.which == keycode[value.number] && $('#answer' + value.number).hasClass('AnswerHidden')) {

            ding.play();

            var countanswer1spaces = 17 - value.response.length;
            var answer1spaces = '';
            for (var i = 0; i < countanswer1spaces; i++) {
                answer1spaces = answer1spaces + '&nbsp;';
            }
            var answertext = answer1text + answer1spaces + answer1points;

            $('#answer1').flippy({
                color_target: 'black',
                duration: '700',
                direction: 'bottom',
                verso: answertext,
                onMidway: function () {
                    $('#answer1').removeClass('AnswerHidden').addClass('AnswerRevealed');
                }

            });


            var newtotal = $.cookie('totalpoints', Number) + answer1points;
            $('#totalpointscounter').flipCounter(
                    'startAnimation', // scroll counter from the current number to the specified number
                    {
                        number: $.cookie('totalpoints', Number), // the number we want to scroll from
                        end_number: newtotal, // the number we want the counter to scroll to
                        easing: jQuery.easing.easeOutCubic, // this easing function to apply to the scroll.
                        duration: 1000 // number of ms animation should take to complete
                    }
            );
            $.cookie('totalpoints', newtotal);
            $('#question').html(item.questionText);
        }
    });

});




    var Team1Won = 32;     // Enter
    var Team2Won = 13;        // Space Bar
    $(document).keypress(function (e) {
        if (e.which == Team1Won && $.cookie('lockedout', Number) == 0) {
            $.cookie('lockedout', '1');
            var audioBuzzer1 = document.getElementById('buzzer');
            audioBuzzer1.play();
            // put in Team 1 visualizer and lockout
            $('#Team1RingsIn').bPopup({
                position: [0, 0] //x, y
                , autoClose: 1000
            });
            $('#question').html(item.questionText);
        } else if (e.which == Team2Won && $.cookie('lockedout', Number) == 0) {
            $.cookie('lockedout', '1');
            var audioBuzzer2 = document.getElementById('buzzer');
            audioBuzzer2.play();
            // put in Team 1 visualizer and lockout
            var viewportWidth = $(window).width();
            var halfwidth = viewportWidth / 2;
            $('#Team2RingsIn').bPopup({
                position: [halfwidth, 0] //x, y
                , autoClose: 1000
            });
            $('#question').html(item.questionText);
        }
    });

    /*

           var Team2Won = 13   ;        // Space Bar
              $(document).keypress(function(e) {
                  if(e.which == Team2Won) {
                      var audioBuzzer2 = document.getElementById('buzzer');
                      audioBuzzer2.play();
                      // put in Team 1 visualizer and lockout
                      var viewportWidth = $(window).width();
                      var halfwidth = viewportWidth / 2 ;
                     $('#Team2RingsIn').bPopup( {
                            position: [halfwidth, 0] //x, y
                          , autoClose: 1000
                        });
            }
              });
    */


    var strike = 48;   // 0
    $(document).keypress(function (e) {
        if (e.which == strike) {
            $('#question').html(item.questionText);
            var audioStrike = document.getElementById('strike');
            audioStrike.play();

            // put in strike visualizer
            var strikecount = $.cookie('strikecount');

            if (strikecount == '1') {
                $('#Strike1').bPopup({
                            autoClose: 1000
                        }
                );
                $.cookie('strikecount', '2');

            } else if (strikecount == '2') {
                $('#Strike2').bPopup({
                            autoClose: 1000
                        }
                );
                $.cookie('strikecount', '3');
            }
            else {
                $('#Strike3').bPopup({
                            autoClose: 1000
                        }
                );

            }
        }
    });



    var onestrike = 57;   //  displays one strike without adding to cumulative strikes i.e., for initial ring in attempts
    $(document).keypress(function (e) {
        if (e.which == onestrike) {
            $('#question').html(item.questionText);
            var audioStrike = document.getElementById('strike');
            audioStrike.play();
            $('#Strike1').bPopup({
                        autoClose: 1000
                    }
            );

        }

    });


    $('#question').html('&nbsp;').addClass('item.questionText');

    $('#question').click(function () {
        $('#question').html(item.questionText);
    });


});
</script>



<script>
    // This is the initial main point counter at the top of the screen
    $(document).ready(function ($) {


        // temporary JSON to test board

        var item = {
            'item.questionText': 'Name something brown',
            'answers': [
                {
                    'number': 1,
                    'text': 'cows',
                    'points': '25'
                },
                {
                    'number': 2,
                    'text': 'shoes',
                    'points': '20'
                },
                {
                    'number': 3,
                    'text': 'ties',
                    'points': '15'
                },
                {
                    'number': 4,
                    'text': 'dirt',
                    'points': '10'
                },
                {
                    'number': 5,
                    'text': 'chocolate',
                    'points': '10'
                },
                {
                    'number': 6,
                    'text': 'cars',
                    'points': '9'
                },
                {
                    'number': 7,
                    'text': 'dogs',
                    'points': '6'
                },
                {
                    'number': 8,
                    'text': 'potatoes',
                    'points': '5'
                } 
            ]
        };

        $('#totalpointscounter').flipCounter(
                'startAnimation', // scroll counter from the current number to the specified number
                {
                    number: 0, // the number we want to scroll from
                    end_number: 0, // the number we want the counter to scroll to
                    easing: jQuery.easing.easeOutCubic, // this easing function to apply to the scroll.
                    duration: 2000, // number of ms animation should take to complete
                    // onAnimationStarted: myStartFunction, // the function to call when animation starts
                    // onAnimationStopped: myStopFunction, // the function to call when animation stops
                    // onAnimationPaused: myPauseFunction, // the function to call when animation pauses
                    //  onAnimationResumed: myResumeFunction // the function to call when animation resumes from pause
                }
        );


    });
</script>



<script>
    <cfloop index= 'i' from='1' to='2'>
        <cfoutput>
        // This is the team  counter initial display
            $(document).ready(function($) {

                    $('##team#i#pointscounter').flipCounter(
                    'startAnimation', // scroll counter from the current number to the specified number
            {
                number: 0, // the number we want to scroll from
            end_number: $.cookie('team#i#points', Number), // the number we want the counter to scroll to
            easing: jQuery.easing.easeOutCubic, // this easing function to apply to the scroll.
            duration: 2000, // number of ms animation should take to complete

        }
        );

                $('##team#i#pointscounter').click(function(){   // put in function to transfer points from top to this team #i#
                var audiotransferpoints = document.getElementById('transferpoints');
                audiotransferpoints.play();
        var newteam#i#total = $.cookie('team#i#points', Number) + $.cookie('totalpoints', Number);
                    $('##team#i#pointscounter').flipCounter(
                    'startAnimation', // scroll counter from the current number to the specified number
            {
            number: $.cookie('team#i#points', Number), // the number we want to scroll from
            end_number: newteam#i#total, // the number we want the counter to scroll to
                easing: jQuery.easing.easeOutCubic, // this easing function to apply to the scroll.
                duration: 1400 // number of ms animation should take to complete
            }

            );
                    $.cookie('team#i#points', newteam#i#total);

                $('##totalpointscounter').flipCounter(
                    'startAnimation', // scroll counter from the current number to the specified number
                    {
                        number: $.cookie('totalpoints', Number), // the number we want to scroll from
                        end_number: 0, // the number we want the counter to scroll to
                        easing: jQuery.easing.easeOutCubic, // this easing function to apply to the scroll.
                        duration: 1400 // number of ms animation should take to complete
                    }
            );


        });

        });
        </cfoutput>
    </cfloop>

</script>

 