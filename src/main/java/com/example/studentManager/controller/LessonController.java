package com.example.studentManager.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.example.studentManager.repos.LessonDao;
import com.example.studentManager.domain.Lesson;
import com.example.studentManager.domain.StuLesson;
import com.example.studentManager.domain.Student;
import com.example.studentManager.repos.StudentLessonDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("lesson")
public class LessonController {
	
	@Autowired
	private LessonDao lessonDao;

	@Autowired
	private StudentLessonDao studentLessonDao;
	//查询教师的课程
	@RequestMapping("teacher/list")
	public String list(HttpSession session, Model model) {
		Long tid = (Long) session.getAttribute("uid");
		Iterable<Lesson> list = lessonDao.findAllByTid(tid);
		model.addAttribute("list", list);
		return "lesson/list";
	}
	
	//学生查询所有课程
	@RequestMapping("stu/list")
	public String stuList(HttpSession session, Model model) {
		Iterable<Lesson> list = lessonDao.findAll();
		model.addAttribute("list", list);
		return "lesson/stuList";
	}
	
	//学生选择课程
	@RequestMapping("learn")
	public String learn(StuLesson stuLesson, HttpSession session, Model model) {
		Optional<StuLesson> s = studentLessonDao.findStuLessonByLidAndSid(stuLesson.getLid(), stuLesson.getSid());
		if (s == null) {
			studentLessonDao.save(stuLesson);
			model.addAttribute("msg", "   您好，您已成功选择" + stuLesson.getLname() + "课程");
		} else {
			model.addAttribute("msg", "   对不起，您已选择过该课程，请不要重复选择，谢谢！");
		}
		Iterable<StuLesson> list = studentLessonDao.findStuLessonBySid(stuLesson.getSid());
		model.addAttribute("list", list);
		return "lesson/stuList";
	}
	
	//学生查询自己课程
	@RequestMapping("stu/own")
	public String stuOwn(HttpSession session, Model model) {
		Integer sid = (Integer) session.getAttribute("uid");
		Iterable<StuLesson> list = studentLessonDao.findStuLessonBySid(sid);
		model.addAttribute("list", list);
		return "lesson/own";
	}
	
	//学生取消课程
	@RequestMapping("cancel")
	public String cancel(StuLesson stuLesson) {
        studentLessonDao.delete(stuLesson);
		return "redirect:/lesson/stu/own";
	}
	
	//查询教师的课程
	@RequestMapping("edit")
	public String edit(Lesson lesson, Model model) {
		model.addAttribute("l", lesson);
		return "lesson/edit";
	}

	@RequestMapping("update")
	public String update(Lesson lesson) {
		lessonDao.save(lesson);
		return "redirect:/lesson/teacher/list";
	}
	
	//新增课程信息
	@RequestMapping("add")
	public String add() {
		return "lesson/add";
	}
	@RequestMapping("save")
	public String save(Lesson lesson) {
		lessonDao.save(lesson);
		return "redirect:/lesson/teacher/list";
	}
	
	//删除教师的课程
	@RequestMapping("delete")
	public String delete(Lesson lesson) {
		lessonDao.delete(lesson);
		return "redirect:/lesson/teacher/list";
	}
	
	//查看选择该课程的学生
	@RequestMapping("chosed")
	public String chosed(Lesson lesson, Model model) {
		Iterable<StuLesson> list = studentLessonDao.findStuLessonByLid(lesson.getId());
		model.addAttribute("list", list);
		return "lesson/chosed";
	}
	
	//设置课程分数
	@RequestMapping("setScore")
	@ResponseBody
	public String setScore(StuLesson stuLesson, Model model) {
		studentLessonDao.save(stuLesson);
		return "1";
	}
	
	/*//查看课程成绩统计
	@RequestMapping("showLesson")
	public String showLesson(StuLesson stuLesson, Model model) {
		stuLesson = lessonDao.getStuLessonByLid(stuLesson.getLid());
		model.addAttribute("stuLesson", stuLesson);
		return "lesson/showCourse";
	}
	
	@RequestMapping("getData")
	@ResponseBody
	public String getData(StuLesson stuLesson) {
		List<StuLesson> list = lessonDao.getChosed(stuLesson.getLid());
		int i1 = 0;
		int i2 = 0;
		int i3 = 0;
		int i4 = 0;
		int i5 = 0;
		for(StuLesson s:list) {
			if (s.getScore() < 60) {
				i1++;
			} else if (s.getScore() <= 70) {
				i2++;
			} else if (s.getScore() <= 80) {
				i3++;
			} else if (s.getScore() <= 90) {
				i4++;
			} else {
				i5++;
			}
		}
		
		JSONArray jsonArray = new JSONArray();
		
		int[] arr1 = new int[1];
		arr1[0] = i1;
		JSONObject j1 = new JSONObject();
		j1.put("name", "<60");
		j1.put("data", arr1);
		jsonArray.add(j1);
		
		int[] arr2 = new int[1];
		arr2[0] = i2;
		JSONObject j2 = new JSONObject();
		j2.put("name", "60-70");
		j2.put("data", arr2);
		jsonArray.add(j2);
		
		int[] arr3 = new int[1];
		arr3[0] = i3;
		JSONObject j3 = new JSONObject();
		j3.put("name", "70-80");
		j3.put("data", arr3);
		jsonArray.add(j3);
		
		int[] arr4 = new int[1];
		arr4[0] = i4;
		JSONObject j4 = new JSONObject();
		j4.put("name", "80-90");
		j4.put("data", arr4);
		jsonArray.add(j4);
		
		int[] arr5 = new int[1];
		arr5[0] = i5;
		JSONObject j5 = new JSONObject();
		j5.put("name", "90-100");
		j5.put("data", arr5);
		jsonArray.add(j5);
		System.out.println(jsonArray.toJSONString());
		return jsonArray.toJSONString();
	}
*/
}
