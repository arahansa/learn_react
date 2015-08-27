package demo.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import demo.domain.User;

@Controller
public class HomeController {
	
	
	@RequestMapping("/")
	public String index(@CookieValue(value="userid",defaultValue="0") String login_save,
			@ModelAttribute User user) {
		System.out.println("현재 로그인 세이브 쿠키 :"+login_save);
		if(!login_save.equals("0")){
			user.setId(login_save);
		}
		System.out.println(user);
		return "index";
	}
	
	
	@RequestMapping("/test")
	public void test() {
	}
	
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(User user, @RequestParam(required=false) String rememberId, HttpServletResponse response) {
		if(rememberId!=null){
			System.out.println("사용자 저장!!:"+user);
			Cookie cookie = new Cookie("userid", user.getId());
			cookie.setMaxAge(7*24*60*60);
			response.addCookie(cookie);
		}
		return "redirect:/";
	}
	
	



}
