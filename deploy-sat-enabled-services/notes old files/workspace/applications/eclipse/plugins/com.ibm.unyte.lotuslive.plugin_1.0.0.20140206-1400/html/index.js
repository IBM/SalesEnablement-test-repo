/* Copyright IBM Corp. 2014  All Rights Reserved.                    */
function init(){
	try{textDirection();}catch(e){}
	try{resizeBackgroundImages();}catch(e){}
	try{toggleJoin();}catch(e){}
}

function textDirection(){
	if(document.getElementsByTagName("html")[0].dir == "rtl"){
		if(document.createStyleSheet) {
			document.createStyleSheet("style_rtl.css");
		} else {
			var link = document.createElement("link");
			link.rel = "stylesheet";
			link.type = "text/css";
			link.href = escape("style_rtl.css");
			document.getElementsByTagName("head")[0].appendChild(link);
		}
	}
}

/**
 * Necessary to make this work in IE
 */
function resizeBackgroundImages(){
	for (var i = 0, img = null, len = document.images.length; i < len; ++i) {
		img = document.images[i];
		switch (img.className) {
			case "fadingblue":
			case "fadinggray":
				img.style.height = img.parentNode.clientHeight + "px";
				img.style.width = img.parentNode.clientWidth + "px";
				img.style.display = "";
				break;
		}
	}
}

function toggleJoin(){
	
if ((isJoinEnabled == 0 || !isDirty)) {
		document.getElementById("join_button").setAttribute("aria-disabled", "true");
		document.getElementById("join_button").className = "button-bg-disabled";
		document.forms['join_form']['join'].disabled = true;
		document.forms['join_form']['join'].className = "disabled";
		document.forms['join_form']['join_conference_id'].className = "text-disabled";
	}
	else {
		document.getElementById("join_button").setAttribute("aria-disabled", "false");
		document.getElementById("join_button").className = "button-bg";
		document.forms['join_form']['join'].disabled = false;
		document.forms['join_form']['join'].className = "";
		document.forms['join_form']['join_conference_id'].className = "text";
	}
}

function hostMeeting(){
	
if (isHostEnabled == 1) {
		var meeting_type = document.forms['host_form']['meeting_type'];

		window.location = "index.html?action=host" +	
		((meeting_type) ? function(){
			for (var i = 0, len = meeting_type.length; i < len; ++i) {
				if (meeting_type[i].checked) {
					return "&internal=" + meeting_type[i].value;
				}
			}
			return "";
		}() : "");
	} else {
		alert(hostNotEnabled);
	}
}

function joinMeeting(){
	
if (isDirty) {
		
if (isJoinEnabled == 1) {
			window.location = "index.html?action=join&confid=" + encodeURIComponent(document.forms['join_form']['join_conference_id'].value);
		}
		else {
			alert(joinNotEnabled);
		}
	}
}

function setPreferences(){
	window.location = "index.html?action=set_preferences";
}

function createAccount(){
	window.location = "index.html?action=create_account";
}

function inputFieldOnFocus(){
	
if (!isDirty) {
		document.forms['join_form']['join_conference_id'].value = "";
	}
}

function inputFieldOnBlur(){
	
if (document.forms['join_form']['join_conference_id'].value.replace(/^\s+|\s+$/, '').length == 0) {
		document.forms['join_form']['join_conference_id'].value = enterConfID;
		isDirty = false;
	}
	else {
		isDirty = true;
	}
	toggleJoin();
}

function inputOnKeyUp(){
	isDirty = !(document.forms['join_form']['join_conference_id'].value.replace(/^\s+|\s+$/, '').length == 0);
	toggleJoin();
}
