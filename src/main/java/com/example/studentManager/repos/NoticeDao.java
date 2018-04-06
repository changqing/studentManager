package com.example.studentManager.repos;

import com.example.studentManager.domain.Notice;
import org.springframework.data.repository.CrudRepository;

public interface NoticeDao extends CrudRepository<Notice, Integer> {

}
