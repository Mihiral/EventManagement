package com.eventManagement.service;

import com.eventManagement.model.Events;
import com.eventManagement.model.Login;
import com.eventManagement.repo.LoginRepository;
import com.eventManagement.repo.Repository;
import com.eventManagement.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

@org.springframework.stereotype.Service
public class Service {

    @Autowired
    Repository eventRepo;

    @Autowired
    UserRepository userRepo;


    @Autowired
    LoginRepository loginRepo;

    public List<Events> getAllEvents() {
        List<Events> eventsList = new ArrayList<>();
        eventRepo.findAll().forEach(events -> eventsList.add(events));

        return eventsList;
    }

    public Events getEventById(Long id) {
        return eventRepo.findById(id).get();
    }

    public boolean saveOrUpdateEvent(Events events) {
        Events updatedEvents;
        if ((events.getId()) != null) {
            Events events1 = new Events();
            events1.setEventDetails(events.getEventDetails());
            events1.setEventConductedBy(events.getEventConductedBy());
            events1.setEventTitle(events.getEventTitle());
            events1.setEventStartDate(events.getEventStartDate());
            events1.setEventEndDate(events.getEventEndDate());
            events1.setId(events.getId());
            updatedEvents = eventRepo.save(events1);

        } else {
            updatedEvents = eventRepo.save(events);
            //new values
        }
        if (eventRepo.findById(updatedEvents.getId()) != null) {
            return true;
        }

        return false;
    }

    public boolean loginEvent( Login login) {
        //Login loginDetails = loginRepo.save(login);
        Login foundUser = userRepo.findByNameAndPassword(login.getName(), login.getPassword());

        if (foundUser != null) {
            return true;
        } else {
            // model.addAttribute("error", "Invalid username or password");
            // System.out.println("UserName Or password is no correct");
            return false;
        }

    }

    public boolean deleteEvent(Long id) {
        eventRepo.deleteById(id);

        if (eventRepo.findById(id) != null) {
            return true;
        }

        return false;
    }

}
