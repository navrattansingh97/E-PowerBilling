package com.niit.rtt.epowerbilling.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;




@Entity
@Table(name="user")
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="user_id")
	private int uId;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;
	
	@Column(unique = true)
	private String email;
	
	@Column(name="password")
	private String password;
	
	@Column(name="gender")
	private String gender;
	
	@Column(name="aadhaar")
	private String aadhaar;
	
	@Column(name="mobile")
	private String mobNumber;
	
	@Column(name="status" ,nullable=false)
	//@ColumnDefault("Unapproved")
	private String status="unaproved";
	
	@OneToOne(mappedBy="user", cascade= {CascadeType.ALL})
	private Address address;
	
	@OneToOne(mappedBy="user")
	private ConnectionDetails conn;
	
	@OneToMany(mappedBy="user", cascade= {CascadeType.ALL})
	
	private List<BillDetails> bill;
	
	

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<BillDetails> getBill() {
		return bill;
	}

	public void setBill(List<BillDetails> bill) {
		this.bill = bill;
	}

	public User() {
	
		// TODO Auto-generated constructor stub
	}

	public String getMobNumber() {
		return mobNumber;
	}

	public void setMobNumber(String mobNumber) {
		this.mobNumber = mobNumber;
	}

	public int getuId() {
		return uId;
	}

	public void setuId(int uId) {
		this.uId = uId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAadhaar() {
		return aadhaar;
	}

	public void setAadhaar(String aadhaar) {
		this.aadhaar = aadhaar;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}
	
	public ConnectionDetails getConn() {
		return conn;
	}

	public void setConn(ConnectionDetails conn) {
		this.conn = conn;
	}

	/*public BillDetails getBill() {
		return bill;
	}

	public void setBill(BillDetails bill) {
		this.bill = bill;
	}*/
	
}
