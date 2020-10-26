<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
String HEADERURL = request.getRequestURL().toString(); 
main.java.common.satelite.kr.LeftMenuUtil btr = new main.java.common.satelite.kr.LeftMenuUtil();
//btr.setUserProgram(HEADERURL);
%>

<%
	String sessionUTYPE = "";
	if ( session.getAttribute("USERTYPE") != null ) 
	{ sessionUTYPE = (String)session.getAttribute("USERTYPE"); }
%>

<ul class='wraplist'>


	<li class="<%=btr.CLASSOPEN(HEADERURL, "member1/Login")%>">
	<a href="stat"> <i
			class="fa fa-dashboard"></i> <span class="title"><%= sessionUTYPE %>-Dashboard</span>
	</a></li>
	
	<li class="<%=btr.CLASSOPEN(HEADERURL, "posts/Chart")%>"><a href="javascript:;"> <i
			class="fa fa-bar-chart"></i> <span class="title">Status</span> <span
			class="arrow "></span>
	</a>
		<ul class="sub-menu">
			
			<li><a class="<%=btr.CLASSACTIVE(HEADERURL, "posts/Chart")%>" 
			href="/admin/charts">통,집계</a></li>
			
		</ul></li>
	
	
	
	<% if ( sessionUTYPE.equals("SA") ) { %>

	<li class="<%=btr.CLASSOPEN(HEADERURL, "member1/Member")%>
	<%=btr.CLASSOPEN(HEADERURL, "member1/Code")%>
	
	<%=btr.CLASSOPEN(HEADERURL, "member1/Banner")%>
	<%=btr.CLASSOPEN(HEADERURL, "member1/Banner2")%>
	
	"><a href="javascript:;"> <i
			class="fa fa-folder-open"></i> <span class="title">WEB-AdminFunction</span>
			<span class="arrow "></span>
	</a>
		<ul class="sub-menu">
			<li><a href="/admin/memberList"
			class="<%=btr.CLASSACTIVE(HEADERURL, "member1/Member")%>"
			> <span class="title">회원목록</span>
			</a></li>
			
			
			<li><a href="/admin/codeList"
			class="<%=btr.CLASSACTIVE(HEADERURL, "member1/Code")%>"
			> <span class="title">코드목록</span>
			</a></li>
			
			
			
			
			
			<li><a href="/admin/BannerList"
			class="<%=btr.CLASSACTIVE(HEADERURL, "member1/Banner")%>"
			> <span class="title">메인,콘텐츠배너목록</span>
			</a></li>
			
			
			<li><a href="/admin/Banner2List"
			class="<%=btr.CLASSACTIVE(HEADERURL, "member1/Banner2")%>"
			> <span class="title">4U,HOT 배너목록</span>
			</a></li>
			
			
			
			
			
			<% } %>
			
	
			
			
			
		<% if ( sessionUTYPE.equals("CP") ) { %>

	<li class="<%=btr.CLASSOPEN(HEADERURL, "member1/Contents2")%>">
			<a href="javascript:;"> <i
			class="fa fa-folder-open"></i> <span class="title">AdminFunction</span>
			<span class="arrow "></span>
	</a>
		<ul class="sub-menu">
			
			
			
			<li><a href="/admin/Contents2List"
			class="<%=btr.CLASSACTIVE(HEADERURL, "member1/Contents2")%>"
			> <span class="title">나의콘텐츠목록</span>
			</a></li>
			
			
			
			
			
			<% } %>
			
	
			
			
			
			
		</ul></li>


			

			<li class="
			<%=btr.CLASSOPEN(HEADERURL, "AppMain")%>
			<%=btr.CLASSOPEN(HEADERURL, "posts/Post")%>
			"><a
				href="javascript:;"> <i class="fa fa-folder-open"></i> <span
					class="title">APP-AdminFunction</span> <span class="arrow "></span>
			</a>

				<ul class="sub-menu">
					
					
					
					<li><a href="/admin/PostList"
					class="<%=btr.CLASSACTIVE(HEADERURL, "Posts")%>"
					> <span class="title">공지사항-알림</span>
					</a></li>
					
					
					<li><a href="/admin/AppMain1"
						class="<%=btr.CLASSACTIVE(HEADERURL, "AppMain1")%>"> <span
							class="title">광고 영상 영역</span>
					</a></li>
					
					<li><a href="/admin/AppMain2"
						class="<%=btr.CLASSACTIVE(HEADERURL, "AppMain2")%>"> <span
							class="title">지금 뜨는 콘텐츠</span>
					</a></li>

					<li><a href="/admin/AppMain3"
						class="<%=btr.CLASSACTIVE(HEADERURL, "AppMain3")%>"> <span
							class="title">해시태그 연결 콘텐츠</span>
					</a></li>
					
					
					<li><a href="/admin/AppMain4"
						class="<%=btr.CLASSACTIVE(HEADERURL, "AppMain4")%>"> <span
							class="title">인기 크리에이터</span>
					</a></li>
				
				
				</ul>
			
			
			</li>
			
			
			<li class="<%=btr.CLASSOPEN(HEADERURL, "posts/Ytb")%>
			<%=btr.CLASSOPEN(HEADERURL, "Contents")%>
			"><a
				href="javascript:;"> <i class="fa fa-folder-open"></i> <span
					class="title">핑크리본 관리</span> <span class="arrow "></span>
			</a>

				<ul class="sub-menu">
					<li><a href="/admin/ytbForm"
						class="<%=btr.CLASSACTIVE(HEADERURL, "posts/Ytb")%>"> <span
							class="title">유튜브크롤링</span>
					</a></li>
					
					
					<li><a href="/admin/ContentsList"
					class="<%=btr.CLASSACTIVE(HEADERURL, "member1/Contents")%>"
					> <span class="title">콘텐츠목록</span>
					</a></li>
				
				
				</ul>
			
			
			</li>


			
			
			
			

			<li class="<%=btr.CLASSOPEN(HEADERURL, "Sh001")%>
			
			"><a
				href="javascript:;"> <i class="fa fa-folder-open"></i> <span
					class="title">슈팅스타관리</span> <span class="arrow "></span>
			</a>

				<ul class="sub-menu">
					<li><a href="Sh001List"
						class="<%=btr.CLASSACTIVE(HEADERURL, "Sh001")%>"> <span
							class="title">지원자관리</span>
					</a></li>
					
					
					
				
				
				</ul>
			
			
			</li>


			

			
	
	<!--  
	
	<li style="font-size:11px;color:#fefefe;text-align:center">이하의 메뉴는 개발용 디자인 페이지</li>
	
	
	
	<li class=""><a href="/design/widgets.html"> <i class="fa fa-th"></i>
			<span class="title">Widgets</span><span
			class="label label-orange nosubmenu">HOT</span>
	</a></li>
	<li class=""><a href="javascript:;"> <i class="fa fa-suitcase"></i>
			<span class="title">UI Elements</span> <span class="arrow "></span>
	</a>
		<ul class="sub-menu">
			<li><a class="" href="/design/ui-typography.html">Typography</a></li>
			<li><a class="" href="/design/ui-accordion.html">Tabs & Accordions</a></li>
			<li><a class="" href="/design/ui-progress.html">Progress Bars</a></li>
			<li><a class="" href="/design/ui-icons.html">Icons</a></li>
			<li><a class="" href="/design/ui-buttons.html">Buttons</a></li>
			<li><a class="" href="/design/ui-modals.html">Modals</a></li>
			<li><a class="" href="/design/ui-notifications.html">Alert &
					Notifications</a></li>
			<li><a class="" href="/design/ui-tooltips.html">Tooltips & Popovers</a></li>
			<li><a class="" href="/design/ui-sortable.html">Sortable Group</a></li>
			<li><a class="" href="/design/ui-navbars.html">Navbars & Dropdowns</a></li>
			<li><a class="" href="/design/ui-extra.html">Other Elements</a></li>
			<li><a class="" href="/design/ui-carousel.html">Carousel Slider</a></li>
			<li><a class="" href="/design/ui-tree.html">Tree</a></li>
			<li><a class="" href="/design/ui-panels.html">Draggable Panels</a></li>
			<li><a class="" href="/design/ui-grids.html">Grids</a></li>
			<li><a class="" href="/design/ui-tiles.html">Tile Widgets</a></li>
		</ul></li>
	<li class=""><a href="javascript:;"> <i class="fa fa-sliders"></i>
			<span class="title">Forms</span> <span class="arrow "></span>
	</a>
		<ul class="sub-menu">
			<li><a class="" href="/design/form-elements.html">Form Elements</a></li>
			<li><a class="" href="/design/form-components.html">Form Components</a></li>
			<li><a class="" href="/design/form-wizard.html">Form Wizard</a></li>
			<li><a class="" href="/design/form-validation.html">Form Validations</a></li>
			<li><a class="" href="/design/form-fileupload.html">File Upload &
					Dropzone</a></li>
			<li><a class="" href="/design/form-editors.html">Editors</a></li>
			<li><a class="" href="/design/form-masks.html">Input Masks</a></li>
		</ul></li>
	<li class=""><a href="javascript:;"> <i class="fa fa-gift"></i>
			<span class="title">Extra</span> <span class="arrow "></span><span
			class="label label-orange">NEW</span>
	</a>
		<ul class="sub-menu">
			<li><a class="" href="/design/ui-calendar.html">Calendar</a></li>
			<li><a class="" href="/design/ui-pricing.html">Pricing tables</a></li>
			<li><a class="" href="/design/ui-profile.html">Profile</a></li>
			<li><a class="" href="/design/ui-login.html">Login</a></li>
			<li><a class="" href="/design/ui-register.html">Registration</a></li>
			<li><a class="" href="/design/ui-timeline.html">Timeline</a></li>
			<li><a class="" href="/design/ui-invoice.html">Invoice</a></li>
			<li><a class="" href="/design/ui-members.html">Members</a></li>
			<li><a class="" href="/designui-gallery.html">Gallery</a></li>
			<li><a class="" href="/design/ui-search.html">Search</a></li>
			<li><a class="" href="/design/ui-blogs.html">Blogs</a></li>
			<li><a class="" href="/design/ui-imagecrop.html">Image cropper</a></li>
			<li><a class="" href="/design/ui-tocify.html">Tocify</a></li>
			<li><a class="" href="/design/ui-faq.html">FAQ</a></li>
			<li><a class="" href="/design/ui-404.html">404</a></li>
			<li><a class="" href="/design/ui-500.html">500</a></li>
			<li><a class="" href="/design/ui-lockscreen.html">Lock Screen</a></li>
		</ul></li>
	<li class=""><a href="javascript:;"> <i class="fa fa-envelope"></i>
			<span class="title">Mailbox</span> <span class="arrow "></span><span
			class="label label-orange">4</span>
	</a>
		<ul class="sub-menu">
			<li><a class="" href="/design/mail-inbox.html">Inbox</a></li>
			<li><a class="" href="/design/mail-compose.html">Compose</a></li>
			<li><a class="" href="/design/mail-view.html">View</a></li>
		</ul></li>
	<li class=""><a href="javascript:;"> <i
			class="fa fa-bar-chart"></i> <span class="title">Charts</span> <span
			class="arrow "></span>
	</a>
		<ul class="sub-menu">
			<li><a class="" href="/design/charts-morris.html">Morris Charts</a></li>
			<li><a class="" href="/design/charts-chartjs.html">Chart JS</a></li>
			<li><a class="" href="/design/charts-flot.html">Flot Charts</a></li>
			<li><a class="" href="/design/charts-sparkline.html">Sparkline
					Charts</a></li>
			<li><a class="" href="/design/charts-easypiechart.html">PIE charts &
					Knobs</a></li>
			<li><a class="" href="/design/charts-rickshaw.html">Rickshaw Charts</a></li>
		</ul></li>
	<li class=""><a href="javascript:;"> <i class="fa fa-table"></i>
			<span class="title">Tables</span> <span class="arrow "></span>
	</a>
		<ul class="sub-menu">
			<li><a class="" href="/design/admin/tableBasic">Basic tables</a></li>
			<li><a class="" href="/design/tables-data.html">Data Tables</a></li>
			<li><a class="" href="/design/tables-responsive.html">Responsive
					Tables</a></li>
		</ul></li>
	<li class=""><a href="javascript:;"> <i class="fa fa-columns"></i>
			<span class="title">Layouts</span> <span class="arrow "></span>
	</a>
		<ul class="sub-menu">
			<li><a class="" href="/design/layout-default.html">Default Layout</a></li>
			<li><a class="" href="/design/layout-collapsed.html">Collapsed Menu</a></li>
			<li><a class="" href="/design/layout-chat.html">Chat Open</a></li>
			<li><a class="" href="/design/layout-boxed.html">Boxed Layout</a></li>
		</ul></li>
	<li class=""><a href="javascript:;"> <i
			class="fa fa-map-marker"></i> <span class="title">Maps</span> <span
			class="arrow "></span>
	</a>
		<ul class="sub-menu">
			<li><a class="" href="/design/ui-vectormaps.html">Vector Maps</a></li>
			<li><a class="" href="/design/ui-googlemaps.html">Google Maps</a></li>
			<li><a class="" href="/design/ui-googlemapfull.html">Advanced Google
					Maps</a></li>
		</ul></li>
		
	-->
		
		
	

</ul>