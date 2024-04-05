package ems.entities;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Holidays {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int id;
private Date fromdate;
private Date date;
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

public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}

public Date getFromdate() {
	return fromdate;
}
public void setFromdate(Date fromdate) {
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
}
public Holidays(int id, Date fromdate, Date date, String name, int days) {
	super();
	this.id = id;
	this.fromdate = fromdate;
	this.date = date;
	this.name = name;
	this.days = days;
}



}
