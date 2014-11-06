$(function () {
                 var str = "<p> Programmer Allison I think someone's in here. </p><p> Programmer Lisa Are they crazy? Do they know how dangerous Kal is? And how long it took to contain KAL?</p>Programmer Kurt Who are you?:  ",
                 i = 0,
                 isTag,
                 text;
                 (function type() {
                     text = str.slice(0, ++i);
                     if (text === str) {return;}
                         
                     document.getElementById('first').innerHTML = text;
                     var char = text.slice(-1);
                     if( char === '<' ) {isTag = true;}
                     if( char === '>' ) {isTag = false;}
                     if (isTag) {return type();}
                     setTimeout(type, 80);
                 }());
                 function textbox() {
                      $("<input></input>").appendTo("#first");
                      $("input").attr("id", "area");
                      document.getElementById('area').focus();
                 }
                 //must change if we add/delete text.
                 setTimeout(textbox, 16000);

});
