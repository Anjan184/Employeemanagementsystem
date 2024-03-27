package ems.entities;

import java.sql.Date;
import java.sql.Time;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class PunchIn {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int p_in_id;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="id",nullable = false)
	private User user;
	
	private Date PunchIn_Date;
	
	private Time PunchIn;
	


	public PunchIn( User user, Date punchIn_Date, Time punchIn) {
		super();
		
		this.user = user;
		this.PunchIn_Date = punchIn_Date;
		this.PunchIn = punchIn;
	}

	public int getP_in_id() {
		return p_in_id;
	}

	public void setP_in_id(int p_in_id) {
		this.p_in_id = p_in_id;
	}

	public Date getPunchIn_Date() {
		return PunchIn_Date;
	}

	public void setPunchIn_Date(Date punchIn_Date) {
		PunchIn_Date = punchIn_Date;
	}

	public int getId() {
		return p_in_id;
	}

	public void setId(int p_in_id) {
		this.p_in_id = p_in_id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Time getPunchIn() {
		return PunchIn;
	}

	public void setPunchIn(Time punchIn) {
		PunchIn = punchIn;
	}

	public PunchIn() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
