<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/jsp/common/LeftMenu2.jsp" />

            <section id="main-content" class=" ">
                <section class="wrapper" style='margin-top:60px;display:inline-block;width:100%;padding:15px 0 0 15px;'>

                    <div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
                        <div class="page-title">

                            <div class="pull-left">
                                <h1 class="title">Youtube Crawler</h1>                            
                            </div>


                        </div>
                    </div>
                    <div class="clearfix"></div>

		<div class="col-lg-12">
			<section class="box ">
				<header class="panel_header">
					<h2 class="title pull-left">Data Info</h2>
					<div class="actions panel_actions pull-right">
						<i class="box_toggle fa fa-chevron-down"></i> <i
							class="box_setting fa fa-cog" data-toggle="modal"
							href="#section-settings"></i> <i class="box_close fa fa-times"></i>
					</div>
				</header>
				<div class="content-body">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">

							<form name="form1" action="ytbPost" method="post"
								enctype="multipart/form-data">
								
								



								<div class="row">
									<div class="col-md-12 col-sm-12 col-xs-12">


										<table id="customers">
											<tr>


												



												<td class="tdl" style="width: 25%">검색어, 해시태크, 키워드 ( 예 : 핑크리본 )</td>

												<td style="width: 75%"><input name="title" type="text"
													value="" class="form-control"></td>
											</tr>

											


												<td class="tdl" style="width: 25%">콘텐츠종류( 코드화 카테고리에서 입력 )</td>

												<td style="width: 75%"><input 
												name="kind" type="text"
													value="" class="form-control"
													placeholder="GAM, EVT, FOO 등 코드를 입력하세요"
													></td>



												
											</tr>
											
										</table>



										<div class="form-group" style="display:none">
											<label class="form-label" for="field-1">첨부파일</label>
											<div class="controls">
												<c:forEach var="listview" items="${listview}"
													varStatus="status">
													<input type="checkbox" name="fileno"
														value="<c:out value="${listview.fileno}"/>">
													<a
														href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">
														<c:out value="${listview.filename}" />
													</a>
													<c:out value="${listview.size2String()}" />
													<br />
												</c:forEach>


												<input type="file" name="uploadfile" multiple="" />
											</div>
										</div>

										<div class="form-group" style="margin-top: 20px">

											
											<button type="button" class="btn btn-orange"
												onclick="fn_formSv()">크롤링 시작</button>
												
												
										</div>

									</div>

								</div>
							</form>
							<script>
								function fn_formSv() {
									
									if ( document.form1.title.value == "" || 
											document.form1.kind.value == "" ){
										
										alert("Are you kidding me?");
									}else{document.form1.submit();}
									

								}
								
								

							</script>

						</div>
					</div>
				</div>
			</section>
		</div>





	</section>
											</section>
											<!-- END CONTENT -->


											<jsp:include page="/WEB-INF/jsp/common/Footer2.jsp" />