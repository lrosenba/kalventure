
$(function () {
                 var str = document.getElementById('firstText').innerHTML,
                   i = 0,
                   isTag,
                   text;
                 alert(str);
                 (function type() {
                     text = str.slice(0, ++i);
                     if (text === str) {return;}
                         
                     document.getElementById('frst').innerHTML = text;
                     var char = text.slice(-1);
                     if( char === '<' ) {isTag = true;}
                     if( char === '>' ) {isTag = false;}
                     if (isTag) {return type();}
                     setTimeout(type, 40);
                 }());

});

function displayText2() {
    var str = document.getElementById('ProgrammerIntros').innerHTML,
                   i = 0,
                   isTag,
                   text;
                 alert("in display 2");
                 (function type() {
                     text = str.slice(0, ++i);
                     if (text === str) {return;}

                     document.getElementById('second').innerHTML = text;
                     var char = text.slice(-1);
                     if( char === '<' ) {isTag = true;}
                     if( char === '>' ) {isTag = false;}
                     if (isTag) {return type();}
                     setTimeout(type, 40);
                 }());
}
