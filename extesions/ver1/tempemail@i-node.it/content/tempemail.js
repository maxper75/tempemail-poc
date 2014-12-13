var tempEmail=null;
var status=0;
var refreshInterval=null;

//PARTE EXT.

//crea un account con nome casuale
function getMailGenerica()	{
	//tempEmail=null;	TOLTO PER TEST
	loadFile("http://localhost:8080/tempemail/seam/resource/restv1/tempemail/create",setFieldValue);
	controlStatus();
}


//crea un account con nome specificato nel campo text
function getMailStabilita()	{
	//tempEmail=null;	TOLTO PER TEST
	var name=content.document.activeElement.value;
	var url="http://localhost:8080/tempemail/seam/resource/restv1/tempemail/create/";
	url+=name;
	loadFile(url,setFieldValue);
	controlStatus();
}

//GET risorsa
function loadFile (sURL, fCallback ) {
	var oReq = new XMLHttpRequest();
	oReq.callback = fCallback;
	oReq.arguments = Array.prototype.slice.call(arguments, 2);
	oReq.onload = xhrSuccess;
	oReq.onerror = xhrError;
	oReq.open("get", sURL, true);
	oReq.send();
}

function xhrSuccess () { this.callback(this); }

function xhrError () { console.error(this.statusText); }

 
//"polling" dello status
function controlStatus()	{
	if (refreshInterval==null)	
	refreshInterval=window.setInterval(getStatus, 1000);
}

//carica lo status
function getStatus()	{
	if(tempEmail!=null)	
		loadFile("http://localhost:8080/tempemail/seam/resource/restv1/tempemail/status",setStatusValue);  

}

//setta tempEmail in var. globale
function setFieldValue(sVal)	{
	
	tempEmail=sVal.responseText; //setto tempEmail
	if(tempEmail=="non rispetta la sintassi"||tempEmail=="gia presente in database")	{
		alert(tempEmail);		
		tempEmail=null;
		status=0;
		content.document.activeElement.value="";		
		window.clearInterval(refreshInterval);
		refreshInterval=null;
		return;	
	}
	if(tempEmail=="utente gia in sessione")	{	
		alert(tempEmail);
		//window.clearInterval(refreshInterval);
		//refreshInterval=null;
		return;	
	}
	//content.document.activeElement.value=sVal.responseText; PRENDO NOME COMPLETO
	//AGGIUNTO PER TEST STAMPA TUTTO INDIRIZZO	
	loadFile("http://localhost:8080/tempemail/seam/resource/restv1/tempemail/nomeutente",getNome);
}
//AGGIUNTO PER TEST STAMPA TUTTO INDIRIZZO
function getNome(sVal)	{
	content.document.activeElement.value=sVal.responseText;
	alert(sVal.responseText);
}

//setta status in var. globale: se != dal precedente status avvisa l'utente con un confirm
function setStatusValue(sVal)	{
	var pippo=sVal.responseText;
	var json=JSON.parse(pippo);
	
	if(json["countdown"]>0)	{
		if(status!=json["mailboxsize"])	{
			status=json["mailboxsize"]; //setto status,mailboxsize
	  		var dialog=confirm("SERVIZIO DI MAIL TEMPORANEA! \n\n\n Nuova mail! vuoi vederla?");
			if(dialog) {
				var tab = gBrowser.addTab("http://localhost:8080/tempemail/provaJquery.html");
				gBrowser.selectedTab=tab;				
				return true;	
			}
			else
				return false;			
		}

	}
	else	{//scroll
			status=0;
			loadFile("http://localhost:8080/tempemail/seam/resource/restv1/tempemail/delete",del);
			tempEmail=null;
			window.clearInterval(refreshInterval);
			refreshInterval=null;
		}  	
	//}
	
}

function del()	{
	alert("mail scaduta");
}



