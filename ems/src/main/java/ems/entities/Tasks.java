package ems.entities;

import java.sql.Date;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class Tasks {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int task_id;
	private String task_name;
	private String description;
	private String assignedTo;
	private String assignedBy;
	private Date due_date;
	private String status;
	
	public int getTask_id() {
		return task_id;
	}
	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}
	public String getTask_name() {
		return task_name;
	}
	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAssignedTo() {
		return assignedTo;
	}
	public void setAssignedTo(String assignedTo) {
		this.assignedTo = assignedTo;
	}
	public Date getDue_date() {
		return due_date;
	}
	public void setDue_date(Date due_date) {
		this.due_date = due_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getAssignedBy() {
		return assignedBy;
	}
	public void setAssignedBy(String assignedBy) {
		this.assignedBy = assignedBy;
	}
	
	
	
	public Tasks(int task_id, String task_name, String description, String assignedTo, String assignedBy, Date due_date,
			String status) {
		super();
		this.task_id = task_id;
		this.task_name = task_name;
		this.description = description;
		this.assignedTo = assignedTo;
		this.assignedBy = assignedBy;
		this.due_date = due_date;
		this.status = status;
	}
	public Tasks() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	








}
