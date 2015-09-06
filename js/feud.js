$(document).ready(function ($) {

    var getUrlParameter = function getUrlParameter(sParam) {
        var sPageURL = decodeURIComponent(window.location.search.substring(1)),
            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;

        for (i = 0; i < sURLVariables.length; i++) {
            sParameterName = sURLVariables[i].split('=');

            if (sParameterName[0] === sParam) {
                return sParameterName[1] === undefined ? true : sParameterName[1];
            }
        }
    };


    var gameData = getUrlParameter('gameData');

    // looks for a local script with the data to place on the board
    // Could be modified to get the JSON from an api
    $.getScript("./gameData/" + gameData + ".js", function () {
        var ding = document.getElementById("ding");
        var buzzer = document.getElementById("buzzer");
        var strikeSound = document.getElementById("strike");
        var transferPoints = document.getElementById("transferpoints");
        var feudTheme = document.getElementById("FamilyFeud");


        var currentWindow = window.name;
        if (currentWindow != 'feudwindow') {
            window.open('./board.html', 'feudwindow', 'toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=yes,width=1350,height=900');
            window.history.back();
        } else {
            feudTheme.play();
        }

        var questionText = item.questionText;

        var answer1text = item.answers[0].response;
        var answer1points = item.answers[0].points;
        var answer2text = item.answers[1].response;
        var answer2points = item.answers[1].points;
        var answer3text = item.answers[2].response;
        var answer3points = item.answers[2].points;
        var answer4text = item.answers[3].response;
        var answer4points = item.answers[3].points;
        var answer5text = item.answers[4].response;
        var answer5points = item.answers[4].points;
        var answer6text = item.answers[5].response;
        var answer6points = item.answers[5].points;
        var answer7text = item.answers[6].response;
        var answer7points = item.answers[6].points;
        var answer8text = item.answers[7].response;
        var answer8points = item.answers[7].points;


        $.cookie('totalpoints', '0');  // This is the value at top of screen that gets higher as guesses are revealed

        // set initial value if not already done
        if ($.cookie('team1points') > 0) {
            /* Value already there from previous round */
        } else {
            $.cookie('team1points', '0');
        }

        if ($.cookie('team2points') > 0) {
            /* Value already there from previous round */
        } else {
            $.cookie('team2points', '0');
        }

        $.cookie('strikecount', '1');
        $.cookie('lockedout', '0');


        /*Initial Screen Setup*/
        for (i = 1; i < 9; i++) {
            if (eval('answer' + i + 'points') > 0) {
                $('#answer' + i).text(i).addClass("AnswerHidden");
            } else {
                $('#answer' + i).html(i).addClass('AnswerNull');
            }
        }

        var keycode1 = 48 + 1;
        var keycode2 = 48 + 2;
        var keycode3 = 48 + 3;
        var keycode4 = 48 + 4;
        var keycode5 = 48 + 5;
        var keycode6 = 48 + 6;
        var keycode7 = 48 + 7;
        var keycode8 = 48 + 8;


        var newtotal;

        var Team1Won = 32;     // Enter
        var Team2Won = 13;        // Space Bar
        var strike = 48;   // 0
        var onestrike = 57;   //  displays one strike without adding to cumulative strikes i.e., for initial ring in attempts

        function updateTotalPoints(points) {
            newtotal = $.cookie('totalpoints', Number) + parseInt(points);
            $("#totalpointscounter").flipCounter(
                "startAnimation", // scroll counter from the current number to the specified number
                {
                    number: $.cookie('totalpoints', Number), // the number we want to scroll from
                    end_number: newtotal, // the number we want the counter to scroll to
                    easing: jQuery.easing.easeOutCubic, // this easing function to apply to the scroll.
                    duration: 1000 // number of ms animation should take to complete
                }
            );
            $.cookie('totalpoints', newtotal);
            $("#question").html(questionText);
        }

        function flipResponse(answertext, answerpoints, responseNumber) {
            var countanswerspaces = 17 - answertext.length;
            var answerspaces = '';
            for (var i = 0; i < countanswerspaces; i++) {

                answerspaces = answerspaces + "&nbsp;";
            }
            result = answertext + answerspaces + answerpoints;

            $('#answer' + responseNumber).flippy({
                color_target: 'black',
                duration: "700",
                direction: "bottom",
                verso: result,
                onMidway: function () {
                    $('#answer' + responseNumber).removeClass("AnswerHidden").addClass("AnswerRevealed");
                }

            });
        }

        $(document).keypress(function (e) {
            if (e.which == keycode1 && $('#answer1').hasClass('AnswerHidden')) {
                ding.play();
                flipResponse(answer1text, answer1points, 1);
                updateTotalPoints(answer1points);
            } else if (e.which == keycode2 && $('#answer2').hasClass('AnswerHidden')) {
                ding.play();
                flipResponse(answer2text, answer2points, 2);
                updateTotalPoints(answer2points);
            } else if (e.which == keycode3 && $('#answer3').hasClass('AnswerHidden')) {
                ding.play();
                flipResponse(answer3text, answer3points, 3);
                updateTotalPoints(answer3points);
            } else if (e.which == keycode4 && $('#answer4').hasClass('AnswerHidden')) {
                ding.play();
                flipResponse(answer4text, answer4points, 4);
                updateTotalPoints(answer4points);
            } else if (e.which == keycode5 && $('#answer5').hasClass('AnswerHidden')) {
                ding.play();
                flipResponse(answer5text, answer5points, 5);
                updateTotalPoints(answer5points);
            } else if (e.which == keycode6 && $('#answer6').hasClass('AnswerHidden')) {
                ding.play();
                flipResponse(answer6text, answer6points, 6);
                updateTotalPoints(answer6points);
            } else if (e.which == keycode7 && $('#answer7').hasClass('AnswerHidden')) {
                ding.play();
                flipResponse(answer7text, answer7points, 7);
                updateTotalPoints(answer7points);
            } else if (e.which == keycode8 && $('#answer8').hasClass('AnswerHidden')) {
                ding.play();
                flipResponse(answer8text, answer8points, 8);
                updateTotalPoints(answer8points);

                // initial ringin to see who gets to answer first
            } else if (e.which == Team1Won && $.cookie('lockedout', Number) == 0) {
                $.cookie('lockedout', '1');
                buzzer.play();
                // put in Team 1 visualizer and lockout
                $('#Team1RingsIn').bPopup({
                    position: [0, 0] //x, y
                    , autoClose: 1000
                });
                $("#question").html(questionText);
            } else if (e.which == Team2Won && $.cookie('lockedout', Number) == 0) {
                $.cookie('lockedout', '1');
                buzzer.play();
                // put in Team 2 visualizer and lockout
                var viewportWidth = $(window).width();
                var halfwidth = viewportWidth / 2;
                $('#Team2RingsIn').bPopup({
                    position: [halfwidth, 0] //x, y
                    , autoClose: 1000
                });
                $("#question").html(questionText);
            } else if (e.which == strike) {
                $("#question").html(questionText);
                strikeSound.play();
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
            } else if (e.which == onestrike) {
                $("#question").html(questionText);
                strikeSound.play();
                $('#Strike1').bPopup({
                        autoClose: 1000
                    }
                );

            }

        });


        $("#question").html('&nbsp;').addClass('questionText');

        $('#question').click(function () {
            $("#question").html(questionText);
        });


        $("#totalpointscounter").flipCounter(
            "startAnimation", // scroll counter from the current number to the specified number
            {
                number: 0, // the number we want to scroll from
                end_number: 0, // the number we want the counter to scroll to
                easing: jQuery.easing.easeOutCubic, // this easing function to apply to the scroll.
                duration: 2000, // number of ms animation should take to complete

            }
        );


        $("#team1pointscounter").flipCounter(
            "startAnimation", // scroll counter from the current number to the specified number
            {
                number: 0, // the number we want to scroll from
                end_number: $.cookie('team1points', Number), // the number we want the counter to scroll to
                easing: jQuery.easing.easeOutCubic, // this easing function to apply to the scroll.
                duration: 2000, // number of ms animation should take to complete

            }
        );

        $('#team1pointscounter').click(function () {   // put in function to transfer points from top to this team 1
            transferPoints.play();
            var newteam1total = $.cookie('team1points', Number) + $.cookie('totalpoints', Number);
            $("#team1pointscounter").flipCounter(
                "startAnimation", // scroll counter from the current number to the specified number
                {
                    number: $.cookie('team1points', Number), // the number we want to scroll from
                    end_number: newteam1total, // the number we want the counter to scroll to
                    easing: jQuery.easing.easeOutCubic, // this easing function to apply to the scroll.
                    duration: 1400, // number of ms animation should take to complete
                }
            );
            $.cookie('team1points', newteam1total);

            $("#totalpointscounter").flipCounter(
                "startAnimation", // scroll counter from the current number to the specified number
                {
                    number: $.cookie('totalpoints', Number), // the number we want to scroll from
                    end_number: 0, // the number we want the counter to scroll to
                    easing: jQuery.easing.easeOutCubic, // this easing function to apply to the scroll.
                    duration: 1400 // number of ms animation should take to complete
                }
            );


        });


        $("#team2pointscounter").flipCounter(
            "startAnimation", // scroll counter from the current number to the specified number
            {
                number: 0, // the number we want to scroll from
                end_number: $.cookie('team2points', Number), // the number we want the counter to scroll to
                easing: jQuery.easing.easeOutCubic, // this easing function to apply to the scroll.
                duration: 2000 // number of ms animation should take to complete

            }
        );

        $('#team2pointscounter').click(function () {   // put in function to transfer points from top to this team 2
            transferPoints.play();
            var newteam2total = $.cookie('team2points', Number) + $.cookie('totalpoints', Number);
            $("#team2pointscounter").flipCounter(
                "startAnimation", // scroll counter from the current number to the specified number
                {
                    number: $.cookie('team2points', Number), // the number we want to scroll from
                    end_number: newteam2total, // the number we want the counter to scroll to
                    easing: jQuery.easing.easeOutCubic, // this easing function to apply to the scroll.
                    duration: 1400 // number of ms animation should take to complete
                }
            );
            $.cookie('team2points', newteam2total);

            $("#totalpointscounter").flipCounter(
                "startAnimation", // scroll counter from the current number to the specified number
                {
                    number: $.cookie('totalpoints', Number), // the number we want to scroll from
                    end_number: 0, // the number we want the counter to scroll to
                    easing: jQuery.easing.easeOutCubic, // this easing function to apply to the scroll.
                    duration: 1400 // number of ms animation should take to complete
                }
            );


        });
    });
});

