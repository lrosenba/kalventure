       /**
	* Calculates whether player will advance to next stage of game.
	*/
       var count = 100;
       var level = 2;	
       var judge = function(){
           // randomly generates a number between 0 and 9 (10 numbers)
           var moveForTurn = Math.floor(Math.random() * 10); 

           // string for the log
           var logMessage = "";
	
	   if (moveForTurn < 6) { //60% chance of winning
              level+=1;
              user.level = level;
              user.score = user.score + count;
              localStorage[user.username] = JSON.stringify(user);
              document.getElementById("image").innerHTML = "<img src = '../../assets/sadTinyCuteKal-Winner.png' style = 'width: 60%'>";
	      logMessage += "KAL has deemed your dance moves worthy. You win! Your score = "+count+". You have successfully danced to advance. You found a piece of the escape code for the KAL Programming Team!";
	      document.getElementById("log").innerHTML = logMessage;
	      document.getElementById("advanceButton").style.display = "initial";
	      document.getElementById("judgeButton").style.display = "none";		
	      document.getElementById("log").style.color = "lime";
			
          } else { //40% chance of losing
              count -= 1;   
              document.getElementById("image").innerHTML = "<img src = '../../assets/happyTinyCuteKal-Lost.png' style = 'width: 60%'>";
	      logMessage += "KAL has deemed your dance moves unworthy. You can do better than that! Please Try Again!";
	      document.getElementById("log").innerHTML = logMessage;
	      document.getElementById("judgeButton").style.display = "none"; //make the judge button disappear when user loses by setting style attribute to none
	      document.getElementById("startButton").style.display = "initial"; //make the start button appear by setting style attribute to initial
	      document.getElementById("log").style.color = "red";
	  }
			
        };
	
	/**
	* Reveals the judge button by making the judge button visible by setting its style display to initial value
	*/
	var reveal = function (){
		document.getElementById("judgeButton").style.display = "initial"; // reveals the judge Button
	};
	
	/**
	* Dance wait function. Waits while the user does his or her dance for Kal. Then reveals the judge button to the user.
	*/
	var danceWait = function (){
		document.getElementById("startButton").style.display = "none"; //make the start button disappear by setting style attribute to none	
		setTimeout(reveal, 15000); //wait 30 seconds before revealing judge button 
	};
