
/* ===========================================================
 * falling_kals.js v1
 * ===========================================================
 * NOTE: This plugin is based on the work by Jason Brown (Loktar00)
 * https://github.com/loktar00/JQuery-Snowfall
 * http://www.thepetedesign.com
 *
 * As the end of the year approaches, let's add 
 * some festive to your website!
 *
 * https://github.com/peachananr/let_it_snow
 *
 * ========================================================== */

!function($){
  var score = 0;
  var defaults = {
    speed: 0,
    interaction: true,
    size: 2,
    count: 200,
    opacity: 0,
    color: "#ffffff",
    windPower: 0,
    image: false
	};  	
  
  $.fn.let_it_snow = function(options){
    var settings = $.extend({}, defaults, options),
        el = $(this),
        flakes = [],
        canvas = el.get(0),
        ctx = canvas.getContext("2d"),
        flakeCount = settings.count,
        mX = -100,
        mY = -100;
    
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
        
    (function() {
        var requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame ||
        function(callback) {
            window.setTimeout(callback, 1000 / 60);
        };
        window.requestAnimationFrame = requestAnimationFrame;
    })();
    
    function snow() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        ctx.font = "italic 20px Lucida";
        ctx.strokeStyle="#660033";
        ctx.rect(canvas.width-165, 15, 150, 60);
        ctx.stroke();
        ctx.fillStyle="#82B4B4";
        ctx.fill();
        ctx.strokeStyle="#006600";
        ctx.strokeText("score: "+score, canvas.width-150, 50);

       /** var handMesh = hand.data('riggedHand.mesh');

        var screenPosition = handMesh.screenPosition(
          hand.palmPosition,
          riggedHandPlugin.camera
        );*/

        for (var i = 0; i < flakeCount; i++) {
            var flake = flakes[i],
                //x = mX,
                //y = mY,
                x = xPos,
                y = 700-yPos,
                minDist = 200,
                x2 = flake.x,
                y2 = flake.y;
            ctx.strokeText("xPos "+x, canvas.width-150, 150);
            ctx.strokeText("yPos "+y, canvas.width-150, 200);
            var dist = Math.sqrt((x2 - x) * (x2 - x) + (y2 - y) * (y2 - y)),
                dx = x2 - x,
                dy = y2 - y;

            if (dist < minDist) {
                //var force = minDist / (dist * dist),
                //    xcomp = (x - x2) / dist,
                //    ycomp = (y - y2) / dist,
                //    deltaV = force / 2;

                //flake.velX -= deltaV * xcomp;
                //flake.velY -= deltaV * ycomp;
                score+=100;
                reset(flake);

            } else {
                flake.velX *= .98;
                if (flake.velY <= flake.speed) {
                    flake.velY = flake.speed
                }
                
                switch (settings.windPower) { 
                  case false:
                    flake.velX += Math.cos(flake.step += .05) * flake.stepSize;
                  break;
                  
                  case 0:
                    flake.velX += Math.cos(flake.step += .05) * flake.stepSize;
                  break;
                  
                  default: 
                    flake.velX += 0.01 + (settings.windPower/100);
                }
            }

            var s = settings.color;
            var patt = /^#([\da-fA-F]{2})([\da-fA-F]{2})([\da-fA-F]{2})$/;
            var matches = patt.exec(s);
            var rgb = parseInt(matches[1], 16)+","+parseInt(matches[2], 16)+","+parseInt(matches[3], 16);

            
            flake.y += flake.velY;
            flake.x += flake.velX;

            if (flake.y >= canvas.height || flake.y <= 0) {
                reset(flake);
            }


            if (flake.x >= canvas.width-170 || flake.x <= 0) {
                reset(flake);
            }
            if (settings.image == false) {
              ctx.fillStyle = "rgba(" + rgb + "," + flake.opacity + ")"
              ctx.beginPath();
              ctx.arc(flake.x, flake.y, flake.size, 0, Math.PI * 2);
              ctx.fill();
            } else {
              
              ctx.drawImage($("img#lis_flake").get(0), flake.x, flake.y, flake.size * 2, flake.size * 2);
            }
            
        }
        requestAnimationFrame(snow);
    };
    
    
    function reset(flake) {
        
        if (settings.windPower == false || settings.windPower == 0) {
          flake.x = Math.floor(Math.random() * (canvas.width-250));
          flake.y = 0;
        } else {
          if (settings.windPower > 0) {
            var xarray = Array(Math.floor(Math.random() * (canvas.width-250)), 0);
            var yarray = Array(0, Math.floor(Math.random() * canvas.height))
            var allarray = Array(xarray, yarray)
            
            var selected_array = allarray[Math.floor(Math.random()*allarray.length)];
            
             flake.x = selected_array[0];
             flake.y = selected_array[1];
          } else {
            var xarray = Array(Math.floor(Math.random() * (canvas.width-250)),0);
            var yarray = Array(canvas.width, Math.floor(Math.random() * canvas.height))
            var allarray = Array(xarray, yarray)

            
            var selected_array = allarray[Math.floor(Math.random()*allarray.length)];
            
             flake.x = selected_array[0];
             flake.y = selected_array[1];
          }
        }
        
        flake.size = (Math.random() * 3) + settings.size;
        flake.speed = (Math.random() * 1) + settings.speed;
        flake.velY = flake.speed;
        flake.velX = 0;
        flake.opacity = (Math.random() * 0.5) + settings.opacity;
    }
     function init() {
      for (var i = 0; i < flakeCount; i++) {
          var x = Math.floor(Math.random() * (canvas.width-250)),
              y = Math.floor(Math.random() * canvas.height),
              size = (Math.random() * 3)  + settings.size,
              speed = (Math.random() * 1) + settings.speed,
              opacity = (Math.random() * 0.5) + settings.opacity;
      
          flakes.push({
              speed: speed,
              velY: speed,
              velX: 0,
              x: x,
              y: y,
              size: size,
              stepSize: (Math.random()) / 30,
              step: 0,
              angle: 180,
              opacity: opacity
          });
      }
      
      snow();
    }
   

    //****execution**** 
    if (settings.image != false) {
      $("<img src='"+settings.image+"' style='display: none' id='lis_flake'>").prependTo("body")
    }
    
    init();
   
    $(window).resize(function() {
      if(this.resizeTO) clearTimeout(this.resizeTO);
      this.resizeTO = setTimeout(function() {
        el2 = el.clone();
        el2.insertAfter(el);
        el.remove();
        
        el2.let_it_snow(settings);
      }, 200);
    });
    
    if (settings.interaction == true) {
      canvas.addEventListener("mousemove", function(e) {
          mX = e.clientX,
          mY = e.clientY
      });
    }
  }
  $.fn.runLeap = function() {
    
      // this code is from "https://developer.leapmotion.com/gallery/left-or-right"
      var riggedHandPlugin;

      Leap.loop({
          hand: function(hand){
              var label = hand.data('label');


              if (!label){

                  label = document.createElement('label');
                  document.body.appendChild(label);

                  /**
                   * Here we set the label to show the hand type
                   */
                  //label.innerHTML = hand.type + " hand";

                  //hand.data('label', label)

              }


              var handMesh = hand.data('riggedHand.mesh');

              var screenPosition = handMesh.screenPosition(
                  hand.palmPosition,
                  riggedHandPlugin.camera
              );

              xPos = screenPosition.x;
              yPos = screenPosition.y;

              //label.style.left = screenPosition.x + 'px';
              //label.style.bottom = screenPosition.y + 'px';

          }
      })
      .use('riggedHand')
      .use('handEntry')
      .on('handLost', function(hand){
          var label = hand.data('label');
          if (label){
              document.body.removeChild(label);
              hand.data({label: undefined});
          }
      })
      /**.use('playback', {
          recording: './left-or-right-77fps.json.lz',
          timeBetweenLoops: 1000
      });*/

      riggedHandPlugin = Leap.loopController.plugins.riggedHand;
  }
}(window.jQuery);
