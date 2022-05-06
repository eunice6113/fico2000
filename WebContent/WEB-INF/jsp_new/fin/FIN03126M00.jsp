<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/inc/common.jsp" %>

            <!--CONTENT CONTAINER-->
            <!--===================================================-->
            <div id="content-container">
                
               <!--Page Title-->
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <div id="page-title">
                    <h1 class="page-header text-overflow"> 기업종합검진 평가 > 비교진단 총괄표</h1>

                    <!--Searchbox-->
                    <div class="searchbox" style="width:350px;">
                        <div class="input-group custom-search-form">
                            <ul class="pull-right breadcrumb">
                                <li><a href="index.html">Home</a></li>
                                <li>기업재무진단평가</li>
                                <li class="active">재무진단엔진</li>
                            </ul>
                        </div>
                    </div>
                </div>   

                <!--Page content-->
                <!--===================================================-->
                <div id="page-content">

                    <div class="row bord-btm">
                        <div class="col-xs-12 col-lg-8">  
                           <h4 class="text-main">
                              <span class="color-gray mr10">*기업명: <span class="marker--grey color-black" name="entpName"/></span>
                              <br class="showOnMobile"/>
                              <span class="color-gray mr10">*분석시나리오명: <span class="marker--grey color-black" name="alycon"/></span>
                          		<br/>
                          		<span class="color-gray ">*회계년도: <select name="stacYyInfo" id="stacYyInfo_1" data-width="90%"></select></span> 
                          	</h4>
                        </div>
                        <div class="col-xs-12 col-lg-4 mb10">  
                          	<div class="text-right showOnNotMobile">
                               <button type="button" class="btn btn-primary mr10" onClick="selectFinInfo()">재무정보변경</button>
                               <button type="button" class="btn btn-primary" onClick="selectAnalysis()">민감도분석시나리오선택</button>
                           </div>
                           <div class="showOnMobile row">
                               <div class="col-xs-5 col-sm-6"><button type="button" class="btn btn-primary btn-block" onClick="selectFinInfo()">재무정보변경</button></div>
                               <div class="col-xs-7 col-sm-6"><button type="button" class="btn btn-primary btn-block" onClick="selectAnalysis()">민감도분석시나리오선택</button></div>
                           </div>
                        </div>
                    </div>

<!-- radra chart 추가 -->
                        <div class="row">
                            <div class="row">
                                <div class="col-md-12 col-lg-8">
                                    <div class="panel panel-bordered-primary pad-all">
                                    <div class="row">
                                        <div class="col-xs-6 col-md-2">
                                            <p class="text-bold text-lg text-center">재무진단 현황(<span name="enslDcdNm"/>)</p>
                                            <div id="totalFinDecisionTable"></div>
                                        </div>
                                        <div class="col-xs-6 col-md-2">
                                            <p class="text-bold text-lg text-center">재무진단 현황(전체)</p>
                                            <div id="totalBokDecisionTable"></div>
                                        </div>
                                        <div class="col-xs-12 col-md-8">
                                            <!-- 레이더 차트 그려주는 곳 -->
                                            <div class="chart-container">
                                                <canvas id="radarChart"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        <!----------------------------------------------------------------------------------------------------------->
                        <!------------------------------------------------ 추가된 부분 끝 ---------------------------------------------->
                        <!----------------------------------------------------------------------------------------------------------->



                        <div class="row">    

                            <div class="col-lg-4">
                                <div class="panel">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">재무진단 현황 (<span name="enslDcdNm"/>)</h3>
                                    </div>
                                    <!--자산-->
                                    <!--===================================================-->
                                    <div class="panel-body">
                                        ( 기준 년도 : <span name="stacYyInfo03"></span> ) 
                                        <br/>                                                    
                                        <table id="decisionRatioTable" class="table table-condense">
                                            <thead>
                                                <tr>
                                                    <th class="text-center">항목</th>
                                                    <th class="text-center">결과</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr class="active text-lg text-center">
                                                    <td colspan="2">*성장성</td>
                                                </tr>
                                                <tr class="active text-lg text-center">
                                                    <td colspan="2">*안전성</td>
                                                </tr>
                                                <tr class="active text-lg text-center">
                                                    <td colspan="2">*수익성</td>
                                                </tr>
                                                <tr class="active text-lg text-center">
                                                    <td colspan="2">*생산성</td>
                                                </tr>
                                                <tr class="active text-lg text-center">
                                                    <td colspan="2">*활동성</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!--===================================================-->
                                    <!--//자산-->                                                
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="panel">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">재무진단 현황(전체)</h3>
                                    </div>
                                    <!--자산-->
                                    <!--===================================================-->
                                    <div class="panel-body">
                                        ( 기준 년도 : <span name="stacYyInfo03"></span> ) 
                                        <br/>                                                    
                                        <table id="decisionRatioTable01" class="table table-condense">
                                            <thead>
                                                <tr>
                                                    <th class="text-center">항목</th>
                                                    <th class="text-center">결과</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr class="active text-lg text-center">
                                                    <td colspan="2">*성장성</td>
                                                </tr>
                                                <tr class="active text-lg text-center">
                                                    <td colspan="2">*안전성</td>
                                                </tr>
                                                <tr class="active text-lg text-center">
                                                    <td colspan="2">*수익성</td>
                                                </tr>
                                                <tr class="active text-lg text-center">
                                                    <td colspan="2">*생산성</td>
                                                </tr>
                                                <tr class="active text-lg text-center">
                                                    <td colspan="2">*활동성</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!--===================================================-->
                                    <!--//자산-->                                                
                                </div>
                            </div>

                        </div>
                        
                        <hr class="new-section-sm bord-no">
                    
                </div>
                <!--===================================================-->
                <!--End page content-->

            </div>
            <!--===================================================-->
            <!--END CONTENT CONTAINER-->

            <div id="popup" class="Pstyle" data-backdrop="static" data-keyboard="false">
                    <span class="b-close"><i class="demo-pli-cross"></i></span>
                    <div class="content" style="height:auto; width:auto;">
                    <iframe width="700px" height="750px" src="" scrolling="auto" frameborder="0" marginwidth="0" id="alyIfr"></iframe>
                    </div>
                 </div>


                 <div id="popup1" class="Pstyle" data-backdrop="static" data-keyboard="false">
                        <span class="b-close"><i class="demo-pli-cross"></i></span>
                        <div class="content" style="height:auto; width:auto;">
                        <iframe width="700px" height="750px" src="" scrolling="auto" frameborder="0" marginwidth="0" id="finIfr"></iframe>
                        </div>
                </div>

<script src="/bootstrap/thema/fico2000_new/js/app/adm/codeMng.service.js"></script>
<script src="/bootstrap/thema/fico2000_new/js/app/fin/fin.services.js"></script>
<!--Demo script [ DEMONSTRATION ]-->
<script src="/bootstrap/thema/fico2000_new/js/demo/nifty-demo.min.js"></script>

<script src="/bootstrap/thema/fico2000_new/plugins/morris-js/morris.min.js"></script>
<script src="/bootstrap/thema/fico2000_new/plugins/morris-js/raphael-js/raphael.min.js"></script>
<script src="/bootstrap/thema/fico2000_new/plugins/flot-charts/jquery.flot.min.js"></script>
<script src="/bootstrap/thema/fico2000_new/plugins/flot-charts/jquery.flot.resize.min.js"></script>

<!--Flot Pie Chart [ OPTIONAL ]-->
<script src="/bootstrap/thema/fico2000_new/plugins/flot-charts/jquery.flot.pie.min.js"></script>
<!--Easy Pie Chart [ OPTIONAL ]-->
<script src="/bootstrap/thema/fico2000_new/plugins/easy-pie-chart/jquery.easypiechart.min.js"></script>
<script src="/bootstrap/thema/fico2000_new/js/app/fin/FIN03126M00Component.js"></script> 


<!--Form Wizard [ SAMPLE ]-->
<script src="/bootstrap/thema/fico2000_new/js/demo/form-wizard.js"></script>

<!--==================================================================================-->
                            <!-- radar Chart head 안에 넣을 부분 -->
                            <script src="/bootstrap/thema/fico2000_new/plugins/chartjs2019/Chart.min.js"></script>
                            <script src="/bootstrap/thema/fico2000_new/plugins/chartjs2019/utils.js"></script>

                            <!--==================================================================================-->

                <script type="text/javascript">



    function returnValue(obj) {
        console.log(obj.entpName);
        console.log(obj.alycon);
        console.log(obj.rightStacYyArr);
        
        console.log(obj.stacYys);

        finAplyCom = {};

        finAplyCom = {
                    alycon : obj.alycon,
                    alyid : obj.alyid,
                    entpName : obj.entpName,
                    bzn : obj.bzn,
                    userid : obj.userid,
                    amtUnit:obj.amtUnit,
                    amtUnitNm:obj.amtUnitNm,
                    rightStacYyArr: obj.rightStacYyArr,
                    stacYys: obj.stacYys
                };

        

        console.log('finAplyCom2 >>> ', finAplyCom);
        
        $("span[name='entpName']").each(function (idx) {
            $("span[name='entpName']").eq(idx).html(obj.entpName);
        });

        $("span[name='alycon']").each(function (idx) {
            $("span[name='alycon']").eq(idx).html(obj.alycon);
        });

        $("select[name='stacYyInfo']").each(function (idx) {
                $("select[name='stacYyInfo']").eq(idx).html('');
                $("select[name='stacYyInfo']").eq(idx).html(finAplyCom.rightStacYyArr);
        });

        finAplyCom.stacYy = $("#stacYyInfo_1").val();

        $("#popup").bPopup().close();


        FIN03126M00.onSearch();
    }

    //재무정보 팝업
    function selectFinInfo() {

        $("#finIfr").attr("src","/fin/pageMove.do?menuCode=FIN02002P00&params=");

        $("#popup1").bPopup({
            modalClose : true
        });
    }

    //분석 팝업
    function selectAnalysis() {

        $("#alyIfr").attr("src","/fin/pageMove.do?menuCode=FIN02001P00&params=");

        $("#popup").bPopup({
            modalClose : true
        });
    }
</script>   
