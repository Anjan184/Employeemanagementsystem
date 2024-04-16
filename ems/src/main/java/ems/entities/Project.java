package ems.entities;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Project {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int project_id;
	private String project_name;
	private String projectstatus;
	private Date projectduedate;
	
	
	
	
	public Project(int project_id, String project_name, String projectstatus, Date projectduedate) {
		super();
		this.project_id = project_id;
		this.project_name = project_name;
		this.projectstatus = projectstatus;
		this.projectduedate = projectduedate;
	}
	
	public Date getProjectduedate() {
		return projectduedate;
	}
	public void setProjectduedate(Date projectduedate) {
		this.projectduedate = projectduedate;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	
	public String getProjectstatus() {
		return projectstatus;
	}
	public void setProjectstatus(String projectstatus) {
		this.projectstatus = projectstatus;
	}
	
	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
