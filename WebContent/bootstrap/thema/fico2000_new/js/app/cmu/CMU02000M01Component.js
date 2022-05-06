var CMU02000M01 = new CMU02000M01Component();

var boardCode = 'FAS900206'; //자유게시판

var uploadObj = {};

var boardService = new BoardMngService(true);

function CMU02000M01Component() {

};

CMU02000M01Component.prototype.ngOnInit = function () {
    $('#rec-content').summernote({
        height:250,
        lang: 'ko-KR' // default: 'en-US'
    });
};

CMU02000M01Component.prototype.onSave = function () {

    $(".alert.alert-danger").hide(true);

    if ($("#title").val() == null || $("#title").val() == '' || $("#title").val() == undefined) {
        $(".alert.alert-danger").show();
        $("#errRegMsg").html("제목을 입력하세요");
        return;
    }

    overlay.show();

    var content = $('#rec-content').summernote('code');

    $("#code").val(boardCode);

    var selectedBoard = {
         code:boardCode
        ,mainNo:0
        ,title:$("#title").val()
        ,content:content
        ,count:0
        ,delYn:'N'
    };

    var res = boardService.saveBoard(selectedBoard, CMU02000M01.callback);

};

CMU02000M01Component.prototype.onGoList = function () {
    toMove('CMU02000M00');
};

CMU02000M01Component.prototype.onInit = function () {

    $("#ngForm").each(function() {  
        this.reset();  
    });

    $('#rec-content').summernote('code', '');

}

CMU02000M01Component.prototype.callback = function(data) {

    console.log('request >>' , data);

    if (data != null) {
        console.log("board ajax >>> " , data);
        var res = JSON.parse(data);

        if (res.success==true) { 
            overlay.hide();
            console.log('성공');
            console.log(res);
            bootbox.alert(res.msg,function(){
                CMU02000M01.onInit();
                CMU02000M01.onGoList();
            });
        } else {
            overlay.hide();
        }

    }
};



$(document).ready(function() {

    $(".alert.alert-danger").hide(true);

    $("link[href*='/bootstrap/thema/fico2000/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css']").remove();
    $("link[href*='/bootstrap/thema/fico2000/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css']").remove();
    $("link[href*='/bootstrap/thema/fico2000/assets/css/admin/custom-admin.css']").remove();
    $("link[href*='/bootstrap/thema/fico2000/js/app/adm/ADM01000M00Component.css']").remove();
    
    $('head').append( $('<link rel="stylesheet" type="text/css" />').attr('href', '/bootstrap/thema/fico2000/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css') );
    $('head').append( $('<link rel="stylesheet" type="text/css" />').attr('href', '/bootstrap/thema/fico2000/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css') );
    $('head').append( $('<link rel="stylesheet" type="text/css" />').attr('href', '/bootstrap/thema/fico2000/assets/css/admin/custom-admin.css') );
    $('head').append( $('<link rel="stylesheet" type="text/css" />').attr('href', '/bootstrap/thema/fico2000/js/app/adm/ADM01000M00Component.css') );

    CMU02000M01.ngOnInit();

    $("#onGoList").click(function(){
        CMU02000M01.onGoList();
    });

    $("#onSave").click(function(){
        bootbox.confirm("저장하시겠습니까 ?", function(result){
            if (result) {
                console.log(result);
                CMU02000M01.onSave();
            } 
        });
    }); 

    $("#onInit").click(function(){
        CMU02000M01.onInit();
    });

});
