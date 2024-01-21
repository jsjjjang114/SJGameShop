var idck = "X";
var pwck = "X";
var repwch = "X";
var nameck = "X";
var emailck = "X";
var use = "x";

function writeSave(){
	if(idck=="X"){
		alert("아이디를 확인해주세요.");
		$('[name="id"]').focus();
		return false;
	}
	if(pwck=="X"){
		alert("비밀번호를 확인해주세요.");
		$('[name="password"]').focus();
		return false;
	}
	if(repwch=="X"){
		alert("비밀번호가 일치하지 않습니다.");
		$('[name="passwordCheck"]').focus();
		return false;
	}
	if(nameck=="X"){
		alert("이름을 확인해주세요.");
		$('[name="name"]').focus();
		return false;
	}
	if(emailck=="X"){
		alert("이메일을 확인해주세요.");
		$('[name="email"]').focus();
		return false;
	}
	if($('[name="birth"]').val()==""){
		alert('생년월일을 선택해주세요.');
		return false;
	}
	if($("input[name='mgroup']:checked").length < 1){
		alert('구분을 선택해주세요.');
		return false;
	}
	if($('[name="developer"]').val()==""){
		alert('기업명을 입력해주세요');
		return false;
	}
	
	$.ajax({
				url : "id_check_proc.jsp",
				async: false,
				data : ({
					id : $("[name='id']").val()
				}),
				success : function(data){
					if($.trim(data)=="o"){ 
						use = $.trim(data);
					} else if($.trim(data)=="x"){
						use = $.trim(data);
					}
				}
			});
	if(use=="x"){
		alert('중복된 아이디입니다.');
		$('[name="id"]').select().focus();
		return false;
	}
}
function writeSave2(){
	if(pwck=="X"){
		alert("비밀번호를 확인해주세요.");
		$('[name="password"]').focus();
		return false;
	}
	if(repwch=="X"){
		alert("비밀번호가 일치하지 않습니다.");
		$('[name="passwordCheck"]').focus();
		return false;
	}
	if(emailck=="X"){
		alert("이메일을 확인해주세요.");
		$('[name="email"]').focus();
		return false;
	}
	if($("input[name='mgroup']:checked").length < 1){
		alert('구분을 선택해주세요.');
		return false;
	}
	if($('[name="developer"]').val()==""){
		alert('기업명을 입력해주세요');
		return false;
	}
} //2

function writeSave3(){
	if($('[name="gtitle"]').val()==""){
		alert('게임명을 입력해주세요.');
		$('[name="gtitle"]').focus();
		return false;
	}
	
	
	
	var imgFile = $('#isFile').val();
	var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
	if($('#isFile').val() == "") {
		alert("게임이미지를 선택해주세요.");
   		$("#isFile").focus();
   		return false;
	}
	if(imgFile != "" && imgFile != null) {
    	if(!imgFile.match(fileForm)) {
    		alert("이미지 파일만 업로드 가능합니다.");
       		return false;
   		} 
   	}
   	
   	if($('[name="gprice"]').val()==""){
		alert('가격을 입력해주세요.');
		$('[name="gprice"]').focus();
		return false;
	}
	var regexp = /^[0-9]+$/;
	if($('[name="gprice"]').val().search(regexp)==-1){
		alert('가격은 숫자로만 입력해주세요.');
		$('[name="gprice"]').focus();
		return false;
	}
   	
   	if($('[name="ggenre"]').val()==""){
		alert('장르를 선택해주세요.');
		return false;
	}
	
	if($('[name="grel_date"]').val()==""){
		alert('발매일을 선택해주세요.');
		return false;
	}
	
	if($("input[name='platform']:checked").length < 1){
		alert('플레이 가능한 플랫폼을 선택해주세요.');
		return false;
	}
	
	
}


function idcheck(){
	idvalue = $('input[name="id"]').val();
	
	var regexp = /^(?=.*[a-zA-Z])[a-zA-Z0-9]{5,16}$/;
	
	if(idvalue.search(regexp)==-1){
		$("#idMsg").html("아이디는 최소 5글자 이상 영문 또는 숫자로 입력하세요.");
		$("#idMsg").show();
		idck = "X";
	} else{
		$("#idMsg").hide();
		idck = "O";
	}
	
	if(idvalue==""){
		$("#idMsg").html("아이디를 입력하세요.");
		idck = "X";
	}
} //id 검사

function pwcheck(){
	pwvalue = $('input[name="password"]').val();
	var regex = /^(?=.*[a-zA-Z])(?=.*\d).{8,15}$/;
	if(pwvalue.search(regex)==-1){
		$("#pwMsg").html("비밀번호는 영문+숫자를 혼합하여 8글자 이상 입력하세요.");
		$("#pwMsg").show();
		pwck="X";
	} else{
		$("#pwMsg").hide();
		pwck="O";
	}
		repassword_keyup();
	if(pwvalue==""){
		$("#pwMsg").html("비밀번호를 입력하세요.");
		pwck="X";
	}
}

function repassword_keyup(){
	if($('[name="password"]').val()==$('[name="passwordCheck"]').val()){
		$("#pwCkMsg").hide();
		repwch="O";
	} else {
		$("#pwCkMsg").html("비밀번호가 옳바르지 않습니다");
		$("#pwCkMsg").show();
		repwch="X";
	}
}

function namecheck(){
	var reg = /^[ㄱ-ㅎㅏ-ㅣ가-힣]+$/
	
	if($('[name="name"]').val().search(reg)==-1){
		$("#nameMsg").html("이름은 한글로만 입력하세요.");
		$("#nameMsg").show();
		nameck="X";
	} else {
		$("#nameMsg").hide();
		nameck="O";
	}
	
	if($('[name="name"]').val()==""){
		$("#nameMsg").html("이름을 입력하세요.");
		$("#nameMsg").show();
		nameck="X";
	}
}
function emailcheck(){
	var reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
	
	if($('[name="email"]').val().search(reg)==-1){
		$("#emailMsg").html("이메일형식에 맞지 않습니다.");
		$("#emailMsg").show();
		emailck = "X";
	} else {
		$("#emailMsg").hide();
		emailck = "O";
	}
	
	if($('[name="email"]').val()==""){
		$("#emailMsg").html("이메일을 입력하세요.");
		$("#emailMsg").show();
		emailck = "X";
	}
}

function groupcheck(){ 
	gvalue = $('[name="mgroup"]:checked').val();
	if(gvalue==0){
		$('[name="developer"]').attr('readonly','readonly');		
		$('[name="developer"]').attr('value','개인');		
		$('#developMsg').hide();
	} else{
		$('[name="developer"]').removeAttr('readonly');		
		$('[name="developer"]').removeAttr('value');		
	}
}
function devcheck(){
	if($('[name="developer"]').val()!=""){
		$('#developMsg').hide();
	}
}



function logincheck(){
	if($('[name="id"]').val()==""){
		alert("아이디를 입력해주세요.");
		$('[name="id"]').focus();
		return false;
	}
	if($('[name="password"]').val()==""){
		alert("비밀번호를 입력해주세요.");
		$('[name="password"]').focus();
		return false;
	}
	
}

function findpasswordcheck(){
	if($('[name="id"]').val()==""){
		alert("아이디를 입력해주세요.");
		$('[name="id"]').focus();
		return false;
	}
	if($('[name="name"]').val()==""){
		alert("이름을 입력해주세요.");
		$('[name="name"]').focus();
		return false;
	}
	if($('[name="email"]').val()==""){
		alert("이메일을 입력해주세요.");
		$('[name="email"]').focus();
		return false;
	}
}

function findidcheck(){
	if($('[name="name"]').val()==""){
		alert("이름을 입력해주세요.");
		$('[name="name"]').focus();
		return false;
	}
	if($('[name="email"]').val()==""){
		alert("이메일을 입력해주세요.");
		$('[name="email"]').focus();
		return false;
	}
}