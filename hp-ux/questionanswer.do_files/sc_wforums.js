// HP Common Metrics Architecture 20060415a
// BEGIN Clickstream:
var s_hp_optOut = false // WARNING: IF SET TO TRUE, PAGE WILL NOT BE TRACKED

// Common Dynamic Account structure - please do not use unless authorized by CKM&A Ops
var s_dynamicAccountSelection=false;
var s_dynamicAccountList="devhphqesupport=htx413-f.cce.hp.com,whp-java1.extweb.hp.com";
var s_dynamicAccountMatch=window.location.hostname

var s_account="hphqglobal,hphqWWsupportitrc"

//Link Tracking Config
var s_trackDownloadLinks=true
var s_trackExternalLinks=true
var s_trackInlineStats=true
var s_linkDownloadFileTypes="exe,zip,wav,mp3,mov,mpg,avi,doc,pdf,xls,cgi,dot,pot,ppt,wmv,asx"
var s_linkInternalFilters="javascript:,hp.com,compaq"
var s_linkLeaveQueryString=true
var s_linkTrackVars=""
var s_linkTrackEvents=""

var s_prop1,s_prop6,s_prop7,s_prop8,s_prop9,s_pageName
s_hp_itrcForumsLogic()
function s_hp_itrcForumsLogic() {
	var currentURL = location.href ;
	var bizSupport = "";
	if (window.document.title.toLowerCase().indexOf("business") > -1) {
		bizSupport = "/bizsupport" ;	
	}
	//Check whether its a parseURL
	var indexOfCurl = currentURL.indexOf("/parseCurl.do?CURL=") ;
	if ( indexOfCurl > -1) {
		var baseForumsUrl = currentURL.substring(0,indexOfCurl);
		while (true) {
			if (currentURL.indexOf("%2F") == -1) {
				break ;
			}
			currentURL= currentURL.replace("%2F","/");
		}
		var curl = currentURL.substring(indexOfCurl + 19);
		//Check the to see any other query string is present
		indexOfCurl = curl.indexOf("&");
		if (indexOfCurl > 0) {
			curl = curl.substring(0,indexOfCurl);
		}
		//Now process the curl
		if( curl == ("/cm") || curl == ("/cm/") ||
			curl.indexOf("cm/Home") != -1 ||
			curl.indexOf("cm/1,,,00.html") != -1 || curl.indexOf("cm/1,,2,00.html") != -1 ||
			curl.indexOf("cm/1,,1,00.html") != -1 ||
			curl.indexOf("cm/0,,,00.html") != -1 || curl.indexOf("cm/0,,2,00.html") != -1 ||
			curl.indexOf("cm/0,,1,00.html") != -1 ) {
			currentURL = baseForumsUrl + bizSupport + "/home.do" ;
		}
		else if( curl.indexOf("/cm/FamilyHome/") != -1 ) {
			currentURL = baseForumsUrl + bizSupport + "/familyhome.do" ;
		}
		else if( curl.indexOf("/cm/CategoryHome/") != -1 ) {
			currentURL = baseForumsUrl + bizSupport + "categoryhome.do" ;
		}
		else if( curl.indexOf("/cm/UserProfile/") != -1 ) {
			currentURL = baseForumsUrl + bizSupport + "publicProfile.do" ;
		}
		else if( curl.indexOf("cm/EditProfile") != -1 ) {
			currentURL = baseForumsUrl + bizSupport + "publicProfile.do" ;
		}	
	}
	//parseUrl processing ends here.
	if (currentURL.indexOf("/service") == -1 ){
		currentURL = currentURL + "/service/forums/home.do" ;
	}
	//s_prop1=''; // Registered user (for ITRC only, empty for BSC)
	//s_prop9='';
	// Page Type
	s_pageName =  _av(currentURL,"service/forums/bizsupport/",".do","unknown");
	// Page Type
	if (s_pageName == 'unknown') {
		s_pageName = _av(currentURL,"service/forums/",".do","unknown");
		if (s_pageName != 'unknown') {
			s_pageName='itrcforums/' + _av(currentURL,"service/forums/",".do","unknown");;
			s_account='hphqglobal,hphqWWsupportitrc';
			s_prop9='Enterprise'; // segment
			// Registered user (for ITRC forums only)
			s_prop1='N';
			if (document.cookie.indexOf("HP-ESC-USERID")>=0) {
				s_prop1='Y';
			}
  		}
	} else {
		s_pageName='bizforums/' + s_pageName;
		s_account='hphqglobal,hphqWWsupportBSD';
		s_prop9='SMB'; // segment
	}

	if (s_pageName == 'unknown') { //Could be James Page.
		s_pageName =  _av(currentURL,"service/james/bizsupport/",".do","unknown");
		// Page Type
		if (s_pageName == 'unknown') {
			s_pageName = 	_av(currentURL,"service/james/",".do","unknown");
			if (s_pageName != 'unknown') {
				s_pageName='itrcforums/james/' + _av(currentURL,"service/james/",".do","unknown");;
				s_account='hphqglobal,hphqWWsupportitrc';
				s_prop9='Enterprise'; // segment
				// Registered user (for ITRC forums only)
				s_prop1='N';
				if (document.cookie.indexOf("HP-ESC-USERID")>=0) {
					s_prop1='Y';
				}
			}
		}else{
			s_pageName='bizforums/james/' + s_pageName;
			s_account='hphqglobal,hphqWWsupportBSD';
			s_prop9='SMB'; // segment
		}
	}
	if (s_pageName == 'unknown') { //Could be Ciss login/logout Page.
		s_pageName = 	_av(currentURL,"service/ciss/",".do","unknown");
		if (s_pageName != 'unknown') {
			s_pageName='itrcforums/ciss/' + _av(currentURL,"service/ciss/",".do","unknown");;
			s_account='hphqglobal,hphqWWsupportitrc';
			s_prop9='Enterprise'; // segment
			// Registered user (for ITRC forums only)
			s_prop1='N';
			if (document.cookie.indexOf("HP-ESC-USERID")>=0) {
				s_prop1='Y';
			}
		}
	}
	s_prop6='';
	s_prop7='cc'; // country
	s_prop8='en'; // language
}


// Common metrics plugin function - do not remove
function s_hp_doMetricsPlugins() { 
} // end function ()

function _av(_u,_lb,_rb,_dv){
var _i=_u.indexOf(_lb);
if(_i>=0){_u=_u.substring(_i+_lb.length);var _j=_u.indexOf(_rb);if(_j<0){_dv=_u}else{_dv=_u.substring(0,_j)}}
return _dv;
}

/*** DO NOT MODIFY THIS SECTION ***/
/* Under no circumstances should you modify this code */
//s_hp_includeJavaScriptFile("welcome.hp-ww.com","/cma/metrics/sc/s_code_remote.js");
s_hp_includeJavaScriptFile("welcome.hp-ww.com","/cma/metrics/sc/s_code_remote.js");

function s_hp_includeJavaScriptFile(hp_hostname,hp_path) {
	if(!(window.s_hp_optOut && window.s_hp_optOut == true)) {
		var hp_ssl=(window.location.protocol.toLowerCase().indexOf('https')!=-1)
		if(hp_hostname && hp_hostname.length>0) {
			if(hp_ssl == true && hp_hostname.toLowerCase().indexOf("welcome.") != -1) { hp_hostname = "secure.hp-ww.com"; }
			var fullURL = "http" + (hp_ssl?"s":"") + "://" + hp_hostname + hp_path
		}
		else
			var fullURL=hp_path;
		document.write("<sc" + "ript language=\"JavaScript\" src=\""+fullURL+"\"></sc" + "ript>");
	}
}
// END Clickstream:
