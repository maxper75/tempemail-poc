var tempEmail=null;
var status=0;
var refreshInterval=null;
var tab=null;

chrome.contextMenus.create({
	title: "mail stabilita",
	contexts: ["editable"], 
    	onclick: getInputValue
});

chrome.contextMenus.create({
	title: "mail generica",
	contexts: ["editable"], 
    	onclick: getMailGenerica
});

function getInputValue(data,data2)	{
	tab=data2;
	chrome.tabs.sendMessage(data2.id,{ text: "mail_stabilita" },getMailStabilita);
}

function getMailGenerica(data,data2)	{
	tab=data2;
	//loadFile("http://localhost:8080/tempemail/seam/resource/restv1/tempemail/create",data2);
	loadFile("http://localhost:8080/tempemail/seam/resource/restv1/tempemail/create");
	controlStatus();
}

/* A function creator for callbacks */
function getMailStabilita(value) {
	//loadFile("http://localhost:8080/tempemail/seam/resource/restv1/tempemail/create/"+value,null);
	loadFile("http://localhost:8080/tempemail/seam/resource/restv1/tempemail/create/"+value);
	controlStatus();
}

//GET crea mailbox,user
//function loadFile (sURL,data2) {
function loadFile (sURL) {
	var req = new XMLHttpRequest();
	req.open("get",sURL, true);
	req.onreadystatechange = function() {
		if (req.readyState == 4) 
			if (req.status == 200)	{ 
				//controllo errori 
			       tempEmail=req.responseText;
			       if(tempEmail=="non rispetta la sintassi"||tempEmail=="gia presente in database")
				{	alert(tempEmail);					
			       		tempEmail=null;
					status=0;
					window.clearInterval(refreshInterval);
					refreshInterval=null;
					return;				
				}
				if(tempEmail=="utente gia in sessione")	{
					alert(tempEmail);
					return;
				}
				//loadName(data2);
				loadName();				
				//if(data2!=null)	      
				//	chrome.tabs.sendMessage(data2.id,{ text: req.responseText },function(){});
	    		}
        	}	
	req.send();
}

//function loadName(data2)	{
function loadName()	{
	var req = new XMLHttpRequest();
	var ind="http://localhost:8080/tempemail/seam/resource/restv1/tempemail/nomeutente";
	req.open("get",ind, true);
	req.onreadystatechange = function() {
		if (req.readyState == 4) 
      	      		if (req.status == 200)	{	 
				alert(req.responseText);//SETTARE IL CAMPO DILLA CON QUESTO VALORE
				//if(data2!=null)	      
					chrome.tabs.sendMessage(tab.id,{ text: req.responseText },function(){});
			}	
	}
	req.send();
}

//"polling" dello status
function controlStatus()	{				//OK,COME FIREFOX
	if(refreshInterval==null)	
		refreshInterval=window.setInterval(getStatus, 1000);
	
}

//carica lo status
function getStatus()	{
	if(tempEmail!=null)	
		loadStatus("http://localhost:8080/tempemail/seam/resource/restv1/tempemail/status");  
}

//GET restituisce status
function loadStatus (sURL) {
	var req = new XMLHttpRequest();
	req.open("get",sURL, true);
	req.onreadystatechange = function() {
        	if (req.readyState == 4) 
            		if (req.status == 200)	{ 
              			var result=req.responseText;
				var statusResult=JSON.parse(result);
				if(statusResult["countdown"]>0)	{			
					if(status!=statusResult["mailboxsize"])	{
						status=statusResult["mailboxsize"];
						var dialog=confirm("SERVIZIO DI MAIL TEMPORANEA! \n\n\n Nuova mail! vuoi vederla?");
						if(dialog) {
							var newURL = "http://localhost:8080/tempemail/provaJquery.html";
			     				chrome.tabs.create({ url: newURL });
							return true;	
						}
						else
							return false;
					}
	    			}
				else	{
					alert("mail scaduta");
					status=0;
					del();
					tempEmail=null;
					window.clearInterval(refreshInterval);
					refreshInterval=null;
				}  	
	    		}
        	}	
	req.send();
}



function del()	{
	var req = new XMLHttpRequest();
	req.open("get","http://localhost:8080/tempemail/seam/resource/restv1/tempemail/delete", true);
	req.send();
}


