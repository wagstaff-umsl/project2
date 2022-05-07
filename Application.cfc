component {

	THIS.name = "contact" & hash(getCurrentTemplatePath());
	THIS.sessionManagement = false;
	THIS.setClientCookies = false;


	
	public boolean function onRequestStart(required string targetPage) {
		request.db = createObject("component","db");
        include "header.cfm";
		return true;
	}



	public void function onRequestEnd() {
        include "footer.cfm";
		return;
	}

	public void function onAbort(required string targetPage) {
		return;
	}

	public void function onError(required any exception, required string eventName) {
		writeDump(exception)
		return;
	}

	public boolean function onMissingTemplate(required string targetPage) {
		return true;
	}
}