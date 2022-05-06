<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/inc/common.jsp" %>
            <!--CONTENT CONTAINER-->
            <!--===================================================-->
            <div id="content-container">

                <!--Page Title-->
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <div id="page-title">
                    <h1 class="page-header text-overflow">자유게시판</h1>

                    <!--Searchbox-->
                    <div class="searchbox">
                        <div class="input-group custom-search-form">
                            <ul class="pull-right breadcrumb">
                                <li>HOME</li>
								<li>커뮤니티</li>
                                <li class="active">자유게시판</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End page title-->
                 <div id="page-content">
                    <!--===================================================-->
                    <div class="panel">

                        <div class="panel-heading">
                            <h3 class="panel-title">자유게시판 등록</h3>
                        </div>

                        <div class="panel-body">

                            <!-- Search Well -->
                            <div class="row">
                                <div class="col-lg-12">
                                    
                                    <div class="alert alert-danger" role="alert">
                                                <span id="errRegMsg"></span>
                                    </div>
                                    <div class="margin-bottom-20"></div>
                                        <form class="sky-form" role="form" id="ngForm" name="ngForm">
                                        <input type="hidden" class="form-control" id="code" name="code" value='<%=paramMap.get("code")%>'>
                                        <input type="hidden" class="form-control" id="mainNo" name="mainNo">
                                        <input type="hidden" class="form-control" id="content" name="content">
                                        <fieldset>                            
                                                    <div class="row">
                                                        <section class="col col-2">
                                                            <h4>제목</h4>
                                                        </section>
                                                        <section class="col col-10">
                                                            <label class="input">
                                                                <input type="text" class="form-control" id="title" name="title" size="50" placeholder="제목을 입력하세요" required >
                                                            </label>
                                                        </section>
                                                    </div>
                                                    
                                                    <div class="row">
                                                        <section class="col col-2">
                                                            <h4>내용</h4>
                                                        </section>
                                                        <section class="col col-10">
                                                            <label class="input">
                                                                <textarea class="form-control" rows="10" name="rec-summary"  id="rec-content"></textarea>
                                                            </label>
                                                        </section>
                                                    </div>   

                                                    <div class="row">
                                                        <div style="float:right;margin-bottom:10px;margin-right:10px;">
                                                        <button class="btn btn-default" type="button" id="onGoList">목록</button>
                                                        <button class="btn btn-primary" type="button" id="onSave">저장</button>
                                                        <button class="btn btn-darkgray" type="button" id="onInit">초기화</button>
                                                        </div>
                                                    </div>
                        
                                                </fieldset>
                                    </form>


                                </div>
                                
                                <!-- /.col-lg-12 --> 
                                
                            </div>
                            <!-- /.row -->
                        </div>

                    </div>

                 </div>

            </div>

<script src="/bootstrap/thema/fico2000_new/js/app/com/board.services.js"></script>
<script src="/bootstrap/thema/fico2000_new/js/app/com/file.services.js"></script>
<script src="/bootstrap/thema/fico2000_new/js/app/cmu/CMU02000M01Component.js"></script>   
