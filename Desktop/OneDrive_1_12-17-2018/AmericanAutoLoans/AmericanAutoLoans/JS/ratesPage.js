var xmlreq = new XMLHttpRequest();
xmlreq.onreadystatechange = displayTable;
xmlreq.open("GET", "xml/rates.xml", true);
xmlreq.send();

function displayTable() {
    if (xmlreq.readyState == 4) {
        var doc = xmlreq.responseXML;
        var ele = doc.getElementsByTagName("ratesInfo");
        var table = "<tr><th>Loan Amount</th><th>24-36 mon</th><th>37-48 mon</th><th>49-60 mon</th><th>61-72 mon</th><th>73-84 mon</th></tr>";
        var i;
        for (i = 1; i < 5; i++) {
            table += "<tr><td>" + ele[0].getAttribute("loanAmount" + i) + "</td><td>" + ele[0].getAttribute("months0" + i + "-2436") + "</td><td>" + ele[0].getAttribute("months0" + i + "-3748") + "</td><td>" + ele[0].getAttribute("months0" + i + "-4960") + "</td><td>" + ele[0].getAttribute("months0" + i + "-6172") + "</td><td>" + ele[0].getAttribute("months0" + i + "-7384") + "</td></tr>";
        }
        document.getElementById("info").innerHTML = table;
    }

}