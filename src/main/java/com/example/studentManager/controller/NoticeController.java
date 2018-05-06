package com.example.studentManager.controller;

import com.example.studentManager.repos.NoticeDao;
import com.example.studentManager.domain.Notice;
import com.example.studentManager.domain.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("notice")
public class NoticeController {
	
	@Autowired
	private NoticeDao noticeDao;
	
	//辅导员通知列表
	@RequestMapping("list")
	public String list(Model model) {
		Iterable<Notice> list = noticeDao.findAll();
		model.addAttribute("list", list);
		return "notice/list";
	}
	
	//学生通知列表
	@RequestMapping("stu/list")
	public String stuList(Model model) {
		Iterable<Notice> list = noticeDao.findAll();
		model.addAttribute("list", list);
		return "notice/stuList";
	}
	
	//新增通知
	@RequestMapping("add")
	public String add() {
		return "notice/add";
	}
	@RequestMapping("save")
	public String save(Notice notice, HttpSession session) {
		notice.setPublishtime(new Date());
		Teacher teacher = (Teacher) session.getAttribute("loginUser");
		notice.setTid(teacher.getId());
		notice.setTname(teacher.getTruename());
		noticeDao.save(notice);
		return "redirect:/notice/list";
	}
	
	//修改通知
	@RequestMapping("edit")
	public String edit(Notice notice, Model model) {
		Optional<Notice> notice1 = noticeDao.findById(notice.getId());
		model.addAttribute("n", notice1);
		return "notice/edit";
	}
	@RequestMapping("update")
	public String update(Notice notice, HttpServletRequest request) {
		String t = request.getParameter("t");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			notice.setPublishtime(sdf.parse(t));
		} catch (ParseException e) {
			notice.setPublishtime(new Date());
		}
		noticeDao.save(notice);
		return "redirect:/notice/list";
	}
	
	//删除通知
	@RequestMapping("delete")
	public String delete(Notice notice) {
		noticeDao.delete(notice);
		return "redirect:/notice/list";
	}
	
}
