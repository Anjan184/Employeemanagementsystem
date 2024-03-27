package ems.entities;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Events {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int eventid;
	private String date;
	private String name;
	private String time;
	
	
	public Events(int eventid, String date, String name, String time) {
		super();
		this.eventid = eventid;
		this.date = date;
		this.name = name;
		this.time = time;
	}


	public int getEventid() {
		return eventid;
	}


	public void setEventid(int eventid) {
		this.eventid = eventid;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getTime() {
		return time;
	}


	public void setTime(String time) {
		this.time = time;
	}


	public Events() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
