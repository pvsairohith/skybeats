var mysong3 = document.getElementById("mysong");
var icon3 = document.getElementById("icon");
                  
icon3.onclick = function() {
    if(mysong3.paused) {
        mysong3.play();
    }
    else
    {
        mysong3.pause();
    }
}