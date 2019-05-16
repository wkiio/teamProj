package com.kosmo.baby.service.web;

import java.io.File;
import java.io.InputStream;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.text.Document;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.ResourceLoader;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.baby.HomeController;
import com.kosmo.baby.command.FileUpDownUtils;
import com.kosmo.baby.command.UploadCommand;
import com.kosmo.baby.service.MailHandler;
import com.kosmo.baby.service.MembersDTO;
import com.kosmo.baby.service.TempKey;
import com.kosmo.baby.service.impl.MembersServiceimpl;





@Controller
public class MembersController {
	
	private static final Logger logger = LoggerFactory.getLogger(MembersController.class);
	
	@Autowired 
	private ResourceLoader resourceLoader;
		
	MultipartFile getImageFile;
	
	@Inject
	private JavaMailSender mailSender;
	
	@Autowired
	ServletContext servletContext;
	
	
	//서비스 주입
	@Resource(name="membersServiceimpl")
	private MembersServiceimpl service;
	
	@Resource(name="fileUpDownUtils")
	private FileUpDownUtils fileUpDownUtils;
	
	@Resource(name="uploadCommand")
	private UploadCommand uploadCommand;
	
	
	
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
		
		boolean flag = service.mypageCheck(map);
		
		
		if(flag) {
			MembersDTO dto = service.selectOne(map);
			//System.out.println(dto.getId());
			model.addAttribute("id",dto.getId());
			model.addAttribute("name",dto.getName());
			//System.out.println(dto.getName());
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
	
	@ResponseBody
	@RequestMapping("/imageupload.kosmo")
	public String ss(@RequestParam Map map,UploadCommand cmd, HttpServletRequest req,MultipartFile file,MultipartHttpServletRequest rhhh)
	{
		System.out.println("받아온 파일이름" + map.get("photoinput"));
		System.out.println(map);
		getImageFile = rhhh.getFile("photoinput");
		
	
		
		return "gg";
	}
	
	
	
	@RequestMapping("/Signup.kosmo")
	public String singup(@RequestParam Map map,UploadCommand cmd, MultipartHttpServletRequest rhhh,
			HttpServletRequest req,	
			@RequestParam(required=false) String career,@RequestParam(required=false) String cartype) throws Exception{
		
		
		
		MultipartFile ff = getImageFile;
		System.out.println("ff: " + ff);
		
		//Set pathSet = req.getSession().getServletContext().getResourcePaths("/resources");
		
		//System.out.println(pathSet);
		
		//System.out.println("한지민?"+req.getSession().getServletContext().getResource("/resources/한지민.jpg").getPath());
		

		//System.out.println(resourceLoader.getResource("classpath:config.properties").getURI().getPath()); 

	//	System.out.println(resourceLoader.getResource("resources/css/style.css").getURI().getPath());
		
		
		//String imagePath = req.getSession().getServletContext().getRealPath("");
		
		//경로찾기
		System.out.println("??? ::" + servletContext.getRealPath("/"));
		String phisicalPath=req.getServletContext().getRealPath("/resources/memberPhoto");
		System.out.println("phisicalPath:" + phisicalPath);
		
		//2]File객체 생성
		//2-1] 파일 중복시 이름 변경
		//String ffff = "C:\\Users\\CSJ\\git\\teamProj1\\KOSMO_Proj\\src\\main\\webapp\\resources\\memberPhoto";
		String newFileName=FileUpDownUtils.getNewFileName(phisicalPath, ff.getOriginalFilename());
		File file = new File(phisicalPath+File.separator+newFileName);
		System.out.println("vxcbdfg:" + file.toPath());
		//3]업로드 처리		
		ff.transferTo(file);
		
		map.put("photo", file.toString() );
		
		
		//파일업로드 끝
		
		//telfront는 010, 011같은 selectbox
		//telback은 유저가 입력한 전화번호
		map.put("tel", map.get("telfront").toString()+map.get("telback"));
		System.out.println();
		
		//프로토콜
		//addr0는 우편번호, addr1은 기본주소 , addr2는 상세주소입니다
		//예를들어 우편번호가 010101, 기본주소가 서울시, 상세주소가 가산동이라면 010101:!:서울시;!@가산동 으로 DB에 들어갑니다
		//이후 꺼낼때는 해당 :!:과 ;!@를 기준으로 split를 하시면됩니다.
		map.put("addr",map.get("addr0") + ":!:" + map.get("addr1") + ";!@" + map.get("addr2"));
		//System.out.println("이름 : "+map.get("name"));
		//System.out.println("주소 : "+map.get("addr"));
		
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
		//System.out.println("깐트롤러");
		//System.out.println(map.get("id"));
		String check = service.idCheck(map);
		//System.out.println("check: " + check);
		return check;
	}
	
	@RequestMapping("/findId.kosmo")
	public String findId(@RequestParam Map map,Model model) throws Exception{
		System.out.println("아이디를 찾는 메소드로 들어왔다.");
		service.findId(map);
		boolean flag = service.findId(map)==null ? false : true;
		if(flag){
			MembersDTO dto = service.findId(map);
			model.addAttribute("id",dto.getId());
			System.out.println("찾는 유저의 아이디는 : "+dto.getId());
			
		}
		else {
			model.addAttribute("findError","찾는 유저가 없습니다!");
		}
		return "findidresult.tiles";
	}
	
	@RequestMapping("/findPwd.kosmo")
	public String findPwd(@RequestParam Map map,Model model) throws Exception{
		System.out.println("비밀번호를 찾는 메소드로 들어왔다.");
		service.findPwd(map);
		boolean flag = service.findPwd(map)==null ? false : true;
		if(flag){
			MembersDTO dto = service.findPwd(map);
			model.addAttribute("name",dto.getName());
			model.addAttribute("pwd",dto.getPwd());
			System.out.println(dto.getName() + "의 비밀번호는 : "+dto.getPwd());
			
		}
		else {
			model.addAttribute("findError","찾는 유저가 없습니다!");
		}
		return "findidresult.tiles";
	}
}
