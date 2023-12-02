package com.eventManagement.repo;

import com.eventManagement.model.Events;
import com.eventManagement.model.Login;
import org.springframework.data.jpa.repository.JpaRepository;

@org.springframework.stereotype.Repository
public interface LoginRepository extends JpaRepository<Login, Long> {
}
