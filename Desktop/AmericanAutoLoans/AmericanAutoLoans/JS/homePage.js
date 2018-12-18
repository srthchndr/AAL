var show = false;
function dispMsg(x) {
    document.getElementById("why").classList.remove("focus");
    document.getElementById("exp").classList.remove("focus");
    document.getElementById("rate").classList.remove("focus");
    document.getElementById("why1").classList.remove("focus");
    document.getElementById("exp1").classList.remove("focus");
    document.getElementById("rate1").classList.remove("focus");
    document.getElementsByClassName(x).classList += " focus";
    var temp = x + "1";
    show = !show;
    var a = document.getElementById(x);
    if (show) {
        document.getElementById("desc").style.display = "block";
        a.className += " focus";
        document.getElementById(temp).className += " focus";
    } else {
        document.getElementById("desc").style.display = "none";
    }
}

function disp() {
    alert("Page under construction");
}