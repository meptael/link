package com.link.web.myHome;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.link.common.Search;
import com.link.service.club.ClubService;
import com.link.service.clubPost.ClubPostService;
import com.link.service.domain.Club;
import com.link.service.domain.Feed;
import com.link.service.domain.Heart;
import com.link.service.domain.User;
import com.link.service.feed.FeedService;
import com.link.service.myHome.MyHomeService;
import com.link.service.user.UserService;

@Controller
@SessionAttributes("user")
@RequestMapping("/myHome/*")
public class MyHomeController {
	
	@Autowired
	@Qualifier("myHomeServiceImpl")
	private MyHomeService myHomeService;
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	@Autowired
	@Qualifier("feedServiceImpl")
	private FeedService feedService;
	@Autowired
	@Qualifier("clubServiceImpl")
	private ClubService clubService;
	@Autowired
	@Qualifier("clubPostServiceImpl")
	private ClubPostService clubPostService;
	
	public MyHomeController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass() + " default constructor");
	}
	
	@RequestMapping(value = "getMyHome")
	public String getMyHome(@ModelAttribute Search search, Heart heart, User user,  Club club,
			@RequestParam("userId")String userId, @RequestParam("clubNo") int clubNo, Model model) throws Exception{
		
		System.out.println("/myHome/getMyHome : GET");

		user.setUserId(userId);
		user = userService.getUser(user);
		club = clubService.getClub(club.getClubNo());
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("search", search);
		map = feedService.getFeedList(map);
		
		model.addAttribute("user", user);
		model.addAttribute("club", club);
		model.addAttribute("search", search);
		model.addAttribute("feedList", map.get("feedList"));
	
		return "forward:/myHome/getMyHome.jsp";
	}  
	@RequestMapping(value = "getProfile", method = RequestMethod.GET)
	public String getProfile(@RequestParam("userId")String userId,Model model, HttpSession httpSession) throws Exception{
		
		System.out.println("/myHome/getProfile : GET");
		User user = new User();
		user.setUserId(userId);
    	user = userService.getUser(user);
		model.addAttribute("user", user);
		
		return "forward:/myHome/getProfile.jsp";
		
	}
	@RequestMapping(value = "updateProfile", method = RequestMethod.GET)
	public String updateProfile(@RequestParam("userId") String userId, Model model) throws Exception{
		
		System.out.println("/myHome/updateProfile : GET");
		
		User user = new User();
		user = userService.getUser(user);
		model.addAttribute("user", user);
		
		return "forward:/myHome/updateProfile.jsp";
	
	}
	@RequestMapping(value = "updateProfile", method = RequestMethod.POST)
	public String updateProfile(@ModelAttribute("user") User user, Model model, HttpSession session) throws Exception{
		
		System.out.println("/myHome/updateProfile : POST");
		
		userService.updateUser(user);
		user = userService.getUser(user);
		String sessionId = ((User)session.getAttribute("user")).getUserId();
		
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}
		
		
		return "redirect:/myHome/getProfile?userId="+user.getUserId();
  
}
	@RequestMapping(value ="/updateMyHomeOpenCondition", method = RequestMethod.POST)
	public String updateMyHomeOpenCondition(@ModelAttribute("user")User user, Model model, HttpSession session)
	          throws Exception{
		System.out.println("/user/updateMyHomeOpenCondition : POST");
		
		myHomeService.updateMyHomeOpenCondition(user);
		user = userService.getUser(user);
		String sessionId = ((User)session.getAttribute("user")).getUserId();
		
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}
		
		
		return "redirect:/myHome/getMyHome?userId="+user.getUserId();
		
	}
	
	@RequestMapping(value ="/updateMyHomePushCondition", method = RequestMethod.POST)
	public String updateMyHomePushCondition(@ModelAttribute("user")User user, Model model, HttpSession session)
	          throws Exception{
		System.out.println("/user/updateMyHomePushCondition : POST");
		
		myHomeService.updateMyHomePushCondition(user);
		user = userService.getUser(user);
		String sessionId = ((User)session.getAttribute("user")).getUserId();
		
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}
		
		
		return "redirect:/myHome/getMyHome?userId="+user.getUserId();
		
	}
	@RequestMapping(value = "getFollowList", method = RequestMethod.GET)
	public String getFollowList() throws Exception{
		
		System.out.println("/myHome/getFollowList : GET");
	
		
		return "forward:/myHome/getFollowList.jsp";
	
	}
}



