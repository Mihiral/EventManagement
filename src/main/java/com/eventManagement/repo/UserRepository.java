package com.eventManagement.repo;
import com.eventManagement.model.Login;
import org.springframework.data.jpa.repository.JpaRepository;

@org.springframework.stereotype.Repository
public interface UserRepository extends JpaRepository<Login, Long>{
    Login findByNameAndPassword(String name, String password);

}
