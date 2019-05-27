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
			model.addAttribute("id",dto.getId());
			model.addAttribute("name",dto.getName());
			model.addAttribute("tel1",dto.getTel().substring(0,3));
			model.addAttribute("tel2",dto.getTel().substring(3,7));
			model.addAttribute("tel3",dto.getTel().substring(7,11));
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
		System.out.println("받아온 파일이름" + rhhh.getFile("photoinput"));
		System.out.println(map);
		getImageFile = rhhh.getFile("photoinput");
		
		return "gg";
	}
	@ResponseBody
	@RequestMapping("/imageupload2.kosmo")
	public String nn(@RequestParam Map map,UploadCommand cmd, HttpServletRequest req,MultipartFile file,MultipartHttpServletRequest rhhh)
	{
		System.out.println("받아온 파일이름" + rhhh.getFile("carnumberinput"));
		System.out.println(map);
		getImageFile = rhhh.getFile("carnumberinput");
		
		return "pp";
	}
	
	
	
	@RequestMapping("/Signup.kosmo")
	public String singup(@RequestParam Map map,UploadCommand cmd, MultipartHttpServletRequest rhhh,
			HttpServletRequest req,	
			@RequestParam(required=false) String career,@RequestParam(required=false) String cartype) throws Exception{
		System.out.println("map: " + map);
		
		////파일 업로드 시작
		
		//증명사진 올리는 코드
		MultipartFile ff = getImageFile;
		System.out.println("ff: " + ff);
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

		
		//차량등록증 또는 운전면허증을 올리는 코드
		MultipartFile nn = getImageFile;
		System.out.println("nn:" + nn);
		
		System.out.println("??? ::" + servletContext.getRealPath("/"));
		String phisicalPath2=req.getServletContext().getRealPath("/resources/carnumber");
		System.out.println("phisicalPath:" + phisicalPath2);
		
		String newFileName2=FileUpDownUtils.getNewFileName(phisicalPath2, nn.getOriginalFilename());
		File file2 = new File(phisicalPath2+File.separator+newFileName2);
		System.out.println("carnumber :" + file2.toPath());
		
		nn.transferTo(file2);
		map.put("carnumber", file2.toString());
		
		////파일업로드 끝
		
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
		System.out.println("map:::" + map);
		service.insert(map);
		String email ="";
		email   += 
				"<table style=\"text-align: center;\" width=\"500px\">" + 
				"	<tbody><tr><td>" + 
				"				<a href='http://localhost:8080/baby/emailConfirm.kosmo?email="+map.get("email")+"&authkey="+key+"&id="+map.get("id")+"' target='_blenk'><img alt=\"open_img\" height=\"291px\" src='https://blogfiles.pstatic.net/MjAxOTA1MTdfNyAg/MDAxNTU4MDYzOTc1MDY2.Y2o_m7tgcjPrSmubpJ8fWi101MA6RaV0-_b-33wfLk0g.v24iEcLNwf5li2Y4Fnoga9OhavYh9QQ2GToWV5GNc80g.PNG.yuemj/Aran.png?type=w1'></a>" + 
				"			</td></tr><tr><td>" + 
				"				<p style=\"font-size: 15px; font-stretch: normal; line-height: 1.5; letter-spacing: normal;color: #333333; word-break: keep-all; margin-bottom: 30px;\">아란 회원가입을 위해서 이메일 인증이 필요합니다.</p>" + 
				"				<p style=\"font-size: 15px; font-stretch: normal; line-height: 1.5; letter-spacing: normal;color: #333333; word-break: keep-all; margin-bottom: 30px;\">위의 이미지를 클릭하면 인증이 완료됩니다.\r\n</p>" + 
				"			</td></tr><tr><td>" + 
				"</table>";
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("아란 회원가입 이메일 인증");
		sendMail.setText(email);
		sendMail.setFrom("admin@Aran.com", "아란관리자");
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
