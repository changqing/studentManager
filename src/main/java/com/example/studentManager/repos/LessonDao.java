package com.example.studentManager.repos;

import com.example.studentManager.domain.Lesson;
import org.springframework.data.repository.CrudRepository;

public interface LessonDao extends CrudRepository<Lesson, Long>{
    Iterable<Lesson> findAllByTid(Long tid);
}
