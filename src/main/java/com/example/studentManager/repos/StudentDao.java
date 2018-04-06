package com.example.studentManager.repos;

import com.example.studentManager.domain.Student;
import org.springframework.data.repository.CrudRepository;

public interface StudentDao extends CrudRepository<Student, Integer> {
    Student getStudentByUsernameAndPassword(String username, String password);
}
