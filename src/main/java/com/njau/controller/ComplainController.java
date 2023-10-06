package com.njau.controller;

import com.njau.domain.query.ComplainRequest;
import com.njau.domain.vo.ComplainVO;
import com.njau.repo.mapper.ComplainMapper;
import com.njau.repo.mapper.RoomMapper;
import com.njau.repo.pojo.*;
import com.njau.service.ComplainService;
import com.njau.service.RoomService;
import com.njau.service.StaffService;
import com.njau.util.DateTimeUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class ComplainController {
    @Autowired
    ComplainMapper complainMapper;

    @Autowired
    ComplainService complainService;
    @Autowired
    private StaffService staffService;
    @Autowired
    private RoomService roomService;
    @Autowired
    private RoomMapper roomMapper;

    @RequestMapping("/complain")
    public String complain(Model model) {
        List<ComplainDO> list = complainMapper.selectByExample(new ComplainExample());
        model.addAttribute("complainlist", toVo(list));
        return "complain";
    }

    @RequestMapping("/complainstate")
    public String complainState(Model model, String state) {
        ComplainExample example = new ComplainExample();
        example.createCriteria().andStateEqualTo(Byte.valueOf(state));
        List<ComplainDO> list = complainMapper.selectByExample(example);
        model.addAttribute("complainlist", toVo(list));
        return "complain";
    }

    //职工点击处理按钮调用
    @GetMapping("/complainHandle")
    public String complainHandle(@RequestParam("id") Integer id, HttpServletRequest request, Model model) {
        System.out.println(id);
        HttpSession session = request.getSession();
        String username = session.getAttribute("username").toString();
        complainService.setStateAndTimeById(id, username, new Date());
        List<ComplainDO> list = complainMapper.selectByExample(new ComplainExample());
        model.addAttribute("complainlist", toVo(list));
        return "complain";
    }

    @RequestMapping("/addcomplaint")
    public String addComplaint() {
        return "addonecomplain";
    }

    @RequestMapping("/savecomplain")
    public String savecComplain(ComplainRequest request, HttpServletRequest httpRequest) {
        HttpSession session = httpRequest.getSession();
        ComplainDO complainDO = new ComplainDO();
        complainDO.setContent(request.getContent());
        complainDO.setType(request.getType());
        complainDO.setSubmitTime(new Date());
        complainDO.setState((byte) 0);
        String username = session.getAttribute("username").toString();
        RoomDO room = roomService.findByUsername(username);
        complainDO.setRoomId(room.getId());
        complainDO.setZone(room.getZone());
        complainMapper.insertSelective(complainDO);
        return "addonecomplain";
    }

    @RequestMapping("/mycomplaint")
    public String mycomplaint(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String username = session.getAttribute("username").toString();

        RoomExample roomExample = new RoomExample();
        roomExample.createCriteria().andUsernameEqualTo(username);
        List<RoomDO> rooms = roomMapper.selectByExample(roomExample);

        ComplainExample example = new ComplainExample();
        for (RoomDO room : rooms) {
            example.or().andZoneEqualTo(room.getZone()).andRoomIdEqualTo(room.getId());
        }

        List<ComplainDO> list = complainMapper.selectByExample(example);
        model.addAttribute("mycomplaintlist", toVo(list));
        return "mycomplaint";
    }

    private List<ComplainVO> toVo(List<ComplainDO> list) {
        return list.stream()
                .map(complainDO -> {
                    ComplainVO vo = new ComplainVO();
                    BeanUtils.copyProperties(complainDO, vo);
                    RoomDOKey pk = new RoomDOKey();
                    pk.setId(vo.getRoomId());
                    pk.setZone(complainDO.getZone());
                    UserDO userDO = roomService.findByRoom(pk);
                    vo.setName(userDO.getName());
                    if (complainDO.getStaffUsername() != null) {
                        DepartmentDO department = staffService.findDepartmentByUsername(complainDO.getStaffUsername());
                        vo.setDepartment(department.getDeptName());
                    } else {
                        vo.setDepartment("-");
                    }
                    return vo;
                }).collect(Collectors.toList());
    }
}
