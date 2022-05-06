<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/inc/common.jsp" %>

            <!--CONTENT CONTAINER-->
            <!--===================================================-->
            <div id="content-container">

                <!--Page Title-->
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <div id="page-title">
                    <h1 class="page-header text-overflow">강의자료</h1>

                    <!--Searchbox-->
                    <div class="searchbox">
                        <div class="input-group custom-search-form">
                            <ul class="pull-right breadcrumb">
                                <li>HOME</li>
								<li>자료실</li>
                                <li class="active">강의자료</li>
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
                            <h3 class="panel-title">강의자료 목록</h3>
                        </div>

                        <div class="panel-body">

                            <div class="alert alert-danger fade in" role="alert">
                                <span id="errMsg"></span>
                            </div>
                            <div class="margin-bottom-20"></div>
                            
                            <table id="grid-list" class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th data-column-id="code" data-header-align="center" data-visible="false">게시판코드</th>
                                                <th data-column-id="mainNo" data-header-align="center" data-visible="false">게시판번호</th>
                                                <th data-width="10%" data-column-id="numRow" data-header-align="center" data-align="center">순번</th>
                                                <th data-width="40%" data-column-id="title" data-header-align="center">제 목</th>
                                                <th data-width="15%" data-column-id="name" data-header-align="center" data-align="center">글쓴이</th>
                                                <th data-width="15%" data-column-id="writeDate" data-header-align="center" data-align="center">작성일</th>
                                                <th data-width="10%" data-column-id="flapMngmNo" data-header-align="center" data-align="center" data-formatter="fileTypeRenderer">첨부파일</th>
                                                <th data-width="10%" data-column-id="count" data-header-align="center" data-align="center">hit</th>
                                            </tr>
                                        </thead>
                            </table>

                        </div>

                    </div>

                 </div>

            </div>

<script src="/bootstrap/thema/fico2000/js/app/com/board.services.js"></script>
<script src="/bootstrap/thema/fico2000/js/app/dta/DTA01000M00Component.js"></script>   