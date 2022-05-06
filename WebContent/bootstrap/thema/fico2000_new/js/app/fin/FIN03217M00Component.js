var FIN03217M00 = new FIN03217M00Component();

var QsrtInfo = (function () {
    function QsrtInfo() {
        this.qsrtNo0 = [];
        this.qsrtNo1 = [];
        this.qsrtNo2 = [];
        this.qsrtNo3 = [];
        this.qsrtNo4 = [];
        this.qsrtNo5 = [];
        this.qsrtNo6 = [];
        this.qsrtNo7 = [];
        this.qsrtNo8 = [];
        this.qsrtNo9 = [];
        this.qsrtNo10 = [];
        this.qsrtNo11 = [];
        this.qsrtNo12 = [];
        this.qsrtNo13 = [];
    }
    return QsrtInfo;
}());

var QsrtRsltInfo = (function () {
    function QsrtRsltInfo() {
	
		this.alyid = ''	;		
		this.stacYy = '';
		this.qstrId = '';
		this.lsqsTcd = '';
		this.itemId = '';
		this.rsltId = '';
		this.lprbmNo = 0;
		this.sprbmNo = 0;
		this.rsvlType = '';
		this.rplyType = '';
		this.itemNm = '';
		this.baseYm = '';
		this.kindNm = '';
		this.rsltVl = '';
		this.delYn = '';
		this.trmDsncNm = '';
		this.etcNm = '';
		this.etcIrt = '';
	
    }
    return QsrtRsltInfo;
}());

var QsrtNo121 = (function () {
    function QsrtNo121() {
        this.kindNm = "";
        this.baseYm = "";
        this.rsltVl = 0;
        this.etcNm = "";
        this.etcIrt = 0;
        this.alyid = "";
        this.itemId = "";
        this.lprbmNo = 0;
        this.sprbmNo = 0;
        this.lsqsTcd = "";
        this.qstrId = "";
        this.delYn = "";
        this.rsltId = "";
        this.idx = 0;
    }
    return QsrtNo121;
}());
var QsrtNo131 = (function () {
    function QsrtNo131() {
        this.kindNm = "";
        this.baseYm = "";
        this.rsltVl = 0;
        this.etcNm = "";
        this.etcIrt = 0;
        this.alyid = "";
        this.itemId = "";
        this.lprbmNo = 0;
        this.sprbmNo = 0;
        this.lsqsTcd = "";
        this.qstrId = "";
        this.delYn = "";
        this.rsltId = "";
        this.idx = 0;
    }
    return QsrtNo131;
}());

var errMsg = ""
var errRegMsg = ""

var entpName = ""
var stacYy = ""
var gb = ""
var bzn = ""    

//설문지
var qsrtInfoArr = []
var qsrtNoArr = [];
var qsrtNo= new QsrtRsltInfo();

var arrlength = 0
var qsrtInfo = new QsrtInfo()

var qsrtNo121 = new QsrtNo121()
var qsrtNo131 = new QsrtNo131()

var qsrtNo121Arr = []
var qsrtNo131Arr = []

var qsrtNo01 = ''
var qsrtNo11 = 0
var qsrtNo12 = 0
var qsrtNo13 = 0

var qsrtNo21 = 0
var qsrtNo22 = 0

var qsrtNo31 = 0

var qsrtNo41 = []

var qsrtNo51 = 0
var qsrtNo61 = 0
var qsrtNo71 = 0
var qsrtNo81 = 0

var qsrtNo91 = 0
var qsrtNo92 = 0
var qsrtNo93 = 0

var qsrtNo101 = []

var beforeYear = "";
var afterYear  = "";

//1.영업활동패턴
var businessLength = 0;
var businessWorkPatterns = [];

//2.매출액예측
var salesPredictLength = 0;
var salesPredictList = [];
var salesCostBefore = [];
var salesCostAfter = [];
var salesCost = [];
var salesCostTotalAmt = 0;
var salesCostAfterTotalAmt = 0;
var salesCostBeforeTotalAmt = 0;

//3.현금수입
var cashIncomeLength = 0;
var cashIncomeList = [];
var cashIncome0MonthList = [];
var cashIncome1MonthList = [];
var cashIncome2MonthList = [];
var cashIncomeTotalList = [];


//4.매출채권
var salesCreditPredictLength = 0;
var salesAmtList = [];
var revAmtList = []; 
var revAmt1MonthList = [];
var salesCreditAmt = [];

//5.현금지출
var cashOutComeLength = 0;
var cashOutComeList = [];

//6.순현금흐름
var cashNtFlowLength = 0;
var cashNtFlowList = [];

//7.현금예산
var cashBdgtAmtLength = 0;
var cashBdgtAmtList = [];       

//8.결과
var cashFlowResultInfo;    
var cashFlowResultLength = 0;

//bar charts
var barchart;
var linechart;
var linechart1;

function FIN03217M00Component() {

};

FIN03217M00Component.prototype.ngOnInit = function () {
    
    console.log('finAplyCom >> ', finAplyCom);

    if (finAplyCom == null || finAplyCom == undefined) {

        $("#alyIfr").attr("src","/fin/pageMove.do?menuCode=FIN02001P00&params=");

        $("#popup").bPopup({
            modalClose : true
        });
    } else {
        if (finAplyCom.alyid == null || finAplyCom.alyid == undefined || finAplyCom.alyid == '') {

            $("#alyIfr").attr("src","/fin/pageMove.do?menuCode=FIN02001P00&params=");

            $("#popup").bPopup({
                modalClose : true
            });
        } else {

            $("span[name='entpName']").each(function (idx) {
                $("span[name='entpName']").eq(idx).html(finAplyCom.entpName);
            });

            $("span[name='alycon']").each(function (idx) {
                $("span[name='alycon']").eq(idx).html(finAplyCom.alycon);
            });

            FIN03217M00.onSearch();
            
        }
    }

};

FIN03217M00Component.prototype.onSearch = function () {
    FIN03217M00.initQsrtSave();
};

FIN03217M00Component.prototype.onBusinessWorkPattern = function() {

    console.log("<<<<<< onBusinessWorkPattern() start >>>>> ");
    overlay.show();
    finService.getBusinessWorkPattern(finAplyCom.alyid, finAplyCom.stacYy, qsrtInfo, FIN03217M00.BusinessWorkPatternCallback);

};

FIN03217M00Component.prototype.BusinessWorkPatternCallback = function(data) {

    if (data != null) {

         var res = JSON.parse(data);

        if (res.success) {
            overlay.hide();
            var result = res.data.result;
            businessWorkPatterns = result;

            console.log("businessWorkPatterns >>> ", businessWorkPatterns);

            if (businessWorkPatterns != null && businessWorkPatterns != undefined) {
                businessLength = 1;
            }

            FIN03217M00.onSalesCreditPredict();

        } else {
            bootbox.alert(res.msg);
            overlay.hide();
        }

    } else {
        overlay.hide();
    }

};


FIN03217M00Component.prototype.onSalesCreditPredict = function() {
    overlay.show();
    console.log("<<<<<< onSalesCreditPredict() start >>>>> ")
    finService.getSalesCreditPredict(finAplyCom.alyid, finAplyCom.stacYy, qsrtInfo, FIN03217M00.setSalesCreditPredict);

};

FIN03217M00Component.prototype.setSalesCreditPredict = function(result) {

    if (result != null) {

         var res = JSON.parse(result);

        if (res.success) {
            overlay.hide();
            var data = res.data.result;

            salesAmtList = data;

            if (salesAmtList != null && salesAmtList != undefined) {
                salesCreditPredictLength = 1;
            }

            salesAmtList = data['salesAmt'];
            revAmtList = data['revAmt'];
            revAmt1MonthList = data['revAmt1Month'];
            salesCreditAmt = data['salesCreditAmt'];

            if ( salesCreditPredictLength > 0 && businessLength > 0 ) {
                FIN03217M00.SalesCreditPredictView();
            }
            

        } else {
            bootbox.alert(res.msg);
            overlay.hide();
        }

    } else {
        overlay.hide();
    }    

};

FIN03217M00Component.prototype.SalesCreditPredictView = function() {

    var salesAmtListTable = '';

    salesAmtListTable += '<div class="panel-body">																		';
    salesAmtListTable += '    <!--매출채권예측테이블-->                                                                         ';
    salesAmtListTable += '    <table class="table table-condensed">                                                     ';
    salesAmtListTable += '        <thead>                                                                               ';
    salesAmtListTable += '            <tr class="active text-lg">                                                       ';
    salesAmtListTable += '                <th>월</th>                                                                    ';
    salesAmtListTable += '                <th></th>                                                                     ';
    salesAmtListTable += '                <th>'+salesAmtList[0].month+'</th>                                            ';
    salesAmtListTable += '                <th>'+salesAmtList[1].month+'</th>                                            ';
    salesAmtListTable += '                <th>'+salesAmtList[2].month+'</th>                                            ';
    salesAmtListTable += '                <th>'+salesAmtList[3].month+'</th>                                            ';
    salesAmtListTable += '                <th>'+salesAmtList[4].month+'</th>                                            ';
    salesAmtListTable += '                <th>'+salesAmtList[5].month+'</th>                                            ';
    salesAmtListTable += '            </tr>                                                                             ';
    salesAmtListTable += '        </thead>                                                                              ';
    salesAmtListTable += '        <tbody>                                                                               ';
    salesAmtListTable += '            <tr>                                                                              ';
    salesAmtListTable += '                <td>매출액</td>                                                                  ';
    salesAmtListTable += '                <td></td>                                                                     ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesAmtList[0].amt)+'</th>                          ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesAmtList[1].amt)+'</th>                          ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesAmtList[2].amt)+'</th>                          ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesAmtList[3].amt)+'</th>                          ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesAmtList[4].amt)+'</th>                          ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesAmtList[5].amt)+'</th>                          ';
    salesAmtListTable += '            </tr>                                                                             ';
    salesAmtListTable += '            <tr>                                                                              ';
    salesAmtListTable += '                <td>당월 매출액 중 미수금</td>                                                        ';
    salesAmtListTable += '                <td>'+(businessWorkPatterns['rsv01'])['up']+'%</td>                           ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmtList[0].amt)+'</th>                            ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmtList[1].amt)+'</th>                            ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmtList[2].amt)+'</th>                            ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmtList[3].amt)+'</th>                            ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmtList[4].amt)+'</th>                            ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmtList[5].amt)+'</th>                            ';
    salesAmtListTable += '            </tr>                                                                             ';
    salesAmtListTable += '            <tr>                                                                              ';
    salesAmtListTable += '                <td>1개월 전 매출액 중 미수금</td>                                                     ';
    salesAmtListTable += '                <td>'+(businessWorkPatterns['rsv02'])['up']+'%</td>                           ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmt1MonthList[0].amt)+'</th>                      ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmt1MonthList[1].amt)+'</th>                      ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmt1MonthList[2].amt)+'</th>                      ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmt1MonthList[3].amt)+'</th>                      ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmt1MonthList[4].amt)+'</th>                      ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmt1MonthList[5].amt)+'</th>                      ';
    salesAmtListTable += '            </tr>                                                                             ';
    salesAmtListTable += '            <tr>                                                                              ';
    salesAmtListTable += '                <td>매출채권</td>                                                                 ';
    salesAmtListTable += '                <td></td>                                                                     ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesCreditAmt[0].amt)+'</th>                        ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesCreditAmt[1].amt)+'</th>                        ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesCreditAmt[2].amt)+'</th>                        ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesCreditAmt[3].amt)+'</th>                        ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesCreditAmt[4].amt)+'</th>                        ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesCreditAmt[5].amt)+'</th>                        ';
    salesAmtListTable += '            </tr>                                                                             ';
    salesAmtListTable += '        </tbody>                                                                              ';
    salesAmtListTable += '    </table>                                                                                  ';
    salesAmtListTable += '    <!--//매출채권예측테이블-->                                                                       ';
    salesAmtListTable += '    <br/>                                                                                     ';
    salesAmtListTable += '                                                                                              ';
    salesAmtListTable += '    <!--매출채권예측테이블-->                                                                         ';
    salesAmtListTable += '    <table class="table table-condensed">                                                     ';
    salesAmtListTable += '        <thead>                                                                               ';
    salesAmtListTable += '            <tr class="active text-lg">                                                       ';
    salesAmtListTable += '                <th>월</th>                                                                    ';
    salesAmtListTable += '                <th></th>                                                                     ';
    salesAmtListTable += '                <th>'+salesAmtList[6].month+'</th>                                            ';
    salesAmtListTable += '                <th>'+salesAmtList[7].month+'</th>                                            ';
    salesAmtListTable += '                <th>'+salesAmtList[8].month+'</th>                                            ';
    salesAmtListTable += '                <th>'+salesAmtList[9].month+'</th>                                            ';
    salesAmtListTable += '                <th>'+salesAmtList[10].month+'</th>                                           ';
    salesAmtListTable += '                <th>'+salesAmtList[11].month+'</th>                                           ';
    salesAmtListTable += '            </tr>                                                                             ';
    salesAmtListTable += '        </thead>                                                                              ';
    salesAmtListTable += '        <tbody>                                                                               ';
    salesAmtListTable += '            <tr>                                                                              ';
    salesAmtListTable += '                <td>매출액</td>                                                                  ';
    salesAmtListTable += '                <td></td>                                                                     ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesAmtList[6].amt)+'</th>                          ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesAmtList[7].amt)+'</th>                          ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesAmtList[8].amt)+'</th>                          ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesAmtList[9].amt)+'</th>                          ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesAmtList[10].amt)+'</th>                         ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesAmtList[11].amt)+'</th>                         ';
    salesAmtListTable += '            </tr>                                                                             ';
    salesAmtListTable += '            <tr>                                                                              ';
    salesAmtListTable += '                <td>당월 매출액 중 미수금</td>                                                        ';
    salesAmtListTable += '                <td>'+(businessWorkPatterns['rsv01'])['up']+'%</td>                           ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmtList[6].amt)+'</th>                            ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmtList[7].amt)+'</th>                            ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmtList[8].amt)+'</th>                            ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmtList[9].amt)+'</th>                            ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmtList[10].amt)+'</th>                           ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmtList[11].amt)+'</th>                           ';
    salesAmtListTable += '            </tr>                                                                             ';
    salesAmtListTable += '            <tr>                                                                              ';
    salesAmtListTable += '                <td>1개월 전 매출액 중 미수금</td>                                                     ';
    salesAmtListTable += '                <td>'+(businessWorkPatterns['rsv02'])['up']+'%</td>                           ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmt1MonthList[6].amt)+'</th>                      ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmt1MonthList[7].amt)+'</th>                      ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmt1MonthList[8].amt)+'</th>                      ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmt1MonthList[9].amt)+'</th>                      ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmt1MonthList[10].amt)+'</th>                     ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(revAmt1MonthList[11].amt)+'</th>                     ';
    salesAmtListTable += '            </tr>                                                                             ';
    salesAmtListTable += '            <tr>                                                                              ';
    salesAmtListTable += '                <td>매출채권</td>                                                                 ';
    salesAmtListTable += '                <td></td>                                                                     ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesCreditAmt[6].amt)+'</th>                        ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesCreditAmt[7].amt)+'</th>                        ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesCreditAmt[8].amt)+'</th>                        ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesCreditAmt[9].amt)+'</th>                        ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesCreditAmt[10].amt)+'</th>                       ';
    salesAmtListTable += '                <th>'+FIN03217M00.onNumberWithCommas(salesCreditAmt[11].amt)+'</th>                       ';
    salesAmtListTable += '            </tr>                                                                             ';
    salesAmtListTable += '        </tbody>                                                                              ';
    salesAmtListTable += '    </table>                                                                                  ';
    salesAmtListTable += '    <!--//매출채권예측테이블-->                                                                       ';
    salesAmtListTable += '                                                                                              ';
    salesAmtListTable += '                                                                                              ';
    salesAmtListTable += '</div>                                                                                        ';

    $("#salesAmtListTable").html(salesAmtListTable);
};


FIN03217M00Component.prototype.initQsrtSave = function() {
    overlay.show();
    console.log("initQsrtSave >>> start >>>>" , finAplyCom);
    var res = finService.getQsrtMngRsltInfoList(finAplyCom.alyid, finAplyCom.stacYy, FIN03217M00.qsrtMngRsltCallback);
};

FIN03217M00Component.prototype.qsrtMngRsltCallback = function(data) {

    console.log('qsrtMngRsltCallback' , data);

    if (data != null) {

         var res = JSON.parse(data);

        if (res.success) {

            FIN03217M00.onQstrInfo(res);
            FIN03217M00.onBusinessWorkPattern();
            overlay.hide();

        } else {
            bootbox.alert(res.msg);
            overlay.hide();
        }

    } else {
        overlay.hide();
    }

};

FIN03217M00Component.prototype.onQstrInfo = function(res) {

    var data = res.data.qsrtInfo;

    var qsrtNo0 = data['qsrtNo0'];
    var qsrtNo1 = data['qsrtNo1'];
    var qsrtNo2 = data['qsrtNo2'];
    var qsrtNo3 = data['qsrtNo3'];
    var qsrtNo4 = data['qsrtNo4'];
    var qsrtNo5 = data['qsrtNo5'];
    var qsrtNo6 = data['qsrtNo6'];
    var qsrtNo7 = data['qsrtNo7'];
    var qsrtNo8 = data['qsrtNo8'];
    var qsrtNo9 = data['qsrtNo9'];
    var qsrtNo10 = data['qsrtNo10'];
    var qsrtNo11 = data['qsrtNo11'];
    var qsrtNo12 = data['qsrtNo12'];
    var qsrtNo13 = data['qsrtNo13'];

    qsrtInfo.qsrtNo0 = qsrtNo0;
    qsrtInfo.qsrtNo1 = qsrtNo1;
    qsrtInfo.qsrtNo2 = qsrtNo2;
    qsrtInfo.qsrtNo3 = qsrtNo3;
    qsrtInfo.qsrtNo4 = qsrtNo4;
    qsrtInfo.qsrtNo5 = qsrtNo5;
    qsrtInfo.qsrtNo6 = qsrtNo6;
    qsrtInfo.qsrtNo7 = qsrtNo7;
    qsrtInfo.qsrtNo8 = qsrtNo8;
    qsrtInfo.qsrtNo9 = qsrtNo9;
    qsrtInfo.qsrtNo10 = qsrtNo10;
    qsrtInfo.qsrtNo11 = qsrtNo11;
    qsrtInfo.qsrtNo12 = qsrtNo12;
    qsrtInfo.qsrtNo13 = qsrtNo13;

    qsrtNoArr = qsrtNo12;

    qsrtInfoArr = data;

    arrlength = Object.keys(qsrtInfoArr).length;

    var year = (qsrtInfo.qsrtNo0['no1']).rsltVl;
    var year1 = (qsrtInfo.qsrtNo0['no1']).rsltVl;

    year = Number(year) - 1;
    beforeYear = "" + year;
    console.log("year >>> ", year);
    console.log("beforeYear >>> ", beforeYear);
    console.log("(qsrtInfo.qsrtNo10['no1'])[0] >>> ", (qsrtInfo.qsrtNo10['no1'])[0].baseYm);
    console.log("(qsrtInfo.qsrtNo9['no1']).baseYm >>> ", (qsrtInfo.qsrtNo9['no1']).baseYm);

    year1 = Number(year1) + 1;
    afterYear = "" + year1;
};

FIN03217M00Component.prototype.onNumberWithCommas = function(totalAmt) {
    return numberWithCommas(totalAmt);
};

function numberWithCommas(x) {

    if (x == null || x == '') {
        return "0"
    }

    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

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

    FIN03217M00.ngOnInit();



});

