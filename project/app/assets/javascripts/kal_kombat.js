

/**
 * Settings for the "library."
 */
var drawingArea = null;

/**
 * Transient state variables used only during mouse activity.
 */
var current = null, transit = null;
var deltaX = 0, deltaY = 0;
/**
 * Variables for the game.
 */
var health = 100; //starting player health
var opponentHealth = 100; //starting opponent health
var damage = 25; //starting damage

/**
 * Variables that hold the damage of each kind of move.
 */
var healthdamage = 15;
var punchdamage = 20;
var kickdamage = 25;

/**
 * Tells the "library" which element on the page serves as the drawing area.
 */
var setDrawingArea = function(element) {
    drawingArea = element;
};

var pressButton = function(element) {
    alert(element.innerHTML);
};

/**
 * Indicates that an element is highlighted.
 */
var highlight = function(element) {
    element.className = "hitrectangle";
};

/**
 * Indicates that an element is unhighlighted.
 */
var unhighlight = function(element) {
    element.className = "rectangle";
};

/**
 * Begins a rectangle move sequence.
 */
var startMove = function(element, event) {
    // Grab the properties of the element.
    current = element;
    var left = parseInt(current.style.left);
    var top = parseInt(current.style.top);
    var width = parseInt(current.style.width);
    var height = parseInt(current.style.height);
    var name = current.innerHTML;

    // Grab the starting point.
    deltaX = event.clientX - left;
    deltaY = event.clientY - top;

    // Create a temporary rectangle for the move.
    transit = document.getElementById(element.id + "beingdragged");
    setupDesignRectangle(transit);
    transit.style.display = "block";
    drawingArea.removeChild(transit);
    drawingArea.appendChild(transit);
};

/**
 * "Tracks" an on-going move sequence.
 */
var move = function(element, event) {
    if (transit !== element) {
        return;
    }

    var newLeft = event.clientX - deltaX;
    var newTop = event.clientY - deltaY;

    transit.style.left = newLeft + "px";
    transit.style.top = newTop + "px";
	
	
};

/**
 * Finishes a move sequence.
 */
var endMove = function(element) {
    var id = element.id;
    var boxName = document.getElementById(element.id);
    
    var opponent = document.getElementById("opponent");
    var opponentLeft = parseInt(opponent.style.left);
    var opponentTop = parseInt(opponent.style.top);
    var opponentWidth = parseInt(opponent.style.width);
    var opponentHeight = parseInt(opponent.style.height);
    
    var opponentRight = opponentLeft+opponentWidth;
    var opponentBottom = opponentTop+opponentHeight;

    var player = document.getElementById("playerImage");
    var playerLeft = parseInt(player.style.left);
    var playerTop = parseInt(player.style.top);
    var playerWidth = parseInt(player.style.width);
    var playerHeight = parseInt(player.style.height);
    var playerRight = playerLeft+playerWidth;
    var playerBottom = playerTop+playerHeight;
    
    var temporaryLeft = parseInt(transit.style.left);
    var temporaryTop = parseInt(transit.style.top);
    
    // string for playerlog
    var logMessage = "";

    if(temporaryLeft>=opponentLeft&&temporaryLeft<=opponentRight&&temporaryTop>=opponentTop&&temporaryTop<=opponentBottom){

        if(element.id==="heal"||element.id==="healbeingdragged"){
            alert("Your opponent is trying to hurt you! Don't heal your opponent dummy! You can only heal yourself.");
            modifyKombatElement(logMessage, "opplog");
        }
        if(isAlive() && element.id !== "healbeingdragged"){
            setDamage(element.id);
            playerMove(damage);
            logMessage += "> You have attacked the opponent! The opponent's health is "+opponentHealth+". Your health is "+health;
            opponentMove();            
        }

    }
    else if(temporaryLeft>=playerLeft&&temporaryLeft<=playerRight&&temporaryTop>=playerTop&&temporaryTop<=playerBottom){
        if(element.id==="heal"||element.id==="healbeingdragged"){//only let user move if the move is heal.
            damage=healthdamage;
            playerMove(damage);
            logMessage += "> You have healed yourself. Your health is: "+health+". Your opponent's health is: "+opponentHealth;
            opponentMove();
            
        }
        else{
            alert("Stop trying to hurt yourself! You should only heal yourself not beat yourself up. Try again!"); //message to user if they make mistake.
            modifyKombatElement(logMessage, "opplog");
        }
    }

    else{
        alert("You need to move the boxes into either your (the player's) box or the opponent's box. Try again!");
        modifyKombatElement(logMessage, "opplog");
    }


    modifyKombatElement(logMessage, "playerlog");
    
    transit.style.left = current.style.left;
    transit.style.top = current.style.top;
    
    transit.style.display = "none";
    transit = null;
    current = null;
};

/**
 * Sets up the given rectangle for design behavior.
 */
var setupDesignRectangle = function(rectangle) {
    rectangle.setAttribute("onmouseover", "highlight(this);");
    rectangle.setAttribute("onmouseout", "unhighlight(this);");
    rectangle.setAttribute("onmousedown", "startMove(this, event);");
    rectangle.setAttribute("onmousemove", "move(this, event);");
    rectangle.setAttribute("onmouseup", "endMove(this);");
    rectangle.setAttribute("onclick", "");
};


/**
 * Adds a new rectangle to the drawing area, with the given initial properties.
 */
var addRectangle = function(left, top, width, height, name) {
    // Create a new div.
    var newRectangle = document.createElement("div");
    newRectangle.setAttribute("class", "rectangle");
    newRectangle.setAttribute("style", "left: " + left + "px; top: " +
            top + "px; width: " + width + "px; height: " + height + "px; z-index: 1000;");
    setupDesignRectangle(newRectangle);
    newRectangle.innerHTML = name;
    drawingArea.appendChild(newRectangle);
    return newRectangle;
};


/**
 * Returns the health of player
 */
var getHealth = function(){
  return health;  
};

/**
 * Returns the health of opponent
 */
var getOpponentHealth = function(){
  return opponentHealth;  
};

/**
 * Sets the damage.
 */
var setDamage = function(id){
    if(id==="heal"||id==="healbeingdragged"){
        damage=healthdamage;
    }
    else if(id==="leftpunch"||id==="leftpunchbeingdragged"||id==="rightpunch"||id==="rightpunchbeingdragged"){
         damage=punchdamage;
    }
    else{
        damage=kickdamage;
    }       
};


/**
 * Makes computer move.
 */
var opponentMove = function(){

    // randomly generates a number between 0 and 2
    var moveForTurn = Math.floor(Math.random() * 3); 

    // string for the opplog
    var logMessage = "";

    // punch
    if(moveForTurn === 0){ //punch option 20 points of damage
        health = health - punchdamage;
        logMessage += "> Your opponent has punched you. Your health is: "+health+". The opponent's health is: "+opponentHealth;
    }
    // kick
    else if(moveForTurn === 1){  //kick option 25 points of damage
        health = health - kickdamage;
        logMessage += "> Your opponent has kicked you. Your health is: "+health+". The opponent's health is: "+opponentHealth;
    }
    // heal
    else{     //heal option 10 points of health
        isAlive();
        opponentHealth = opponentHealth + healthdamage;
        logMessage += "> Your opponent has healed. They have gained some life back. Your health is: "+health+". The opponent's health is: "+opponentHealth;
        modifyKombatElement(opponentHealth, "opponentHP");
    }
    modifyKombatElement(health, "playerHP");
    modifyKombatElement(logMessage, "opplog");
    isAlive();
};


/**
 * Makes player move.
 */
var playerMove = function(damage){

    if(damage===punchdamage){ //punch option 20 points of damage
        opponentHealth=opponentHealth-damage;
        isAlive(); //checks if human player being attacked is alive
    }
    else if(damage===kickdamage){  //kick option 25 points of damage
        opponentHealth=opponentHealth-damage;
        isAlive();
    }
    else{     //heal option 10 points of health
        isAlive();
        health=health+healthdamage;
    }
    modifyKombatElement(opponentHealth, "opponentHP");
};

/**
 * Checks if player is still alive.
 */

var points;
var isAlive = function() {
    if(health<=0){
        var points = health * 100;
        user.score = user.score + points;
        localStorage[user.username] = JSON.stringify(user);
        alert("Game Over! The computer has won the game! Page will automatically refresh to play again!");
        window.location.reload(); //This command refreshes the page, which restarts the game.
        return false; //technically would never get here.
    }
    else if(opponentHealth<=0){ 
        var points = health * 100;
        user.score = user.score+points;
        user.level = user.level + 10;
        localStorage[user.username] = JSON.stringify(user);
        alert("Game Over! You, the player, have won the game! Your score = "+points + " Return to mini game page");
        window.location.href = "../../minigames/desktop?username="+username; //This command refreshes the page, which restarts the game.
        return false; //technically would never get here.
    }
    else{
        return true
    }
};

function clickCounter() {
    if(typeof(Storage) !== "undefined") {
        if (localStorage.clickcount) {
            localStorage.clickcount = Number(localStorage.clickcount)+1;
        } else {
            localStorage.clickcount = 1;
        }
        alert("You have played" + localStorage.clickcount + " time(s).");
    } else {
        alert("Sorry, your browser does not support web storage...");
    }
}

if (isAlive() == false) {
   clickCounter();
}


var modifyKombatElement = function(changeToApply, id) {
    document.getElementById(id).innerHTML = changeToApply;
};

/**
* Changes the player's picture so code monkey fights for user
*/
var selectCodeMonkeyPlayer = function(){
	document.getElementById("playerImage").innerHTML = "You:<div id='playerHP'>100</div><img src='../../assets/codeMonkeyFighter.png' alt='codeMonkeyFighter'></img></div>";
};


/**
* Changes the player's picture to fighting male picture so user can fight KAL as a male
*/
var selectMalePlayer = function(){
	document.getElementById("playerImage").innerHTML = "You:<div id='playerHP'>100</div><img src='../../assets/FightingNormalWeightMale.png' alt='MaleFighterPlayer'></img></div>";
};

/**
* Changes the player's picture to fighting male picture so user can fight KAL as a female
*/
var selectFemalePlayer = function(){
	document.getElementById("playerImage").innerHTML = "You:<div id='playerHP'>100</div><img src='../../assets/FightingNormalWeightFemale.png' alt='FemaleFighterPlayer'></img></div>";
};

/**
* Changes the opponent's picture to original KAL picture so user can fight KAL
*/

var selectKalOpp = function(){
	document.getElementById("opponent").innerHTML = "Opponent:<div id='opponentHP'>100</div><img src= '../../assets/tinyCuteKal.png' alt='KAL'></img></div>";
};

/**
* Changes the opponent's picture to alien KAL picture so user can fight alien KAL
*/
var selectAlienKalOpp = function(){
	document.getElementById("opponent").innerHTML = "Opponent:<div id='opponentHP'>100</div><img src= '../../assets/tinyAlienCuteKal.gif' alt='Alien KAL'></img></div>";
};


$(function() {
						
			<!-- making the beingdragged classes draggable to avoid error that happens when mouse is moved too fast --> 

            $("#leftkick").draggable({ 
				revert: true 
				});
			$("#rightkick").draggable({ 
				revert: true 
				});
			$("#rightpunch").draggable({ 
				revert: true 
				});
			$("#leftpunch").draggable({ 
				revert: true 
			});
			$("#heal").draggable({
			    revert: true,
			});			
			

		
		
			
			$("#playerImage").droppable({
				drop: function( event, ui ) {
				    // string for playerlog
					var logMessage = "";

				if(	ui.draggable.attr('id') === "heal"){ //only let user move if the move is heal.	
					damage=healthdamage;
					playerMove(damage);
					logMessage += "> You have healed yourself. Your health is: "+health+". Your opponent's health is: "+opponentHealth;
					opponentMove();
				}		
				else{
					alert("Stop trying to hurt yourself! You should only heal yourself not beat yourself up. Try again!"); //message to user if they make mistake.
					modifyKombatElement(logMessage, "opplog");
				}	
				modifyKombatElement(logMessage, "playerlog");			

				}
			});
			   
			$("#opponent").droppable({
			
				drop: function( event, ui ) {
				
				//console.log (!(ui.draggable.attr('id') === "heal"));
				
				    // string for playerlog
					var logMessage = "";
				//if statement that has the droppable checks if the draggable id is heal 
				    if ( ui.draggable.attr('id') === "heal"){ //if the user tries to heal the opponent 
						alert("Your opponent is trying to hurt you! Don't heal your opponent dummy! You can only heal yourself."); // inform user that they cannot do that. 
						modifyKombatElement(logMessage, "opplog"); 
					}
					else if (isAlive() && !(ui.draggable.attr('id') === "heal") ) { // if the draggable dropped is anything but heal and the players are alive then attack and have computer move
						setDamage(ui.draggable.attr('id'));
						playerMove(damage);
						logMessage += "> You have attacked the opponent! The opponent's health is "+opponentHealth+". Your health is "+health;
						opponentMove();     
						
					}

					modifyKombatElement(logMessage, "playerlog"); 
				}

			});
			
	});


$(window).on('load resize', function(){

    var w = $(window).width();
    var h = $(window).height();
    
    $("#KALKombat").height(h);
	$("#KALKombat").width(w);
    
});

 


