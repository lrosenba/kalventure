$(function () {
                 var str = "<p> Programmer Allison I think someone's in here. </p><p> Programmer Lisa Are they crazy? Do they know how dangerous Kal is? And how long it took to contain KAL?</p>Programmer Kurt Who are you?:  ",
                     strArray = ["<p> Programmer Kurt> Hi, I'm Kurt, the K in KAL. </p>",
                                 "<p> Programmer Allison> Hello, I'm Allison, the A in KAL. </p>",
                                 "<p> Programmer Lisa> Hey, I'm Lisa, the L in KAL. </p>",
                                 "<p> Programmer Allison> We are the KAL programming team. We made KAL. </p>",
                                 "<p> Guest> Hey what about me! </p>",
                                 "<p> Programmer Kurt> Ignore Kenny. He's just one of our interns. Kenny not now! </p>",
                                 "<p> Programmer Lisa> Logoff right now Kenny! </p>",
                                 "<p> < Guest logged off > </p>",
                                 "<p> Programmer Allison> Anyways, KAL has gone rogue. Since you're in there already, we'll do our best to get you out. </p>",
                                 "<p> Programmer Lisa> We're going to do our best to get you out of there but KAL has overridden the controls. We need your help to get pieces of the escape code. KAL has hidden the pieces of the escape code behind security. KAL thinks people will never be able to breach its security because KAL believes all humans are lazy and out of shape so KAL made sure the security system can only be unlocked via movement. </p>",
                                 "<p> Programmer Kurt> But KAL has underestimated humans! It won't take KAL long to figure this out and ramp up the security. </p>",
                                 "<p> Programmer Allison> But we'll help you along the way! We're working on programs to make KAL's security easier to bypass. We'll let you know when we're finished as we make them. </p>",
                                 "<p> Programmer Lisa> So, let's get started. </P>",
                                 "<p><br> KAL> Yes, puny human. Let's play. </p>"],

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
                 function type2() {
                         var txt;
                         var num = 0;
                         for (var j = 0; j < strArray.length; j++) {
                             txt = strArray[i].slice(0, ++num);
                             if (txt === strArray[i]) {return;}
                             document.getElementById('ProgrammerIntros').innerHTML = txt;
                             var char = txt.slice(-1);
                             if( char === '<' ) {isTag = true;}
                             if( char === '>' ) {isTag = false;}
                             if (isTag) {return type2();}
                             setTimeout(type2, 80);
                         }
                 }

                 $("#area").keydown(function(event) {
                     if (event.which === 13) {
                         event.preventDefault();
                         type2();
                     }
                 });   

});















