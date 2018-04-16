package com.example.studentManager.controller;

import com.example.studentManager.repos.LeaveDao;
import com.example.studentManager.domain.Leave;
import com.example.studentManager.domain.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;


@Controller
@RequestMapping("leave")
public class LeaveController {
	
	@Autowired
	private LeaveDao leaveDao;
	
	//辅导员查看请假列表
	@RequestMapping("teacher/list")
	public String teacherList(HttpSession session, Model model) {
		Iterable<Leave> list = leaveDao.findAll();
		model.addAttribute("list", list);
		return "leave/list";
	}
	
	//学生查看请假列表
	@RequestMapping("stu/list")
	public String stuList(HttpSession session, Model model) {
		Student student = (Student) session.getAttribute("loginUser");
		Iterable<Leave> list = leaveDao.findAllBySid(student.getId());
		model.addAttribute("list", list);
		return "leave/stuList";
	}
	
	//学生删除请假记录
	@RequestMapping("delete")
	public String delete(Leave leave, Model model) {
		leaveDao.delete(leave);
		return "redirect:/leave/stu/list";
	}
	
	//学生新增请假记录
	@RequestMapping("stu/add")
	public String add(Leave leave, Model model) {
		return "leave/add";
	}
	
	//学生新增请假记录
	@RequestMapping("save")
	public String save(Leave leave) {
		leaveDao.save(leave);
		return "redirect:/leave/stu/list";
	}
	
	//学生修改请假记录
	@RequestMapping("edit")
	public String edit(Leave nleave, Model model) {
		Optional<Leave> leave = leaveDao.findById(nleave.getId());
		model.addAttribute("l", leave);
		return "leave/edit";
	}
	
	//学生更新请假记录
	@RequestMapping("update")
	public String update(Leave leave) {
		leaveDao.save(leave);
		return "redirect:/leave/stu/list";
	}
	
	//辅导员修改请假状态
	@RequestMapping("check")
	public String check(Leave leave, Model model) {
		leaveDao.save(leave);
		return "redirect:/leave/teacher/list";
	}
	
}
