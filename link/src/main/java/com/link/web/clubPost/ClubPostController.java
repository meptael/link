package com.link.web.clubPost;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.link.common.Search;
import com.link.service.club.ClubService;
import com.link.service.clubPost.ClubPostService;
import com.link.service.domain.ClubPost;
import com.link.service.domain.Heart;
import com.link.service.domain.Notice;
import com.link.service.domain.Pay;
import com.link.service.domain.User;
import com.link.service.user.UserService;

@Controller
@RequestMapping("/clubPost/*")
public class ClubPostController {

	@Autowired
	@Qualifier("clubPostServiceImpl")
	ClubPostService clubPostServiceImpl;

	@Autowired
	@Qualifier("clubServiceImpl")
	ClubService clubServiceImpl;

	@Autowired
	@Qualifier("userServiceImpl")
	UserService userServiceImpl;
	
	public ClubPostController() {
		System.out.println(getClass() + " default 생성자 호출");
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	

	
///////////////////////////////////////////////////////////////////////////////////// ClubPost /////////////////////////////////////////////////////////////////////////////////////	
	
	
	
	
	
	@RequestMapping(value = "getClubPostList", method = RequestMethod.GET)
	public String getClubPostList(@RequestParam int clubNo, @RequestParam int order, Search search, ClubPost clubPost, Model model, HttpSession session) throws Exception {
		System.out.println("/getClubPostList : GET : 최근 가입한 모임게시물 리스트, 모임게시물 리스트 개수 가져온 후 모임게시물 리스트 화면으로 이동");
		// question : clubNo와 order가 잘 들어온다 왜? RequestParam도 들어오고 Search, ClubPost에도 들어오나?
		// 모임게시물 탭 클릭시 => 최근 가입한 모임의 모임게시물리스트 가져온다

		System.out.println("search : " + search);
		System.out.println("clubPost : " + clubPost);
		System.out.println("order : " + order);
		System.out.println("clubNo : " + clubNo);
		
		search = ClubPostSearchPage.getSearch(order);
		
		// search.order = 0, user_id = 'user03'
		
		//String userId = ((User)session.getAttribute("user")).getUserid();
		User user = new User("user03");
		clubPost.setUser(user);
		model.addAttribute("map", clubPostServiceImpl.getClubPostList(search, clubPost));
		// 모임게시물 리스트 : clubPostList, 모임게시물 리스트 개수 : clubPostListCount
		return "forward:/clubPost/getClubPostList.jsp";
	}
	
	
	
	

	@RequestMapping(value = "addClubPostView", method = RequestMethod.GET)
	public String addClubPostView(@RequestParam int clubNo, Model model) throws Exception {
		System.out.println("/addClubPostView : GET : 모임번호 갖고 모임게시물 등록 화면으로 이동");
		model.addAttribute("clubNo", clubNo);
		return "forward:/clubPost/addClubPostView.jsp";
	}

	@RequestMapping(value = "addClubPost", method = RequestMethod.POST)
	public String addClubPost(@ModelAttribute ClubPost clubPost, Model model, HttpSession session) throws Exception {
		System.out.println("/addClubPost : POST : 모임게시물 등록, 모임원에게 알림, 모임게시물상세보기 가져온 후 모임게시물 상세보기 화면으로 이동");
		//clubPost.setUser((User)session.getAttribute("user"));
		System.out.println(clubPost);
		User user = new User();
		user.setUserId("user02");
		user.setNickName("user02nickName");
		clubPost.setUser(user);
		model.addAttribute("map", clubPostServiceImpl.addClubPost(clubPost));
		return "forward:/clubPost/getClubPost.jsp";
	}

	@RequestMapping(value = "getClubPost", method = RequestMethod.GET)
	public String getClubPost(@ModelAttribute ClubPost clubPost, Search search, Model model) throws Exception {
		System.out.println("/getClubPost : GET : 모임게시물 상세보기, 모임게시물 댓글 리스트 가져온 후 모임게시물 상세보기 화면 또는 수정 화면으로 이동");
		
		search = ClubPostSearchPage.getSearch(0);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("clubPost", clubPost);
		
		model.addAttribute("map", clubPostServiceImpl.getClubPost(map));
		// 모임게시물 상세보기 : getClubPost, 모임게시물 댓글 리스트 : getClubPostCommentList
		return "forward:/clubPost/getClubPost.jsp";
	}

	@RequestMapping(value = "updateClubPostView", method = RequestMethod.POST)
	public String updateClubPostView(@ModelAttribute ClubPost clubPost, Model model, Map<String, Object> map) throws Exception {
		System.out.println("/updateClubPostView : POST : 모임게시물 상세보기 가져온 후 모임게시물 수정 화면으로 이동");
		map.put("clubPost", clubPost);
		model.addAttribute("map", clubPostServiceImpl.getClubPost(map));
		return "forward:/clubPost/updateClubPostView.jsp";
	}

	@RequestMapping(value = "updateClubPost")
	public String updateClubPost(@ModelAttribute ClubPost clubPost, Model model, Heart heart, Map<String, Object> map, HttpSession session) throws Exception {
		System.out.println("/updateClubPost : POST : 모임게시물 수정, 수정된 모임게시물 상세보기 가져온 후 모임게시물 상세보기 화면으로 이동");
		map.put("clubPost", clubPost);
		heart.setSource("2");
		heart.setSourceNo(clubPost.getClubPostNo());
		// session에 있는 userId 가져와서 넣어줘야한다
		//String userId = ((User)session.getAttribute("user")).getUserId();
		heart.setUserId("user04");
		map.put("heart", heart);
		model.addAttribute("map", clubPostServiceImpl.updateClubPost(map));
		return "forward:/clubPost/getClubPost.jsp";
	}

	@RequestMapping(value = "deleteClubPost", method = RequestMethod.POST)
	public String deleteClubPost(@ModelAttribute ClubPost clubPost, Search search, Model model) throws Exception {
		System.out.println("/deleteClubPost : POST : 모임게시물 삭제 flag 처리, 모임게시물 리스트 가져온 후 모임게시물 리스트 화면으로 이동");
		search = ClubPostSearchPage.getSearch(0);
		clubPost.setUser(new User("user02"));
		model.addAttribute("map", clubPostServiceImpl.deleteClubPost(clubPost, search));
		// 모임게시물 리스트 : clubPostList, 모임게시물 리스트 개수 : clubPostListCount
		return "forward:/clubPost/getClubPostList.jsp";
	}
	
	
	
	
///////////////////////////////////////////////////////////////////////////////////// Pay /////////////////////////////////////////////////////////////////////////////////////	
	
	
	
	
	
	@RequestMapping(value = "addPay", method = RequestMethod.POST)
	public String addPay(@ModelAttribute Pay pay, Search search, Model model) throws Exception {
		System.out.println("/addPay : POST : 모임원 최대 수 수정 후 모임원 리스트 화면으로 이동 모임대표만 올 수 있다, 모임번호가 있으면 모임 상세보기, 모임번호가 없으면 모임리스트 화면으로 이동");
		
		//결제추가
		clubPostServiceImpl.addPay(pay);
		
		if(pay.getUpdateClubMemberCount() != 0) {
			// 모임원 업데이트 수가 있다면 모임대표가 가입신청을 클릭 후 이벤트이다 결제 후 모임원리스트 화면으로 이동
			// 모임원 최대수 CLUB_MAX_MEMBER 증가
			model.addAttribute("getClubMemberList", clubServiceImpl.updateClubMember(pay, search));
			return "forward:/club/getClubMemberList.jsp";
		}else {
			// 모임 업데이트 수가 있다면 모임등록 또는 모임가입신청 클릭 후 이벤트이다 결제 후 모임번호가 있다면 모임상세보기 화면으로 모임번호가 없다면 모임리스트 화면으로 이동
			// 모임 최대수 JOIN_CLUB_LIMIT 증가
			userServiceImpl.updateClub(pay);
			
			if(pay.getClubNo() != 0) {
				// 모임상세보기
				model.addAttribute("getClub", clubServiceImpl.getClub(pay.getClubNo()));
				return "forward:/club/getClub.jsp";
			}else {
				// 모임리스트
				model.addAttribute("getClubList", clubServiceImpl.getClubList(search));
				return "forward:/club/getClubList.jsp";
			}
		}
		
	}//end of addPay
	
	
	

	
///////////////////////////////////////////////////////////////////////////////////// Notice /////////////////////////////////////////////////////////////////////////////////////
	
	
	
	
	
	@RequestMapping(value = "addClubNotice", method = RequestMethod.POST)
	public String addClubNotice(@ModelAttribute Search search, Notice notice, Model model) throws Exception {
		System.out.println("/updateClubNotice : POST : 모임공지사항 등록, 등록한 모임공지사항 상세보기, 모임공지사항 리스트");
		return "forward:/clubPost/updateClubPostNoticeView.jsp";
	}
	
	@RequestMapping(value = "getClubNoticeList", method = RequestMethod.POST)
	public String getClubNoticeList(@ModelAttribute Search search, Notice notice, Model model) throws Exception {
		System.out.println("/updateClubNotice : POST : 모임공지사항 리스트");
		clubPostServiceImpl.getClubNoticeList(search, notice);
		return "forward:/clubPost/getClubPostNoticeList.jsp";
	}
	
	@RequestMapping(value = "updateClubNoticeView", method = RequestMethod.POST)
	public String updateClubNoticeView(@ModelAttribute Notice notice, Model model) throws Exception {
		System.out.println("/updateClubNoticeView : POST : 해당 모임공지사항 상세보기, 모임공지사항 수정화면으로 이동");
		model.addAttribute("getClubNotice", clubPostServiceImpl.getClubNotice(notice));
		return "forward:/clubPost/updateClubNoticeView.jsp";
	}
	
	@RequestMapping(value = "updateClubNotice", method = RequestMethod.POST)
	public String updateClubNotice(@ModelAttribute Search search, Notice notice, Model model) throws Exception {
		System.out.println("/updateClubNotice : POST : 모임공지사항 수정, 수정한 모임공지사항 상세보기, 모임공지사항 리스트, 수정한 모임공지사항 리스트 화면으로 이동");
		model.addAttribute("map", clubPostServiceImpl.updateClubNotice(search, notice));
		return "forward:/clubPost/getClubPostNoticeList.jsp";
	}

	@RequestMapping(value = "deleteClubNotice", method = RequestMethod.POST)
	public String deleteClubNotice(@ModelAttribute Search search, Notice notice, Model model) throws Exception {
		System.out.println("/deleteClubNotice : POST : 모임공지사항 삭제, 모임공지사항 리스트");
		// 모임공지사항 리스트 : getClubNoticeList, 모임공지사항 리스트 개수 : getClubNoticeListCount
		model.addAttribute("map", clubPostServiceImpl.deleteClubNotice(search, notice));
		return "forward:/clubPost/getClubPostNoticeList.jsp";
	}

}




