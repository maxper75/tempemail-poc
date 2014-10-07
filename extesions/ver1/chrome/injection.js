/* Listen for messages */
chrome.runtime.onMessage.addListener(function(msg, sender, sendResponse) {
	if(msg.text&&(msg.text == "mail_stabilita"))	{
		sendResponse(document.activeElement.value);	
	}	
	else if(msg.text)	{
		document.activeElement.value=msg.text;	
		sendResponse(document.activeElement.value);	
	}

});









