package main.java.admin.satelite.kr;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import main.java.common.satelite.kr.FileUtil;
import main.java.common.satelite.kr.FileVO;
import main.java.common.satelite.kr.LeftMenuUtil;
import main.java.common.satelite.kr.Search;
import main.java.common.satelite.kr.SearchVO;

@Controller
public class Member1Ctr {

	@Autowired
	private Member1Svc member1Svc;


	@RequestMapping(value = "/ContentsList")
	public String Contents1(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {


		String USERTYPE = "";
		if ( request.getSession().getAttribute("USERTYPE") != null ) {
			USERTYPE = (String)request.getSession().getAttribute("USERTYPE");
		}
		String USERID = "";
		if ( request.getSession().getAttribute("USERID") != null ) {
			USERID = (String)request.getSession().getAttribute("USERID");
		}

		if ( USERTYPE.equals("CP")) {



			searchVO.setUserid(USERID);

			searchVO.pageCalculate( member1Svc.selectContents12Count(searchVO) ); // startRow, endRow

			List<?> listview  = member1Svc.selectContents12List(searchVO);

			modelMap.addAttribute("listview", listview);
			modelMap.addAttribute("searchVO", searchVO);
			
			
		
		}else {
			searchVO.pageCalculate( member1Svc.selectContents1Count(searchVO) ); // startRow, endRow

			List<?> listview  = member1Svc.selectContents1List(searchVO);

			modelMap.addAttribute("listview", listview);
			modelMap.addAttribute("searchVO", searchVO);
			
			
		}
		
		return "member1/ContentsList";

	}

	@RequestMapping(value = "/Contents2List")
	public String Contents12(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, 
			HttpSession session) {

		String USERID = "";
		if ( request.getSession().getAttribute("USERID") != null ) {
			USERID = (String)request.getSession().getAttribute("USERID");
		}

		searchVO.setUserid(USERID);

		searchVO.pageCalculate( member1Svc.selectContents12Count(searchVO) ); // startRow, endRow

		List<?> listview  = member1Svc.selectContents12List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);


		return "member1/ContentsList";

	}

	@RequestMapping(value = "/codeList")
	public String Code1(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {




		searchVO.pageCalculate( member1Svc.selectCode1Count(searchVO) ); // startRow, endRow

		List<?> listview  = member1Svc.selectCode1List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);


		return "member1/CodeList";

	}

	@RequestMapping(value = "/codeForm")
	public String Code1Form(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {
		
		String code1 = "";
		if ( request.getParameter("code1") != null) {
			code1 = request.getParameter("code1");
		}

		List<?> listsel  = member1Svc.selectCode1SelList();

		modelMap.addAttribute("listsel", listsel);
		
		modelMap.addAttribute("code1", code1);


		return "member1/CodeForm";

	}
	
	@RequestMapping(value = "/ytbForm")
	public String ytb1Form(HttpServletRequest request, 
			SearchVO searchVO, ModelMap modelMap, HttpSession session) {
		
		


		return "posts/Ytbform";

	}
	
	@RequestMapping(value = "/ytbPost")
	public String ytb1Post(HttpServletRequest request, 
			SearchVO searchVO, ModelMap modelMap, HttpSession session) {
		
		String title = "";
		String kind = "";
		
		title = request.getParameter("title");
		kind = request.getParameter("kind");
		
		Search srch = new Search();
		srch.execute(title, kind);


		return "posts/Ytbform";

	}
	
	@RequestMapping(value = "/codeRead")
	public String Code1Read(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

		String sn = "";
		if ( request.getParameter("sn")!= null) {
			sn = request.getParameter("sn");
		}
		Member1VO mvo = new Member1VO();
		mvo = member1Svc.selectCode1One(sn);
		modelMap.addAttribute("mvo", mvo);
		
		List<?> listsel  = member1Svc.selectCode1SelList();

		modelMap.addAttribute("listsel", listsel);



		return "member1/CodeRead";

	}

	@RequestMapping(value = "/codeSave")
	public String Code1Save(Member1VO mvo,HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {


		//상위 코드 하드 코딩
		if ( mvo.getCode1().equals("USER")) {mvo.setCode1memo("회원");}
		if ( mvo.getCode1().equals("CONT")) {mvo.setCode1memo("콘텐츠");}
		if ( mvo.getCode1().equals("CMS")) {mvo.setCode1memo("홈페이지");}
		if ( mvo.getCode1().equals("CATE")) {mvo.setCode1memo("카테고리");}

		member1Svc.insertCode1One(mvo);


		searchVO.pageCalculate( member1Svc.selectCode1Count(searchVO) ); // startRow, endRow

		List<?> listview  = member1Svc.selectCode1List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);

		return "member1/CodeList";

	}
	
	@RequestMapping(value = "/codeDelete")
	public String Code1Del(Member1VO mvo,HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {


		String sn = "";
		if ( request.getParameter("sn") != null) {
			sn = request.getParameter("sn");
		}
		
		if ( mvo.getCode1().equals("USER")) {mvo.setCode1memo("회원");}
		if ( mvo.getCode1().equals("CONT")) {mvo.setCode1memo("콘텐츠");}
		if ( mvo.getCode1().equals("CMS")) {mvo.setCode1memo("홈페이지");}
		if ( mvo.getCode1().equals("CATE")) {mvo.setCode1memo("카테고리");}

		member1Svc.deleteCode1One(sn);


		searchVO.pageCalculate( member1Svc.selectCode1Count(searchVO) ); // startRow, endRow

		List<?> listview  = member1Svc.selectCode1List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);

		return "member1/CodeList";

	}

	@RequestMapping(value = "/")
	public String MainLogin(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

		return "member1/LoginForm";

	}

	@RequestMapping(value = "/regist")
	public String MainRegist1(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

		return "member1/Register";

	}

	@RequestMapping(value = "/stat")
	public String MainStat1(Member1VO mvo, HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

		
		String USERID = "";
		if ( request.getSession().getAttribute("USERID") != null ) {
			USERID = (String)request.getSession().getAttribute("USERID");
		}
		String USERTYPE = "";
		if ( request.getSession().getAttribute("USERTYPE") != null ) {
			USERTYPE = (String)request.getSession().getAttribute("USERTYPE");
		}
		
		if ( USERTYPE.equals("SA") ) {USERID="";
		mvo = member1Svc.selectMainStat(USERID);
		}else {
			mvo = member1Svc.selectMainStat2(USERID);
		}
		
		modelMap.addAttribute("mvo", mvo);
		
		return "member1/LoginList";

	}

	@RequestMapping(value = "/logout")
	public String MainLogout(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

		return "member1/LoginForm";

	}

	@RequestMapping(value = "/regist2")
	public String MainRegist2(Member1VO mvo,HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

		String userid = "";
		String userpw = "";
		String username = "";
		String email = "";
		String mobile = "";

		if (request.getParameter("userid") != null) {
			userid = request.getParameter("userid");
		}

		if (request.getParameter("userpw") != null) {
			userpw = request.getParameter("userpw");
		}

		if (request.getParameter("username") != null) {
			username = request.getParameter("username");
		}

		if (request.getParameter("email") != null) {
			email = request.getParameter("email");
		}

		if (request.getParameter("mobile") != null) {
			mobile = request.getParameter("mobile");
		}

		Member1VO param = new Member1VO();
		param.setUserid(userid);
		param.setUserpw(userpw);
		param.setEmail(email);
		param.setMobile(mobile);
		param.setUsername(username);

		member1Svc.insertMember1One(param);


		return "member1/LoginForm";

	}
	
	@RequestMapping(value = "/memberSave")
	public String memberSave(Member1VO mvo,HttpServletRequest request, SearchVO searchVO, 
			ModelMap modelMap, HttpSession session) {

		String userid = "";
		String userpw = "";
		String username = "";
		String email = "";
		String mobile = "";
		String usertype = "";

		if (request.getParameter("userid") != null) {
			userid = request.getParameter("userid");
		}
		
		if (request.getParameter("usertype") != null) {
			usertype = request.getParameter("usertype");
		}

		if (request.getParameter("userpw") != null) {
			userpw = request.getParameter("userpw");
		}

		if (request.getParameter("username") != null) {
			username = request.getParameter("username");
		}

		if (request.getParameter("email") != null) {
			email = request.getParameter("email");
		}

		if (request.getParameter("mobile") != null) {
			mobile = request.getParameter("mobile");
		}

		Member1VO param = new Member1VO();
		param.setUserid(userid);
		param.setUserpw(userpw);
		param.setEmail(email);
		param.setMobile(mobile);
		param.setUsername(username);
		param.setUsertype(usertype);
		
		
		String[] fileno = request.getParameterValues("fileno");
		FileUtil fs = new FileUtil();
		List<FileVO> filelist = fs.saveAllFilesBB(mvo.getUploadfile());
		

		member1Svc.updateMember1One(param, filelist, fileno);


		searchVO.pageCalculate( member1Svc.selectMember1Count(searchVO) ); // startRow, endRow

		List<?> listview  = member1Svc.selectMember1List(searchVO);

		
		searchVO.setAction("memberList");
		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);



		return "member1/MemberList";

	}

	@RequestMapping(value = "/login")
	public String MainLogin2(Member1VO mvo, HttpServletRequest request, SearchVO searchVO, ModelMap modelMap,
			HttpSession session) {

		String userid = "";
		String userpw = "";
		if (request.getParameter("userid") != null) {
			userid = request.getParameter("userid");
		}

		if (request.getParameter("userpw") != null) {
			userpw = request.getParameter("userpw");
		}

		Member1VO param = new Member1VO();
		param.setUserid(userid);
		param.setUserpw(userpw);

		mvo = member1Svc.selectMember1One(param);

		if (mvo != null) {
			if ( ( mvo.getUsertype().equals("SA") && !mvo.getUsername().equals("") ) ||

					( mvo.getUsertype().equals("CP") && !mvo.getUsername().equals("") )

					) {
				
				session.setAttribute("USERNAME", mvo.getUsername());
				session.setAttribute("USERTYPE", mvo.getUsertype());
				session.setAttribute("USERID", mvo.getUserid());

				modelMap.addAttribute("mvo", mvo);
				
				LeftMenuUtil lmu = new LeftMenuUtil();
				lmu.setUserProgram("ADMINLOGIN", mvo.getUserid());
				
				
				String USERID = "";
				if ( request.getSession().getAttribute("USERID") != null ) {
					USERID = (String)request.getSession().getAttribute("USERID");
				}
				String USERTYPE = "";
				if ( request.getSession().getAttribute("USERTYPE") != null ) {
					USERTYPE = (String)request.getSession().getAttribute("USERTYPE");
				}
				
				if ( USERTYPE.equals("SA") ) {USERID="";
				mvo = member1Svc.selectMainStat(USERID);
				}else {
					mvo = member1Svc.selectMainStat2(USERID);
				}
				
				modelMap.addAttribute("mvo", mvo);
				
				
				

				return "member1/LoginList";

			} else {
				return "member1/LoginForm";
			}

		} else {
			return "member1/LoginForm";
		}

	}

	@RequestMapping(value = "/memberList")
	public String member1List(
			HttpServletRequest request,SearchVO searchVO, ModelMap modelMap) {



		searchVO.pageCalculate( member1Svc.selectMember1Count(searchVO) ); // startRow, endRow

		List<?> listview  = member1Svc.selectMember1List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);



		return "member1/MemberList";
	}

	@RequestMapping(value = "/memberExcel")
	public String member1Ex(
			HttpServletRequest request,SearchVO searchVO, ModelMap modelMap) {



		List<?> listview  = member1Svc.selectMember1Excel(searchVO);

		modelMap.addAttribute("listview", listview);



		return "member1/MemberExcel";
	}

	@RequestMapping(value = "/member1Read")
	public String member1Read(
			HttpServletRequest request,SearchVO searchVO, ModelMap modelMap) {

		String uid = request.getParameter("userid");

		Member1VO param = new Member1VO();

		param = member1Svc.selectMember1Read(uid);

		modelMap.addAttribute("mvo", param);



		return "member1/MemberForm";
	}

	@RequestMapping(value = "/tableBasic")
	public String tableBasic(
			HttpServletRequest request,SearchVO searchVO, ModelMap modelMap) {

		return "member1/TableBasic";
	}

	@RequestMapping(value = "/ContentsUpdate")
	public String ContentsUpdate(SearchVO searchVO, 
			HttpServletRequest request, Banner1VO banner1Info, 
			ModelMap modelMap) {

		
		FileUtil fs = new FileUtil();
		List<FileVO> filelist = fs.saveAllFilesBB(banner1Info.getUploadfile());

		member1Svc.updateContents(banner1Info,filelist);

		searchVO.pageCalculate( member1Svc.selectContents1Count(searchVO) ); // startRow, endRow

		List<?> listview  = member1Svc.selectContents1List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);

		return "member1/ContentsList";
	}
	
	@RequestMapping(value = "/ContentsDelete")
	public String ContentsDelete(SearchVO searchVO, 
			HttpServletRequest request, Banner1VO banner1Info, 
			ModelMap modelMap) {

		
		
		member1Svc.ContentsDelete(request.getParameter("sn"));

		

		return "redirect:ContentsList";

	}

	@RequestMapping(value = "/ContentsSave")
	public String ContentsSave(SearchVO searchVO, 
			HttpServletRequest request, Banner1VO banner1Info, 
			ModelMap modelMap) {

		String USERID = "";
		if ( request.getSession().getAttribute("USERID") != null ) {
			USERID = (String)request.getSession().getAttribute("USERID");
		}
		String USERTYPE = "";
		if ( request.getSession().getAttribute("USERTYPE") != null ) {
			USERTYPE = (String)request.getSession().getAttribute("USERTYPE");
		}

		FileUtil fs = new FileUtil();
		List<FileVO> filelist = fs.saveAllFilesBB(banner1Info.getUploadfile());
		member1Svc.insertContents(banner1Info,filelist);

		if ( USERTYPE.equals("CP")) {



			searchVO.setUserid(USERID);

			searchVO.pageCalculate( member1Svc.selectContents12Count(searchVO) ); // startRow, endRow

			List<?> listview  = member1Svc.selectContents12List(searchVO);

			modelMap.addAttribute("listview", listview);
			modelMap.addAttribute("searchVO", searchVO);
			
			
		
		}else {
			searchVO.pageCalculate( member1Svc.selectContents1Count(searchVO) ); // startRow, endRow

			List<?> listview  = member1Svc.selectContents1List(searchVO);

			modelMap.addAttribute("listview", listview);
			modelMap.addAttribute("searchVO", searchVO);
			
			
		}
		
		return "member1/ContentsList";
	}


	@RequestMapping(value = "/ContentsForm")
	public String ContentsForm(SearchVO searchVO, 
			HttpServletRequest request, Banner1VO banner1Info, 
			ModelMap modelMap) {

		String USERID = "";
		if ( request.getSession().getAttribute("USERID") != null ) {
			USERID = (String)request.getSession().getAttribute("USERID");
		}
		String USERTYPE = "";
		if ( request.getSession().getAttribute("USERTYPE") != null ) {
			USERTYPE = (String)request.getSession().getAttribute("USERTYPE");
		}
		if( USERTYPE.equals("CP")) {
		banner1Info.setUserid(USERID);}
		
		modelMap.addAttribute("banner1Info", banner1Info);
		
		return "member1/ContentsForm";
	}

}
