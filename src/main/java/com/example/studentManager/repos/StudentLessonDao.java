package com.example.studentManager.repos;

import com.example.studentManager.domain.StuLesson;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface StudentLessonDao extends CrudRepository<StuLesson, Integer> {
    Iterable<StuLesson> findStuLessonBySid(Integer sid);
    Iterable<StuLesson> findStuLessonByLid(Integer lid);
    Optional<StuLesson> findStuLessonByLidAndSid(Integer lid, Integer sid);
}
