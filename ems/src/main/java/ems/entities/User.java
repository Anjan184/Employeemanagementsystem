package ems.entities;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	 @SequenceGenerator(name="id_generator", sequenceName = "id_seq", initialValue = 1, allocationSize = 1)
	private int id;
	private String email;
	private String password;
	private String role;	
	private String fullname;
	private Date dob;
	private String contact;
	private String gender;
	private String position;
	private String bloodgroup;
	private String address;
	
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	

	public User( String email, String password, String role, String fullname, Date dob, String contact,
			String gender, String position, String bloodgroup, String address) {
		super();
		this.email = email;
		this.password = password;
		this.role = role;
		this.fullname = fullname;
		this.dob = dob;
		this.contact = contact;
		this.gender = gender;
		this.position = position;
		this.bloodgroup = bloodgroup;
		this.address = address;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getBloodgroup() {
		return bloodgroup;
	}

	public void setBloodgroup(String bloodgroup) {
		this.bloodgroup = bloodgroup;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

}
