package com.eventManagement.model;

import javax.persistence.*;

@Entity
@Table(name="EVENTS")
public class Events {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String eventTitle;

    private String eventStartDate;

    private String eventEndDate;

    private String eventDetails;

    private String eventConductedBy;

    public Events() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEventTitle() {
        return eventTitle;
    }

    public void setEventTitle(String eventTitle) {
        this.eventTitle = eventTitle;
    }

    public String getEventStartDate() {
        return eventStartDate;
    }

    public void setEventStartDate(String eventStartDate) {
        this.eventStartDate = eventStartDate;
    }

    public String getEventEndDate() {
        return eventEndDate;
    }

    public void setEventEndDate(String eventEndDate) {
        this.eventEndDate = eventEndDate;
    }

    public String getEventDetails() {
        return eventDetails;
    }

    public void setEventDetails(String eventDetails) {
        this.eventDetails = eventDetails;
    }

    public String getEventConductedBy() {
        return eventConductedBy;
    }

    public void setEventConductedBy(String eventConductedBy) {
        this.eventConductedBy = eventConductedBy;
    }
}
