// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
function checkLogin() {
    if (JSON.parse(localStorage[document.getElementById('login_username')]).username === document.getElementById('login_username').value && JSON.parse(localStorage[document.getElementById('login_username')]).pass === document.getElementById('login_pwd').value) {        
        if(typeof(Storage) !== "undefined") {
            if (localStorage.clickcount) {
                localStorage.clickcount = Number(localStorage.clickcount)+1;
            } else {
                localStorage.clickcount = 1;
            }
            document.getElementById("result").innerHTML = "You have clicked the button " + localStorage.clickcount + " time(s).";
        } else {
            document.getElementById("result").innerHTML = "Sorry, your browser does not support web storage...";
        }
        window.location.href = "../menu/start";
    } else {
        return false;
    }
}

