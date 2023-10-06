package com.njau.controller;

import com.njau.repo.mapper.RoomMapper;
import com.njau.repo.pojo.RoomDO;
import com.njau.repo.pojo.RoomDOKey;
import com.njau.repo.pojo.StaffView;
import com.njau.service.ViewService;
import com.njau.util.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Random;

@Controller
public class ViewController {

    @Autowired
    ViewService viewService;

    @Autowired
    RoomMapper roomMapper;

    @RequestMapping("/findpage")
    String staffView(Model model) {
        ///System.out.println("test....");
        //model.addAttribute(viewService.getAll());
        PageResult pr = new PageResult();
        pr.setContent(viewService.getAll());
        model.addAttribute("pageResult", pr);
        return "clerklist";
    }

//    @ResponseBody
//    @RequestMapping("/test_add")
//    String testAdd() {
//        Random random = new Random();
//        for(int i = 1;i <= 10;i ++) {
//            for(int j = 1;j <= 10;j ++) {
//                for(int k = 1;k <= 10;k ++) {
//                    String id = String.valueOf(j);
//                    if(k < 10) id = id + "0" + String.valueOf(k);
//                    else id = id + String.valueOf(k);
//                    //System.out.println(String.valueOf(i) + ":" + id);
//                    RoomDO roomDO = new RoomDO();
//                    roomDO.setZone(i);
//                    roomDO.setId(id);
//                    roomDO.setArea(28 + random.nextInt(45 - 28));
//                    roomDO.setFloor(j);
//                    roomDO.setUsername(null);
//                    roomDO.setTime(null);
//                    RoomDOKey roomDOKey = new RoomDOKey(i, id);
//                    if(roomMapper.selectByPrimaryKey(roomDOKey) != null) continue;
//                    int rows = roomMapper.insert(roomDO);
//                    System.out.println(rows);
//                }
//            }
//        }
//        return "success";
//    }
}
