var tempEmail=null;
//crea un account con nome casuale
function getMailGenerica()	{
	loadFile("http://localhost:8080/tempemail/seam/resource/restv1/tempemail/create",setFieldValue);
}

//crea un account con nome specificato nel campo text
function getMailStabilita()	{
	var name=content.document.activeElement.value;
	var url="http://localhost:8080/tempemail/seam/resource/restv1/tempemail/create/";
	url+=name;
	loadFile(url,setFieldValue);
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

//setta tempEmail in var. globale
function setFieldValue(sVal)	{
	tempEmail=sVal.responseText; //setto tempEmail
	if(tempEmail=="non rispetta la sintassi"||tempEmail=="gia presente in database")	{
		alert(tempEmail);		
		tempEmail=null;
		content.document.activeElement.value="";		
		return;	
	}
	if(tempEmail=="utente gia in sessione")	{	
		alert(tempEmail);
		return;	
	}
	loadFile("http://localhost:8080/tempemail/seam/resource/restv1/tempemail/nomeutente",getNome);
}
 
//AGGIUNTO PER TEST STAMPA TUTTO INDIRIZZO
function getNome(sVal)	{
	content.document.activeElement.value=sVal.responseText;
	alert(sVal.responseText);
	getPush();
}



//carica lo status
function getPush()	{		//si lavora sul push		
	if(tempEmail!=null)	{	
		loadFile("http://localhost:8080/tempemail/seam/resource/restv1/tempemail/push",setPushValue);
	}	
}

function setPushValue(sVal)	{
	var res=sVal.responseText;
	var json=JSON.parse(res);
	var mess=json["aaData"][0];
	if(mess!=null)	{
		if(mess["messageId"]>0)	{
			var dialog=confirm("SERVIZIO DI MAIL TEMPORANEA! \n\n\n Nuova mail! vuoi vederla?");
			if(dialog) {
				var tab = gBrowser.addTab("http://localhost:8080/tempemail/provaJqueryV2.html");
				gBrowser.selectedTab=tab;				
			}
			else getPush();
		}
		//SI ENTRA QUI SE SI ELIMINA LA CASELLA
		else	{
			loadFile("http://localhost:8080/tempemail/seam/resource/restv1/tempemail/delete",del);
			return;
		}
	}
	else	{
		//SI ENTRA QUI SE NON ARRIVA IL MESSAGGIO NEL PUSH (messaggio vuoto) ANCHE SE LA MAIL E' SCADUTA	
		loadFile("http://localhost:8080/tempemail/seam/resource/restv1/tempemail/status",setStatusValue);		
	}

}

function del()	{
	tempEmail=null;
	alert("mail scaduta");
}

function setStatusValue(sVal)	{
	var pippo=sVal.responseText;
	var json=JSON.parse(pippo);
	if(json["countdown"]<=0)	
		loadFile("http://localhost:8080/tempemail/seam/resource/restv1/tempemail/delete",del);		
	else	{ 
		getPush();
	}
}





