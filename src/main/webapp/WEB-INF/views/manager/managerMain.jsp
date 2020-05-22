<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

                    <div class="row-fluid">
                        <div class="alert alert-success">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
                            <h4>Success</h4>
                        	관리자님 환영합니다.</div>
                    	</div>
                    <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">Statistics</div>
                                <div class="pull-right"><span class="badge badge-warning"><a href="${pageContext.request.contextPath }/managerChart.do"><font color="white">view more</font></a></span>

                                </div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span3">
                                    <div class="chart" data-percent="100">35명</div>
                                    <div class="chart-bottom-heading"><span class="label label-info">응시자 수</span>

                                    </div>
                                </div>
                                <div class="span3">
                                    <div class="chart" data-percent="100">53%</div>
                                    <div class="chart-bottom-heading"><span class="label label-info">합격률</span>

                                    </div>
                                </div>
                                <div class="span3">
                                    <div class="chart" data-percent="100">23</div>
                                    <div class="chart-bottom-heading"><span class="label label-info">시험 수</span>

                                    </div>
                                </div>
                                <div class="span3">
                                    <div class="chart" data-percent="100">5</div>
                                    <div class="chart-bottom-heading"><span class="label label-info">의뢰기업수</span>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>
                    <div class="row-fluid">
                        <div class="span6">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">응시자</div>
                                    <div class="pull-right"><span class="badge badge-info"><a href="${pageContext.request.contextPath }/managerUserAccountList.do"><font color="white">view more</font></a></span>
                                    </div>
                                </div>
                                <div class="block-content collapse in">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>응시자ID</th>
                                                <th>응시자 이름</th>
                                                <th>응시자 Email</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${candidate }" var="CandidateVO" varStatus="st"> 
                                            <tr>
                                                <td>${st.count }</td>
                                                <td>${CandidateVO.takerId }</td>
                                                <td>${CandidateVO.takerName }</td>
                                                <td>${CandidateVO.takerEmail }</td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                        <div class="span6">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">회사목록</div>
                                    <div class="pull-right"><span class="badge badge-info"><a href="${pageContext.request.contextPath }/managerAccountList.do"><font color="white">view more</font></a></span>
                                    </div>
                                </div>
                                <div class="block-content collapse in">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>회사ID</th>
                                                <th>회사명</th>
                                                <th>담당자</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${company }" var="CompanyVO" varStatus="st">
                                            <tr>
                                                <td>${st.count }</td>
                                                <td>${CompanyVO.companyId }</td>
                                                <td>${CompanyVO.companyName }</td>
                                                <td>${CompanyVO.companyManager }</td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="span6">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">상담목록</div>
                                    <div class="pull-right"><span class="badge badge-info"><a href="${pageContext.request.contextPath }/managerConsultingList.do"><font color="white">view more</font></a></span>

                                    </div>
                                </div>
                                <div class="block-content collapse in">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>제목</th>
                                                <th>상담희망일</th>
                                                <th>상담진행상태</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${consulting }" var="ConsultingVO" varStatus="st">
                                            <tr>
                                                <td>${st.count }</td>
                                                <td>${ConsultingVO.consultingTitle}</td>
                                                <td>${ConsultingVO.consultingDesiredDate}</td>
                                                <td>${ConsultingVO.consultingStateName}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                        <div class="span6">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">시험목록</div>
                                    <div class="pull-right"><span class="badge badge-info"><a href="${pageContext.request.contextPath }/managerExamList.do"><font color="white">view more</font></a></span>

                                    </div>
                                </div>
                                <div class="block-content collapse in">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>의뢰기업</th>
                                                <th>시험이름</th>
                                                <th>시험상태</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${exam }" var="ExamVO" varStatus="st">
                                        <input type="hidden" name="${ExamVO.examId }" id="${ExamVO.examId }">
                                            <tr>
                                                <td>${st.count }</td>
                                                <td>${ExamVO.companyId}</td>
                                                <td>${ExamVO.examName}</td>
                                                <td>${ExamVO.examStatusName}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                    </div>
                    <div class="row-fluid">
                    </div>

