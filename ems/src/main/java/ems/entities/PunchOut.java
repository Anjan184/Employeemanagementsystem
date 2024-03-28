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
import javax.persistence.SequenceGenerator;

@Entity
public class PunchOut {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	 @SequenceGenerator(name="p_in_id_generator", sequenceName = "p_in_id_seq", initialValue = 1, allocationSize = 1)
	private int p_out_id;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="id",nullable = false)
	private User user;
	
	private Date PunchOut_Date;
	
	private Time PunchOut;
	
	
	public int getP_out_id() {
		return p_out_id;
	}

	public void setP_out_id(int p_out_id) {
		this.p_out_id = p_out_id;
	}

	public PunchOut( User user, Date punchOut_Date, Time punchOut) {
		super();
		this.user = user;
		PunchOut_Date = punchOut_Date;
		PunchOut = punchOut;
	}

	public Date getPunchOut_Date() {
		return PunchOut_Date;
	}

	public void setPunchOut_Date(Date punchOut_Date) {
		PunchOut_Date = punchOut_Date;
	}

	public int getId() {
		return p_out_id;
	}

	public void setId(int p_out_id) {
		this.p_out_id = p_out_id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Time getPunchOut() {
		return PunchOut;
	}

	public void setPunchOut(Time punchOut) {
		PunchOut = punchOut;
	}

	public PunchOut() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
