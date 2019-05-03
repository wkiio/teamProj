package com.kosmo.baby.service.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.baby.service.MailHandler;
import com.kosmo.baby.service.MembersDTO;
import com.kosmo.baby.service.TempKey;
import com.kosmo.baby.service.impl.MembersServiceimpl;

@Controller
public class MembersController {
	
	@Inject
	private JavaMailSender mailSender;
	
	
	//서비스 주입
	@Resource(name="membersServiceimpl")
	private MembersServiceimpl service;
	/*
	 * 시큐리티 적용 전 메소드
	@RequestMapping("/Login.kosmo")
	public String isMember(@RequestParam Map map, HttpSession session, Model model) throws Exception {
		boolean flag = service.isMember(map);
		if (flag) { // 아이디 비밀번호를 체크한다.
			session.setAttribute("id", map.get("id")); // true로 들어오면 세션영역에 아이디 저장
			if (map.get("id").equals("admin")) { // 들어온 아이디가 admin이라면
				model.addAttribute("adminlogin","관리자로 로그인 하셨습니다.");
				return "/admin_page/admin_index"; // 관리자 페이지로 보낸다
			} //관리자 여부 로그인 if
			
			else { // 들어온 아이디가 일반회원이라면
				model.addAttribute("memberslogin",map.get("name")+" 님. 어서오세요");
				return "index.tiles"; //인덱스로 보낸다
			} //일반회원 로그인 else
		} //flag if문
		
		
		else { // 아이디 비밀번호가 틀렸을경우
			model.addAttribute("loginfail","아이디와 비밀번호가 다릅니다."); 
			return "login_page.tiles"; //로그인페이지로 다시 보냄
		}
		
	}
	*/
	//마이페이지 전용
	@RequestMapping("/loginout.kosmo")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "index.tiles";
	}
	
	@RequestMapping("/mypageCheck.kosmo")
	public String mypaggCheck(@RequestParam Map map, Authentication auth, Model model) throws Exception{
		UserDetails user = (UserDetails)auth.getPrincipal();
		map.put("id", user.getUsername());
		System.out.println(user.getUsername());
		boolean flag = service.mypageCheck(map);
		System.out.println(flag);
		if(flag) {
			MembersDTO dto = service.selectOne(map);
			System.out.println(dto.getId());
			model.addAttribute("id",dto.getId());
			model.addAttribute("name",dto.getName());
			System.out.println(dto.getName());
			model.addAttribute("tel",dto.getTel());
			model.addAttribute("email1",dto.getEmail().split("@")[0].trim());
			model.addAttribute("email2",dto.getEmail().split("@")[1].trim());
			model.addAttribute("addr",dto.getAddr());
			model.addAttribute("addr0",dto.getAddr().split(":!:")[0].trim());
			model.addAttribute("addr1",dto.getAddr().split(":!:")[1].split(";!@")[0].trim());
			model.addAttribute("addr2",dto.getAddr().split(";!@")[1].trim());
			
			model.addAttribute("partnerstatus",dto.getPartnerstatus());
			return "mypage_two.tiles";
		}
		else {
			model.addAttribute("error","비번틀려");
			return "mypage_one.tiles";
		}
			
		
	}
	
	
	
	
	
	@RequestMapping("/Signup.kosmo")
	public String singup(@RequestParam Map map,
			@RequestParam(required=false) String career,@RequestParam(required=false) String cartype) throws Exception{
		
		//telfront는 010, 011같은 selectbox
		//telback은 유저가 입력한 전화번호
		map.put("tel", map.get("telfront").toString()+map.get("telback"));
		
		//프로토콜
		//addr0는 우편번호, addr1은 기본주소 , addr2는 상세주소입니다
		//예를들어 우편번호가 010101, 기본주소가 서울시, 상세주소가 가산동이라면 010101:!:서울시;!@가산동 으로 DB에 들어갑니다
		//이후 꺼낼때는 해당 :!:과 ;!@를 기준으로 split를 하시면됩니다.
		map.put("addr",map.get("addr0") + ":!:" + map.get("addr1") + ";!@" + map.get("addr2"));
		System.out.println("이름 : "+map.get("name"));
		System.out.println("주소 : "+map.get("addr"));
		
		//인증키 만들기
		String key =new TempKey().getKey(20, false);
		map.put("authkey", key);
			
		service.insert(map);
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("육아육아해사이트 회원가입 이메일 인증");
		sendMail.setText(
					new StringBuffer().append("<h1>육아육아해사이트 회원가입 이메일 인증 : "+map.get("id")+"님</h1>").append("<a href='http://localhost:8080/baby/emailConfirm.kosmo?email=").append(map.get("email").toString()).append("&authkey=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("csj910226@gmail.com", "육아육아해");
		sendMail.setTo(map.get("email").toString());
		sendMail.send();
		
		return "signup_after.tiles";
	}
	
	@RequestMapping("/emailConfirm.kosmo")
	public String emailConfirm(@RequestParam Map map) throws Exception{
		service.emailConfirm(map);
		return "signup_OK.tiles";
	}
	
	@ResponseBody
	@RequestMapping("/idCheck.kosmo")
	public String idCheck(@RequestParam Map map, HttpSession session) throws Exception{
		System.out.println("깐트롤러");
		System.out.println(map.get("id"));
		String check = service.idCheck(map);
		System.out.println("check: " + check);
		return check;
	}
}
