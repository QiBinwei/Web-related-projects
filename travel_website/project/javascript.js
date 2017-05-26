function suggest(str) {

    if (str.length == 0) { 
        document.getElementById("suggesationbox").innerHTML = "";
		document.getElementById("suggesationbox").style.display = "none";   
        return;
    }
	else {
		document.getElementById("suggesationbox").innerHTML = "";
		var xhttp;
		if (window.XMLHttpRequest) {
			xhttp = new XMLHttpRequest();
		} 
		else {			
			xhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}        
        xhttp.onreadystatechange = function() {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                document.getElementById("suggesationbox").innerHTML = xhttp.responseText;
				document.getElementById("suggesationbox").style.display = "block"; 
            }
        };
        xhttp.open("GET", "searchhotel?startswith="+str, true);
        xhttp.send();
    }
}