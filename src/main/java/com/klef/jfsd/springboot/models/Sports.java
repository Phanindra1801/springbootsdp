package com.klef.jfsd.springboot.models;

import jakarta.persistence.*;
import java.sql.Blob;
import java.time.LocalDate;

@Entity
@Table(name="sports_table")
public class Sports 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="event_id")
    private int id;

    @Column(name="event_name", nullable=false, length=100)
    private String name;

    @Column(name="event_date", nullable=false)
    private LocalDate date;

    @Column(name="event_location", nullable=false, length=100)
    private String location;

    @Column(name="sport_type", nullable=false, length=50)
    private String type;

    @Column(name="event_description", nullable=true, length=255)
    private String description;

    @Column(name="event_image", nullable=true)
    private Blob image;

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Blob getImage() {
        return image;
    }

    public void setImage(Blob image) {
        this.image = image;
    }
}
