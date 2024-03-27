package ems.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Holidays {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int id;
private String fromdate;
private String date;
private String name;
private int days;

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


public Holidays(int id, String fromdate, String date, String name, int days) {
	super();
	this.id = id;
	this.fromdate = fromdate;
	this.date = date;
	this.name = name;
	this.days = days;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}


public String getFromdate() {
	return fromdate;
}
public void setFromdate(String fromdate) {
	this.fromdate = fromdate;
}
public int getDays() {
	return days;
}
public void setDays(int days) {
	this.days = days;
}
public Holidays() {
	super();
	// TODO Auto-generated constructor stub
}

}
