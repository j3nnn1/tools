// HPWEB JAVASCRIPT hpweb_utilities.js VERSION hpweb.1.2h-ie8

// Files and directory structures
if (document.location.protocol == "https:") {
	var cssDomain = "https://secure.hp-ww.com";
	var cssDir = cssDomain + "/country/us/en/styles/";
} else {
	var cssDomain = "http://welcome.hp-ww.com";
	var cssDir = cssDomain + "/country/us/en/styles/";
}

	var NS4CSS = "hpweb_styles_ns4.css";
	var winIECSS = "hpweb_styles_win_ie.css";
	var winIE6CSS = "hpweb_styles_win_ie6.css";
	var winIE8CSS = "hpweb_styles_win_ie8.css";
	var strdCSS = "hpweb_styles_strd.css";
	var macCSS = "hpweb_styles_mac.css";

	//  CLIENT_SIDE SNIFFER CODE
	// convert all characters to lowercase
	var agt=navigator.userAgent.toLowerCase();

	// *** BROWSER VERSION ***
	// Note: On IE5, these return 4, so use is_ie5up to detect IE5.
	var is_major = parseInt(navigator.appVersion);
	var is_minor = parseFloat(navigator.appVersion);

	// *** BROWSER TYPE ***
	var is_nav  = ((agt.indexOf('mozilla')!=-1) && (agt.indexOf('spoofer')==-1)
	            && (agt.indexOf('compatible') == -1) && (agt.indexOf('opera')==-1)
	            && (agt.indexOf('webtv')==-1));
	var is_nav4 = (is_nav && (is_major == 4));
	var is_nav5 = (is_nav && (is_major == 5));
	var is_nav5up = (is_nav && (is_major >= 5));
	var is_nav6 = (is_nav && (is_major == 6));
	var is_nav4up = (is_nav && (is_major >= 4));
	var is_nav6up = (is_nav && (is_major >= 6));
	var is_ie   = (agt.indexOf("msie") != -1);
	var ie_ver = "";
    if(is_ie) ie_ver = parseInt(/msie (\d)/i.exec(agt)[1]);
	var is_ie3  = (is_ie && (is_major < 4));
	var is_ie5  = (is_ie && (is_major == 4) && (agt.indexOf("msie 5.0")!=-1) );
	var is_ie5up  = (is_ie  && !is_ie3 && !is_ie4);
	var is_ie6    = (is_ie && (is_major == 4) && (agt.indexOf("msie 6.")!=-1) );
	var is_ie7    = (is_ie && (is_major == 4) && (agt.indexOf("msie 7.")!=-1) );
	var is_ie8    = (is_ie && (is_major == 4) && (agt.indexOf("msie 8.")!=-1) );
    var is_ie8up    = (is_ie && (is_major == 4) && (ie_ver >= 8));
	var is_ie4  = (is_ie && (is_major <= 4) && !is_ie5 && !is_ie6 && !is_ie7);
	var is_opera = (agt.indexOf("opera") != -1);

	// *** PLATFORM ***
	var is_win   = ( (agt.indexOf("win")!=-1) || (agt.indexOf("16bit")!=-1) );
	var is_mac    = (agt.indexOf("mac")!=-1);
	var is_sun   = (agt.indexOf("sunos")!=-1);
	var is_irix  = (agt.indexOf("irix") !=-1);    // SGI
	var is_hpux  = (agt.indexOf("hp-ux")!=-1);
	var is_aix   = (agt.indexOf("aix") !=-1);      // IBM
	var is_linux = (agt.indexOf("inux")!=-1);
	var is_sco   = (agt.indexOf("sco")!=-1) || (agt.indexOf("unix_sv")!=-1);
	var is_unixware = (agt.indexOf("unix_system_v")!=-1);
	var is_mpras    = (agt.indexOf("ncr")!=-1);
	var is_reliant  = (agt.indexOf("reliantunix")!=-1);
	var is_dec   = ((agt.indexOf("dec")!=-1) || (agt.indexOf("osf1")!=-1) ||
	       (agt.indexOf("dec_alpha")!=-1) || (agt.indexOf("alphaserver")!=-1) ||
	       (agt.indexOf("ultrix")!=-1) || (agt.indexOf("alphastation")!=-1));
	var is_sinix = (agt.indexOf("sinix")!=-1);
	var is_freebsd = (agt.indexOf("freebsd")!=-1);
	var is_bsd = (agt.indexOf("bsd")!=-1);
	var is_unix  = ((agt.indexOf("x11")!=-1) || is_irix || is_sco ||
	is_unixware || is_mpras || is_reliant ||
	             is_dec || is_sinix || is_aix || is_bsd || is_freebsd);

	// Load stylesheet
	ChooseStyleSheet();

// Handle Navigator 4 window resizing
if (is_nav4up && !is_nav5up) {
   var initWidth, initHeight;
   initWidth = window.innerWidth;
   initHeight = window.innerHeight;
   window.captureEvents(Event.RESIZE);
   window.onresize = handleResize;
}

//  UTILITY FUNCTIONS
// Function to handle window resizing on Navigator 4
function handleResize() {
   if (((initWidth != window.innerWidth) || (initHeight != window.innerHeight)) && (typeof disableReload == "undefined")) {
     location.reload();
   }
   return false;
}

// Function to choose stylesheet for platform and browser version
	function ChooseStyleSheet() {
	  var fileHead = cssDir;
	  var styles;
	  if (is_win) {
		if (is_nav4) {
		  styles = fileHead + NS4CSS;
		} else if (is_ie6 || is_ie7) {
		  styles = fileHead + winIE6CSS;
		} else if (is_ie8 || is_ie8up) {
          styles = fileHead + winIE8CSS;
		} else if (is_nav5up) {
		  styles = fileHead + macCSS;
		} else if (is_opera) {
		  styles = fileHead + macCSS;
		} else {
		  styles = fileHead + winIECSS;
		}
	  } else if (is_mac) {
		    styles = fileHead + macCSS;
	  } else if (is_linux) {
		if (is_nav4) {
		    styles = fileHead + strdCSS;
		} else {
		    styles = fileHead + macCSS;
		}
	  } else if (is_hpux) {
		if (is_ie5) {
		    styles = fileHead + macCSS;
		} else if (is_nav5up) {
		    styles = fileHead + macCSS;
		} else {
		    styles = fileHead + strdCSS;
		}
	  } else if (is_sun) {
		if (is_nav4) {
		    styles = fileHead + NS4CSS;
		} else {
		    styles = fileHead + strdCSS;
		}
	  // Created by Tru 64 Team - added 09/04
	  } else if (is_dec) {
		if (is_nav4) {
		    styles = fileHead + NS4CSS;
		} else if (is_nav5up) {
		    styles = fileHead + macCSS;
		} else {
		    styles = fileHead + strdCSS;
		}
	  } else {
		styles = fileHead + strdCSS;
	  }
	  document.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"" + styles + "\">");
	  return true;
	}

	// Function to jump to a URL in a <select> menu. In this case, the name of the array containing the URLs is determined based on the name of the pulldown menu.
	function jumpToURL(formName,menuName) {
	 var obj = eval("document." + formName + "." + menuName);
	 var index = obj.selectedIndex;
	 var url = eval(menuName + "_URLs[" + index + "]");
	 if (url != "") {
	   location.href=url;
	 }
	}

    // Theme Color Generator
        var Theme = new Function("{ this.bgcolors = new Array; this.textColor = \"\"; }");

	if ((typeof template) == 'undefined') {
		var template = 'hpweb';
	}


		aThemes = new Array();

		// For use with white text
		aThemes[0] = new Theme();
		if (template == 'hpweb') {
			aThemes[0].bgcolors = ['#990000','#CC0066','#336666','#003366','#000000','#666666','#336633','#EB5F01','#0066FF','#4FAF00','#0A357E','#CC0033'];
		} else if (template == 'hppcv') {
			aThemes[0].bgcolors = ['#666666','#EB5F01','#FF0000','#660099','#02BA0C'];
		}
		aThemes[0].textColor = "#FFFFFF";


		// For use with black text
		aThemes[1] = new Theme();
		if (template == 'hpweb') {
			aThemes[1].bgcolors = ['#FFCC00'];
		} else if (template == 'hppcv') {
			aThemes[1].bgcolors = ['#FFCC00','#C0C0C0'];
		}
		aThemes[1].textColor = "#000000";


		//Secondary theme colors
		var secThemes = new Array(9);
		secThemes['#990000'] = '#CC9999';
		secThemes['#CC0066'] = '#FF99CC';
		secThemes['#336666'] = '#99CCCC';
		secThemes['#003366'] = '#6699CC';
		secThemes['#336633'] = '#99CC99';
		secThemes['#EB5F01'] = '#FFCC99';
		secThemes['#0066FF'] = '#99CCFF';
		secThemes['#4FAF00'] = '#CCCC66';
		secThemes['#FFCC00'] = '#FFFF99';


		function cssStr(type) {
			switch(type){
				case "start": return '<style type="text/css">\n';
				case "end": return '</style>';
				case "classes": return '.themeheader {color:'+ defaultColor +'; font-weight:bold;}\n\n' +
									'.themeheaderA {color:'+ defaultColor +'; font-weight:bold; font-size: 140%;}\n\n' +
									'.leveld {font-weight: bold; border-bottom: solid 2px '+ theme +'; margin: 0px 0px 0px 0px; padding:1px;}\n' +
									'.themebody {color:'+ defaultColor +';}\n\n' +
									'a.themeheaderlink {font-weight: bold; color:'+ defaultColor +'; text-decoration: none;}\n' +
									'a.themeheaderlink:active {font-weight: bold; color:'+ defaultColor +';}\n' +
									'a.themeheaderlink:link {font-weight: bold; color:'+ defaultColor +';}\n' +
									'a.themeheaderlink:visited {font-weight: bold; color:'+ defaultColor +';}\n' +
									'a.themeheaderlink:hover {text-decoration: underline;}\n\n' +
									'a.themelink {color:'+ defaultColor +'; text-decoration: none;}\n' +
									'a.themelink:active {color:'+ defaultColor +';}\n' +
									'a.themelink:link {color:'+ defaultColor +';}\n' +
									'a.themelink:visited {color:'+ defaultColor +';}\n' +
									'a.themelink:hover {text-decoration: underline;}\n\n' +
									'a.themebodylink {color:'+ defaultColor +'; text-decoration: underline;}\n' +
									'a.themebodylink:active {color:'+ defaultColor +';}\n' +
									'a.themebodylink:link {color:'+ defaultColor +';}\n' +
									'a.themebodylink:visited {color:'+ defaultColor +';}\n\n' +
									'.headerAlpha {color:'+ defaultColor +'; background-color: '+ theme +'; background-image: url('+ cssDomain +'/img/header_'+ enhancedThemeString +'.gif);}\n\n' +
									'.headerAlpha a, .headerAlpha a:active, .headerAlpha a:link, .headerAlpha a:visited {color:'+ defaultColor +';}\n' +
									'.headerDelta, .headerEpsilon, .calloutEnhanced {color:'+ enhancedHeaderColor +';}\n\n' +
									'.headerGamma {color:'+ enhancedHeaderColor +'; border-color: '+ secThemes[theme] +';}\n\n' +
									'.primButtonEnhanced {color:'+ defaultColor +'; background-color: '+ theme +'; background-image: url('+ cssDomain +'/img/button_'+ enhancedThemeString +'.gif);}\n\n' +
									'a.primButtonEnhanced:active, a.primButtonEnhanced:link, a.primButtonEnhanced:visited {color:'+ defaultColor +';}\n' +
									'a.primButtonEnhanced:hover, input.primButtonEnhanced:hover {background-image: url('+ cssDomain +'/img/button_'+ enhancedThemeString +'_over.gif);}\n\n' +
									'input.arrowButtonTheme {color:'+ defaultColor +'; background-image: url('+ cssDomain +'/img/arrow_'+ enhancedThemeString +'.gif);}\n\n' +
									'input.arrowButtonTheme:hover {background-image: url('+ cssDomain +'/img/arrow_'+ enhancedThemeString +'_over.gif);}\n\n' +
									'#stretchLogoWithPageTitle {color:'+ defaultColor +'; background-color: '+ theme +';}\n\n' +
									'#stretchLogoWithPageTitle #logo {background-image: url('+ cssDomain +'/country/img/slp_logo_'+ enhancedThemeString.toLowerCase() +'.gif);}\n\n' +
									'#tabbedNavEnhanced {border-color: '+ theme +';}\n\n' +
									'#tabbedNavEnhanced .tabSelected {color:'+ defaultColor +'; background-color: '+ theme +'; background-image: url('+ cssDomain +'/img/tab_'+ enhancedThemeString +'.gif);}\n\n' +
									'.themeRightBorder {border-right: 2px solid '+ theme +';}\n\n' +
									'.theme {background: '+ theme +'}\n';
				default: return '\n'
			}
		}

		function writeCSS() {
			var str = cssStr('start')+cssStr('classes')+cssStr('end');
			document.write(str);
		}

		var defaultColor = '#000000';
		var enhancedHeaderColor = '';
		var enhancedThemeString = '';


		if ((typeof theme) != 'undefined') {
			enhancedThemeString = theme.replace(/#/, "");

			if ( (template == 'hpweb') && (theme == '#FF0000') ) {
				theme = '#CC0033'; //Production pages currently use #FF0000 theme color. New Compaq color after re-branding is #CC0033. --Aziz 20070525.
			}

			for (var i=0; i<aThemes.length; i++){
				for (var j=0; j<aThemes[i].bgcolors.length; j++){
					if (aThemes[i].bgcolors[j]==theme){
						defaultColor = aThemes[i].textColor;

						if (defaultColor == '#000000') {
							enhancedHeaderColor = '#000000';
						} else {
							enhancedHeaderColor = theme;
						}

						break;
					}
				}
			}

			writeCSS();

		}
		
// Enhanced templates search box functions
if(typeof hpweb_1_2jSval != 'variable' || typeof hpweb_1_2jSval == 'undefined') var hpweb_1_2jSval = 'Search:';
function hpweb_1_2jClearSearch(el){ if(el.value==hpweb_1_2jSval) el.value=''; }
function hpweb_1_2jRestoreSearch(el){ if(el.value=='') el.value=hpweb_1_2jSval; }

/* =======[ BEGIN SEARCH FORM VALIDATION ]================== */
function validateSearch() {
	var searchForm = document.searchHP.textboxW.value;
	if(searchForm == hpweb_1_2jSval || searchForm == hpweb_1_2jSval.replace(':','')) document.searchHP.textboxW.value = '';
	return true;
}
/* =======[ END SEARCH FORM VALIDATION ]================== */

// 20090612