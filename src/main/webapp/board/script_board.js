var	subjecterror	= "제목을 입력하세요";
var	contenterror	= "내용을 입력하세요";

var	writeerror		= "글작성에 실패했습니다\n잠시 후 다시 시도하세요";
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
		modifyform.subject.focus();
		return false;
	} else if(!modifyform.content.value) {
		alert(contenterror);
		modifyform.content.focus();
		return false;
	}
}


// 글쓰기
function writecheck() {
	if(!writeform.subject.value) {
		alert(subjecterror);
		writeform.subject.focus();
		return false;
	} else if(!writeform.content.value) {
		alert(contenterror);
		writeform.content.focus();
		return false;
	}
}
