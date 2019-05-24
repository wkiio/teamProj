package com.kosmo.baby.service.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.baby.service.HospitalDTO;
import com.kosmo.baby.service.KizcafeDTO;
import com.kosmo.baby.service.ReviewDTO;
import com.kosmo.baby.service.impl.HospitalServiceimpl;
import com.kosmo.baby.service.impl.KizcafeServiceimpl;
import com.kosmo.baby.service.impl.ReviewServiceimpl;

@Controller
public class HospitalController {
   //서비스 주입
   @Resource(name="hospitalServiceimpl")
   private HospitalServiceimpl hospitalservice;
   
   @Resource(name="kizcafeServiceimpl")
   private KizcafeServiceimpl kizcafeservice;
   
   @Resource(name="reviewServiceimpl")
   private ReviewServiceimpl reviewservice;
   

   //여기에 리퀘스트 맵핑 하셔서 작업하시면 됩니다.   
   @RequestMapping("/daum.kosmo")
   public String baby_admin(@RequestParam Map map,Model model,Authentication auth) {
      List<HospitalDTO> hospitals1 = new Vector<HospitalDTO>();
      hospitals1 = hospitalservice.selectList(map);
      List<Map> collections1 = new Vector<Map>();
      
      for(HospitalDTO dto : hospitals1) {
         Map recode = new HashMap();
         recode.put("h_no", dto.getH_no());
         recode.put("name", dto.getName());
         recode.put("tel",dto.getTel());
         recode.put("addr",dto.getAddr());
         recode.put("mon",dto.getMon());
         recode.put("tue", dto.getTue());
         recode.put("wed",dto.getWed());
         recode.put("thu",dto.getThu());
         recode.put("fri",dto.getFri());
         recode.put("sat",dto.getSat());
         recode.put("sun",dto.getSun());
         recode.put("holiday",dto.getHoliday());
         recode.put("emergency",dto.getEmergency());
         recode.put("code",dto.getCode());
         recode.put("x",dto.getX());
         recode.put("y",dto.getY());
         collections1.add(recode);
      }
      model.addAttribute("emer",JSONArray.toJSONString(collections1));
      
      UserDetails user = (UserDetails)auth.getPrincipal();
      model.addAttribute("reviewId",user.getUsername() );
      System.out.println("gg:" + JSONArray.toJSONString(collections1));
      System.out.println("dasdasdasdasdasdasd");
      return "daum.tiles";
   }
   
   
   @ResponseBody
   @RequestMapping(value="/sendCategory.kosmo" , produces="text/html; charset=UTF-8")
   public String category(@RequestParam Map map, Model model) {
	  System.out.println("머들어오냐"+map);
      System.out.println(map.get("category"));
      if (
         map.get("category").equals("MT1") || 
         map.get("category").equals("BK9") || 
         map.get("category").equals("PM9") || 
         map.get("category").equals("OL7")
         ) {
         List<HospitalDTO> objects = new Vector<HospitalDTO>();
         if (map.get("category").equals("MT1")) {
            objects = hospitalservice.selectEmer(map);
         } else if (map.get("category").equals("BK9")) {
            objects = hospitalservice.selectHos(map);
         } else if (map.get("category").equals("PM9")) {
            objects = hospitalservice.selectdent(map);
         } else if (map.get("category").equals("OL7")) {
            objects = hospitalservice.selectOb(map);
         }
         List<Map> collections = new Vector<Map>();
         for (HospitalDTO dto : objects) {
            Map recode = new HashMap();
            recode.put("h_no", dto.getH_no());
            recode.put("name", dto.getName());
            recode.put("tel", dto.getTel());
            recode.put("addr", dto.getAddr());
            recode.put("mon", dto.getMon());
            recode.put("tue", dto.getTue());
            recode.put("wed", dto.getWed());
            recode.put("thu", dto.getThu());
            recode.put("fri", dto.getFri());
            recode.put("sat", dto.getSat());
            recode.put("sun", dto.getSun());
            recode.put("holiday", dto.getHoliday());
            recode.put("emergency", dto.getEmergency());
            recode.put("code", dto.getCode());
            recode.put("x", dto.getX());
            recode.put("y", dto.getY());
            collections.add(recode);
            
         }
         return JSONArray.toJSONString(collections);
      }
      
      else {
         List<KizcafeDTO> objects = new Vector<KizcafeDTO>();
         objects = kizcafeservice.selectList(map);
         List<Map> collections = new Vector<Map>();
         for (KizcafeDTO dto : objects) {       	 
            Map recode = new HashMap();
            recode.put("k_no",dto.getK_no());
            recode.put("name", dto.getName());
            recode.put("tel", dto.getTel()==null?"":dto.getTel());
            recode.put("addr", dto.getAddr());
            map.put("k_no", dto.getK_no());
            int count = reviewservice.count(map);
            List<ReviewDTO> redto = reviewservice.selectScore(map);
            int score,value,realscore = 0;
            for (ReviewDTO a : redto) {
           	System.out.println("지금까지 한 점수 : "+Integer.parseInt(a.getScore()));
    			score = Integer.parseInt(a.getScore());
    			realscore += score;
            }
            if(!(count == 0 || realscore == 0)) {
        		value = realscore/count;
        		String star = "";
                switch(value) {
                case 1 : star = "★☆☆☆☆☆☆☆☆☆"; break;
                case 2 : star = "★★☆☆☆☆☆☆☆☆"; break;
                case 3 : star = "★★★☆☆☆☆☆☆☆"; break;
                case 4 : star = "★★★★☆☆☆☆☆☆"; break;
                case 5 : star = "★★★★★☆☆☆☆☆"; break;
                case 6 : star = "★★★★★★☆☆☆☆"; break;
                case 7 : star = "★★★★★★★☆☆☆"; break;
                case 8 : star = "★★★★★★★★☆☆"; break;
                case 9 : star = "★★★★★★★★★☆"; break;
                case 10 : star = "★★★★★★★★★★"; break;
                }
        		recode.put("score",star);
        		}
        	else  { 
        		recode.put("score","리뷰 기록이 없습니다"); 
        		} 
            collections.add(recode);
         }
 
         System.out.printf("bbbbbbbb"+JSONArray.toJSONString(collections));
         return JSONArray.toJSONString(collections);
      }
   }
   
   @ResponseBody
   @RequestMapping(value="/reviewcontent.kosmo",produces="text/html; charset=UTF-8")
   public String review(@RequestParam Map map, Model model) {
	   List<KizcafeDTO> objects = new Vector<KizcafeDTO>();
       objects = kizcafeservice.selectreview(map);
       List<Map> collections = new Vector<Map>();
       for (KizcafeDTO dto : objects) {       	 
          Map recode = new HashMap();
          recode.put("addr",dto.getAddr());
          recode.put("content", dto.getContent());
          recode.put("id", dto.getId());
          recode.put("k_no", dto.getK_no());
          recode.put("k_no_1", dto.getK_no_1());
          recode.put("name", dto.getName());
          recode.put("rv_no", dto.getRv_no());
          recode.put("score", dto.getScore());
          recode.put("tel", dto.getTel()==null?"":dto.getTel());
          recode.put("title", dto.getTitle());

          collections.add(recode);
       }

       System.out.printf("ccccccccc"+JSONArray.toJSONString(collections));
       return JSONArray.toJSONString(collections);
      }
   }
   
