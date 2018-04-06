package com.example.studentManager.repos;

import com.example.studentManager.domain.Leave;

import org.springframework.data.repository.CrudRepository;

public interface LeaveDao extends CrudRepository<Leave, Integer> {

}
