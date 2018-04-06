package com.example.studentManager.controller;

import com.example.studentManager.repos.TeacherDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("teacher")
public class TeacherController {
	
	@Autowired
	private TeacherDao teacherDao;
	
}
