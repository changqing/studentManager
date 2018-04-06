package com.example.studentManager.repos;

import com.example.studentManager.domain.Teacher;
import org.springframework.data.repository.CrudRepository;

public interface TeacherDao extends CrudRepository<Teacher, Integer> {

	Teacher getTeacherByUsernameAndPasswordAndRole(String username, String password, String role);

}
