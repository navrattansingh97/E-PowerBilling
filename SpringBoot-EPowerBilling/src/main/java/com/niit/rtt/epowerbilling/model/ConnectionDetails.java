package com.niit.rtt.epowerbilling.model;

import java.sql.Date;
import java.util.*;

import javax.persistence.*;

@Entity
@Table(name="connectiondetails")
public class ConnectionDetails {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int connectionId;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="userId")
	private User user;
	
	@Column(name="connectionName")
	private String connectionName;
	
	@Column(name="connectionType")
	private String connectionType;
	
	@Column(name="connectionStartDate")
	private Date connectionStartDate;
	
	@OneToMany(mappedBy="connectiondetails", cascade= {CascadeType.ALL})
			//@OneToOne(mappedBy="connectiondetails")
	private List<BillDetails> bill;

	

	public List<BillDetails> getBill() {
		return bill;
	}

	public void setBill(List<BillDetails> bill) {
		this.bill = bill;
	}

	public ConnectionDetails() {
		super();
	}
	public int getConnectionId() {
		return connectionId;
	}

	public void setConnectionId(int connectionId) {
		this.connectionId = connectionId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getConnectionName() {
		return connectionName;
	}

	public void setConnectionName(String connectionName) {
		this.connectionName = connectionName;
	}

	public String getConnectionType() {
		return connectionType;
	}

	public void setConnectionType(String connectionType) {
		this.connectionType = connectionType;
	}

	public Date getConnectionStartDate() {
		return connectionStartDate;
	}

	public void setConnectionStartDate(Date connectionStartDate) {
		this.connectionStartDate = connectionStartDate;
	}
	
	
	
}
