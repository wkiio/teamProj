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
import com.kosmo.baby.service.impl.HospitalServiceimpl;
import com.kosmo.baby.service.impl.KizcafeServiceimpl;

@Controller
public class HospitalController {
   //서비스 주입
   @Resource(name="hospitalServiceimpl")
   private HospitalServiceimpl hospitalservice;
   
   @Resource(name="kizcafeServiceimpl")
   private KizcafeServiceimpl kizcafeservice;
   

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
            collections.add(recode);
         }
         return JSONArray.toJSONString(collections);
      }
   }
}