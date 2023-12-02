package com.eventManagement.repo;

import com.eventManagement.model.Events;
import org.springframework.data.jpa.repository.JpaRepository;

@org.springframework.stereotype.Repository
public interface Repository extends JpaRepository<Events, Long> {
}
