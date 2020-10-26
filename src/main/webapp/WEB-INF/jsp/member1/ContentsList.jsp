<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
function secconvert(seconds) {

var hour = parseInt(seconds/3600);
var min = parseInt((seconds%3600)/60);
var sec = seconds%60;

return hour + "시간 " + min + "분 ";

}
</script>


<jsp:include page="/WEB-INF/jsp/common/LeftMenu2.jsp" />



<form id="form1" name="form1" method="post" action="/admin/ContentsList">
	<input type="hidden" name="orderKeyword" id="orderKeyword"
		value="${searchVO.orderKeyword}" /> 
		
		<input type="hidden" name="sn"
		id="sn" value="" /> 
		
		<input type="hidden" name="srch" id="srch"
		value="SRCH" />

	<section id="main-content" class=" ">
		<section class="wrapper"
		style='margin-top: 60px; display: inline-block; width: 100%; padding: 15px 0 0 15px;'>

		<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
			<div class="page-title">

				<div class="pull-left">
					<h1 class="title">Contents List</h1>
				</div>


			</div>
		</div>
		<div class="clearfix"></div>


			<div class="col-lg-12">
				<section class="box ">




					<header class="panel_header">
						<h2 class="title pull-left">콘텐츠 </h2>
						<div class="pull-right" style="padding-top: 10px">
							<ul class="list-unstyled">
								<li style="float: left;"><input type="checkbox"
									name="searchType" value="title"
									<c:if test="${fn:indexOf(searchVO.searchType, 'title')!= -1}">checked="checked"</c:if> />
									<label class="chkselect" for="searchType1">이름</label>&nbsp;&nbsp;

									<input type="checkbox" name="searchType" value="code2"
									<c:if test="${fn:indexOf(searchVO.searchType, 'code2')!=-1}">checked="checked"</c:if> />
									<label class="chkselect" for="searchType2">분류</label>&nbsp;&nbsp;
								</li>
								<li style="float: left;"><input type="text"
									style="width: 150px; height: 28px" name="searchKeyword"
									value='<c:out value="${searchVO.searchKeyword}"/>'
									onkeydown="if(event.keyCode == 13) { fn_formSubmit();}">
								</li>
								<li style="float: left;">&nbsp;&nbsp;
									<button type="button" class="btn btn-primary "
										onclick="fn_formSubmit()">검색</button> 
									<button type="button" class="btn btn-orange" onclick="fn_formGo()">신규</button>
								</li>

								


							</ul>
						</div>
					</header>

					<div class="content-body">
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">


								<table class="table">
									<thead>
										<tr>
											<th style="width:5%">#</th>
											
											
											<!-- th style="width:8%">카테고리</th -->
											
											
											
											<th style="width:8%">분류</th>
											<th style="width:8%">썸네일</th>
											
											<th style='width:20%'>제목</th>



											<!--  th style="width:10%">소유자아이디</th -->

											<!--  th style="width:*">메모</th -->
											
											<th style="width:10%">유튜브 URL</th>
											
											<!--  th style="width:10%">시청시간</th -->
											
											<th style="width:10%">투표수</th>
											
											<th style="width:10%">Preview</th>
											



										</tr>
									</thead>
									<tbody>
									<% int ii=0; %>
									
										<c:forEach var="listview" items="${listview}"
											varStatus="status"><% ii++; %>
											
											


											<tr>
												<td><c:out
														value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" />
												</td>
												<!--  td>${listview.code2}</td -->
												
												<td>${listview.category}</td>
												<td>
												
									<c:if test="${fn:indexOf(listview.imgfile, 'https://i.ytimg.com/')!= -1}">
									<img src="${listview.imgfile}" width="150">
									</c:if>
									
									
									<c:if test="${fn:indexOf(listview.imgfile, 'https://i.ytimg.com/') == -1}">
									<img src="/images/${listview.imgfile}" width="150">
									</c:if>
												
												
												</td>
												

			<td><a href="javascript:fn_readGo('${listview.sn}')">${listview.title}</a></td>


												<!--  td>
												<span style="cursor:pointer;padding:3px;border-radius:5px;background-color:#f2f2f2" 
												href="#" data-placement="top" 
												data-toggle="tooltip<%= ii %>" 
												title="이름 : ${listview.username}  /  연락처 : ${listview.mobile}  /  이메일 : ${listview.email}">
												<c:out value="${listview.userid}" /></span>
<script>
$(document).ready(function(){
  $('[data-toggle="tooltip<%= ii %>"]').tooltip(); 
});
</script>
												</td -->
												<!--  td><c:out value="${listview.memo}" /></td -->
												
												
												<td>${listview.url}</td>
												
												<!--  td><script>document.write(secconvert(${listview.looktime}))</script></td -->
												
												<td>${listview.looktime}</td>
												

												<td>
													<button type="button" class="btn btn-orange"
													onclick="winpopup('${listview.code2}','${listview.url}')">미리보기</button>
													
													
													<!-- button type="button" class="btn btn-primary"
													onclick="winpopup2('${listview.code2}','${listview.url}')">RTMP JWPlayer</button -->
													
													
													

													
												</td>




											</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>



							<div class="col-md-12 col-sm-12 col-xs-12"
								style='border-top: 2px solid #d8d8d8; padding-top: 20px;'>
								<jsp:include page="/WEB-INF/jsp/common/Paging.jsp" />
							</div>
						</div>
					</div>


				</section>

			</div>
		</section>
	</section>


</form>



<script>
	function fn_formSubmit() {
		document.form1.submit();
	}
</script>

<script>
	function fn_orderKey(_a) {
		document.form1.orderKeyword.value = _a;
		document.form1.submit();
	}
</script>

<script>
	function fn_formGo() {
		location.href = "/admin/ContentsForm";
	}
</script>

<script>
	function fn_readGo(_a) {
		document.form1.sn.value = _a;
		document.form1.action = "ContentsRead";
		document.form1.submit();
	}
</script>



<jsp:include page="/WEB-INF/jsp/common/Footer2.jsp" />
