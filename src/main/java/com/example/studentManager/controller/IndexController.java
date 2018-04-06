package com.example.studentManager.controller;

import com.example.studentManager.domain.Student;
import com.example.studentManager.domain.Teacher;
import com.example.studentManager.repos.StudentDao;
import com.example.studentManager.repos.TeacherDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class IndexController {

    @Autowired
    private StudentDao studentDao;

    @Autowired
    private TeacherDao teacherDao;

    /**
     * 登录
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "/login")
    public String login(HttpServletRequest request, Model model) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        if ("1".equals(role)) {
            Student loginUser = this.studentDao.getStudentByUsernameAndPassword(username, password);
            if(loginUser != null) {
                request.getSession().setAttribute("loginUser", loginUser);
                request.getSession().setAttribute("role", role);
                request.getSession().setAttribute("uid", loginUser.getId());
                return "sys_center";
            }
        } else {
            Teacher loginUser = this.teacherDao.getTeacherByUsernameAndPasswordAndRole(username, password, role);
            if(loginUser != null) {
                request.getSession().setAttribute("loginUser", loginUser);
                request.getSession().setAttribute("role", role);
                request.getSession().setAttribute("uid", loginUser.getId());
                return "sys_center";
            }
        }
        model.addAttribute("msg", "* 用户名或密码有误，请重新登录");

        return "toIndex";
    }


     /** 菜单
     *
     *
     **/

    @RequestMapping("sysMenu")
    public String sysMenu() {
        return "sys_menu";
    }

     /**
     * 首页
     *
     * @return
     */
    @RequestMapping("sysIndex")
    public String sysIndex() {
        return "sys_index";
    }

     /**
     * 用户从系统中退出
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("logout")
    public String logout(HttpSession session, Model model) {
        session.removeAttribute("loginUser");
        session.removeAttribute("role");
        model.addAttribute("msg", "您已安全退出");
        return "toIndex";
    }

    /**
     * 更新个人信息
     *
     * @return
     */
    @RequestMapping("selfInfo")
    public String selfInfo() {
        return "editSelf";
    }


    /**
     * 更新个人信息
     *
     * @return
     */
    @RequestMapping("update")
    public String update(Student student, HttpServletRequest request, Model model) {
        String role = (String) request.getSession().getAttribute("role");
        if ("1".equals(role)) {
            studentDao.save(student);
            request.getSession().setAttribute("loginUser", student);
        } else {
            Teacher teacher = new Teacher();
            teacher.setId(Integer.parseInt(request.getParameter("id")));
            teacher.setUsername(request.getParameter("username"));
            teacher.setPassword(request.getParameter("password"));
            teacher.setTruename(request.getParameter("truename"));
            teacher.setPhone(request.getParameter("phone"));
            teacher.setEmail(request.getParameter("email"));
            teacher.setRole(request.getParameter("role"));
            teacherDao.save(teacher);
            request.getSession().setAttribute("loginUser", teacher);
        }
        model.addAttribute("msg", " 修改成功");
        return "editSelf";
    }

}

