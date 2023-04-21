var	writererror		= "작성자를 입력하세요";
var	subjecterror	= "제목을 입력하세요";
var	contenterror	= "내용을 입력하세요";
var	passwderror		= "비밀번호를 입력하세요";

var	inserterror		= "글작성에 실패했습니다\n잠시 후 다시 시도하세요";
var	modifyerror		= "글수정에 실패했습니다\n잠시 후 다시 시도하세요";
var	deleteerror		= "글삭제에 실패했습니다\n잠시 후 다시 시도하세요";
var	replyexisterror	= "댓글이 있는 글은 삭제할 수 없습니다";
var	passerror		= "입력하신 비밀번호가 다릅니다\n다시 확인하세요";

function erroralert(msg) {
	alert(msg);
	history.back();
}

// 글수정
function modifycheck() {
	if(!modifyform.subject.value) {
		alert(subjecterror);
		modifyform.passwd.focus();
		return false;
	} else if(!modifyform.content.value) {
		alert(contenterror);
		modifyform.content.focus();
		return false;
	} else if(!modifyform.passwd.value) {
		alert(passwderror);
		modifyform.passwd.focus();
		return false;
	}
}


// 글삭제
function passwdcheck() {
	if(!deleteform.passwd.value) {
		alert(passwderror);
		deleteform.passwd.focus();
		return false;
	}	
}

// 글쓰기
function writecheck() {
	if(!writeform.writer.value) {
		alert(writererror);
		writeform.writer.focus();
		return false;
	} else if(!writeform.subject.value) {
		alert(subjecterror);
		writeform.subject.focus();
		return false;
	} else if(!writeform.content.value) {
		alert(contenterror);
		writeform.content.focus();
		return false;
	} else if(!writeform.passwd.value) {
		alert(passwderror);
		writeform.passwd.focus();
		return false;
	}
}
