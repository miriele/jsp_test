var iderror				= "아이디를 입력하세요";
var nickerror			= "닉네임을 입력하세요";
var passwderror			= "비밀번호를 입력하세요";
var repasswderror		= "비밀번호가 다릅니다"
var nameerror			= "이름을 입력하세요";
var	telerror			= "전화번호를 입력하세요";
var	emailerror			= "이메일을 정확히 입력하세요";
var confirmiderror		= "아이디 중복확인을 해주세요";
var confirmnickerror	= "닉네임 중복확인을 해주세요";

var	inupterror			= "회원가입에 실패했습니다.\n잠시 후 다시 시도하세요";
var	idxerror			= "입력하신 아이디가 없습니다.\n다시 확인하세요";
var passerror			= "입력하신 비밀번호가 다릅니다.\n다시 확인하세요";
var deleteerror			= "회원탈퇴에 실패했습니다.\n잠시 후 다시 시도하세요";
var modifyerror			= "회원정보수정에 실패했습니다.\n잠시 후 다시 시도하세요";

// 공통
function erroralert(msg) {
	alert(msg);
	history.back();
}


// 회원정보 수정
function modifycheck() {
	if(modifyform.checknick.value == 0) {
		alert(confirmnickerror);
		modifyform.nick.focus();
		return false;
	}
	
	if(!modifyform.nick.value) {
		alert(nickerror);
		modifyform.nick.focus();
		return false;
	}
	
	if(!modifyform.passwd.value) {
		alert(passwderror);
		modifyform.passwd.focus();
		return false;
	} else if(modifyform.passwd.value != modifyform.repasswd.value) {
		alert(repasswderror);
		modifyform.passwd.focus();
		return false;
	}
}


// 회원탈퇴 
function passwdcheck() {
	if(!passwdform.passwd.value) {
		alert(passwderror);
		passwdform.passwd.focus();
		return false;
	}
}


// 닉네임 중복확인
function confirmnick(formName) {
	var form	= document.forms[formName];

	if(!form.nick.value) {
		alert(nickerror);
		inputform.nick.focus();
	} else {
		url = "confirmnick.do?form=" + formName + "&nick=" + form.nick.value;
		open(url, "confirmNick", "scrollbar=no, statusbar=no, titlebar=no, menubar=no,"+
							 " width=400px, height=250px");
	}
}

function confirmnickcheck() {
	if(!confirmformnick.nick.value) {
		alert(nickerror);
		confirmformnick.nick.focus();
		return false;
	}
}

function setnick(formName, nick) {
	var form	= opener.document.forms[formName];

//	opener.document.form.nick.value			= nick;
//	opener.document.form.checknick.value	= 1;
	form.nick.value			= nick;
	form.checknick.value	= 1;
	window.close();
}


// 아이디 중복확인
function confirmid() {
	if(!inputform.id.value) {
		alert(iderror);
		inputform.id.focus();
	} else {
		url = "confirmid.do?id=" + inputform.id.value;
		open(url, "confirmId", "scrollbar=no, statusbar=no, titlebar=no, menubar=no,"+
							 " width=400px, height=250px");
	}
}

function confirmidcheck() {
	if(!confirmform.id.value) {
		alert(iderror);
		confirmform.id.focus();
		return false;
	}
}

function setid(id) {
	opener.document.inputform.id.value		= id;
	opener.document.inputform.checkid.value	= 1;
	window.close();
}


// 가입페이지
function inputcheck() {
	if(inputform.checkid.value == 0) {
		alert(confirmiderror);
		inputform.id.focus();
		return false;
	}
	
	if(inputform.checknick.value == 0) {
		alert(confirmnickerror);
		inputform.nick.focus();
		return false;
	}

	if(!inputform.id.value) {
		alert(iderror);
		inputform.id.focus();
		return false;
	}
	
	if(!inputform.nick.value) {
		alert(nickerror);
		inputform.nick.focus();
		return false;
	}
	
	if(!inputform.passwd.value) {
		alert(passwderror);
		inputform.passwd.focus();
		return false;
	} else if(inputform.passwd.value != inputform.repasswd.value) {
		alert(repasswderror);
		inputform.passwd.value="";
		inputform.repasswd.value="";
		inputform.passwd.focus();
		return false;
	}
	
	if(!inputform.name.value) {
		alert(nameerror);
		inputform.passwd.focus();
		return false;
	}
	
	if(inputform.tel1.value || inputform.tel2.value || inputform.tel3.value) {
		if(  inputform.tel1.value.length < 3
		  || inputform.tel2.value.length < 3
		  || inputform.tel3.value.length < 4) {
			alert(telerror);
			inputform.tel1.focus();
			return false;
		}
	}
	
	// 이메일 직접 입력일 경우 @가 없으면 경고
	// 선택입력일 경우 @가 있으면 경고
	if(inputform.email1.value) {
		if(inputform.email2.value == 0) {
			if(inputform.email1.value.indexOf("@") == -1) {
				alert(emailerror);
				inputform.email1.focus();
				return false;
			} 
		} else {
			if(inputform.email1.value.indexOf("@") != -1) {
				alert(emailerror);
				inputform.email1.focus();
				return false;
			}
		}
	}
}

function nexttel2() {
	if(inputform.tel1.value.length == 3) {
		inputform.tel2.focus();
	}
}

function nexttel3() {
	if(inputform.tel2.value.length == 4) {
		inputform.tel3.focus();
	}
}

function nextemail1() {
	if(inputform.tel3.value.length == 4) {
		inputform.email1.focus();
	}
}


// 메인페이지
function maincheck() {
	if(!mainform.id.value) {
		alert(iderror);
		mainform.id.focus();
		return false;
	} else if(!mainform.passwd.value) {
		alert(passwderror);
		mainform.passwd.focus();
		return false;
	}
}

