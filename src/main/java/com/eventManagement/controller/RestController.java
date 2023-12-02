package com.eventManagement.controller;

import com.eventManagement.model.Events;
import com.eventManagement.model.Login;
import com.eventManagement.service.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class RestController {

    @Autowired
    Service service;

    @GetMapping({ "/ViewEvents"})
    public String viewEvents(@ModelAttribute("message") String message, Model model) {
        model.addAttribute("eventList", service.getAllEvents());
        model.addAttribute("message", message);

        return "ViewEvents";
    }

    @GetMapping("/addEvent")
    public String addEvent(@ModelAttribute("message") String message, Model model) {
        model.addAttribute("event", new Events());
        model.addAttribute("message", message);

        return "AddEvent";
    }

    @PostMapping("/saveEvent")
    public String saveEvent(Events events, RedirectAttributes redirectAttributes) {
        if (service.saveOrUpdateEvent(events)) {
            redirectAttributes.addFlashAttribute("message", "Save Success");
            return "redirect:/ViewEvents";
        }

        redirectAttributes.addFlashAttribute("message", "Save Failure");
        return "redirect:/AddEvent";
    }


    @PostMapping("/loginEvent")
    public String loginEvent(@ModelAttribute Login login, ModelMap model, RedirectAttributes redirectAttributes) {
        if (service.loginEvent(login)) {
            redirectAttributes.addFlashAttribute("message", "Login Success");
            return "redirect:/ViewEvents";
        }
        else {
            model.put("errorMsg", "Invalid Username or Password");
            return "LoginPage";

        }
    }

    @GetMapping("/editEvent/{id}")
    public String editEvent(@PathVariable Long id, Model model) {
        model.addAttribute("event", service.getEventById(id));

        return "EditEvent";
    }

    @PostMapping("/editSaveEvent")
    public String editSaveEvent(Events events, RedirectAttributes redirectAttributes) {
        if (service.saveOrUpdateEvent(events)) {
            redirectAttributes.addFlashAttribute("message", "Edit Success");
            return "redirect:/ViewEvents";
        }

        redirectAttributes.addFlashAttribute("message", "Edit Failure");
        return "redirect:/EditEvent/" + events.getId();
    }

    @GetMapping("/deleteEvent/{id}")
    public String deleteEvent(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        if (service.deleteEvent(id)) {
            redirectAttributes.addFlashAttribute("message", "Delete Success");
        } else {
            redirectAttributes.addFlashAttribute("message", "Delete Failure");
        }

        return "redirect:/ViewEvents";
    }

}
