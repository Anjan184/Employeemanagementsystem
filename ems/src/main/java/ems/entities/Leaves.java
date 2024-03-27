package ems.entities;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Leaves {

	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="id",nullable = false)
	private User user;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
private int leave_Id;

private Date from_Date;
private Date to_Date;
private String leave_type;
private String reason;
private String status;

public int getLeave_Id() {
	return leave_Id;
}
public void setLeave_Id(int leave_Id) {
	this.leave_Id = leave_Id;
}
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}
public Date getFrom_Date() {
	return from_Date;
}
public void setFrom_Date(Date from_Date) {
	this.from_Date = from_Date;
}
public Date getTo_Date() {
	return to_Date;
}
public void setTo_Date(Date to_Date) {
	this.to_Date = to_Date;
}
public String getLeave_type() {
	return leave_type;
}
public void setLeave_type(String leave_type) {
	this.leave_type = leave_type;
}
public String getReason() {
	return reason;
}
public void setReason(String reason) {
	this.reason = reason;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public Leaves(int leave_Id, User user, Date from_Date, Date to_Date, String leave_type, String reason, String status) {
	super();
	this.leave_Id = leave_Id;
	this.user = user;
	this.from_Date = from_Date;
	this.to_Date = to_Date;
	this.leave_type = leave_type;
	this.reason = reason;
	this.status = status;
}
public Leaves() {
	super();
	// TODO Auto-generated constructor stub
}




}
