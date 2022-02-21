package com.shubham.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.codehaus.jackson.annotate.JsonManagedReference;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "showroom_table")
public class Showroom implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = " SHOWROOM")
	private String showRoomName;

	@Column(name = "USERNAME")
	private String username;

	@Column(name = "REGISTRATION")
	private int registrationNo;

	@Column(name = "SHOWROOMLICENSE")
	private String license;

	@Column(name = "OWNERNAME")
	private String ownerName;

	@Column(name = "ADDRESS1")
	private String address1;

	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@Column(name = "REGISTRATIONDATE")
	private Date registrationDate;

	@OneToMany(fetch = FetchType.LAZY)
	@JsonManagedReference
	@JoinTable(name = "showroom_employee", joinColumns = @JoinColumn(name = "showroom_id"), inverseJoinColumns = 
	@JoinColumn(name = "employee_id"))
	private Set<Employee> list = new HashSet<Employee>();

	@Transient
	private Set<Integer> employeelists = new HashSet<>();

	public Set<Integer> getEmployeelists() {
		return employeelists;
	}

	public void setEmployeelists(Set<Integer> employeelists) {
		this.employeelists = employeelists;
	}

	@Lob
	@Basic(fetch = FetchType.LAZY)
	@Column(name = "images")
	private byte[] images;
	
	@Transient
	private MultipartFile file;

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	
	@Column(name="Filename")
	private String name;
	
	
	
	
	
	
	public Showroom(Integer id, String showRoomName, String username, int registrationNo, String license,
			String ownerName, String address1, Date registrationDate, Set<Employee> list, Set<Integer> employeelists,
			byte[] images, MultipartFile file, String name) {
		this.id = id;
		this.showRoomName = showRoomName;
		this.username = username;
		this.registrationNo = registrationNo;
		this.license = license;
		this.ownerName = ownerName;
		this.address1 = address1;
		this.registrationDate = registrationDate;
		this.list = list;
		this.employeelists = employeelists;
		this.images = images;
		this.file = file;
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Showroom(Integer id, String showRoomName, String username, int registrationNo, String license,
			String ownerName, String address1, Date registrationDate, Set<Employee> list, Set<Integer> employeelists,
			MultipartFile file) {
		this.id = id;
		this.showRoomName = showRoomName;
		this.username = username;
		this.registrationNo = registrationNo;
		this.license = license;
		this.ownerName = ownerName;
		this.address1 = address1;
		this.registrationDate = registrationDate;
		this.list = list;
		this.employeelists = employeelists;
		this.file = file;
	}

	public Showroom(Integer id, String showRoomName, String username, int registrationNo, String license,
			String ownerName, String address1, Date registrationDate, Set<Employee> list, Set<Integer> employeelists,
			byte[] images, MultipartFile file) {
		this.id = id;
		this.showRoomName = showRoomName;
		this.username = username;
		this.registrationNo = registrationNo;
		this.license = license;
		this.ownerName = ownerName;
		this.address1 = address1;
		this.registrationDate = registrationDate;
		this.list = list;
		this.employeelists = employeelists;
		this.images = images;
		this.file = file;
	}

	public Showroom(Integer id, String showRoomName, String username, int registrationNo, String license,
			String ownerName, String address1, Date registrationDate, Set<Integer> employeelists, byte[] images) {
		this.id = id;
		this.showRoomName = showRoomName;
		this.username = username;
		this.registrationNo = registrationNo;
		this.license = license;
		this.ownerName = ownerName;
		this.address1 = address1;
		this.registrationDate = registrationDate;
		this.employeelists = employeelists;
		this.images = images;
	}

	public Showroom(Integer id, String showRoomName, String username, int registrationNo, String license,
			String ownerName, String address1, Date registrationDate, Set<Employee> list, Set<Integer> employeelists,
			byte[] images) {
		this.id = id;
		this.showRoomName = showRoomName;
		this.username = username;
		this.registrationNo = registrationNo;
		this.license = license;
		this.ownerName = ownerName;
		this.address1 = address1;
		this.registrationDate = registrationDate;
		this.list = list;
		this.employeelists = employeelists;
		this.images = images;
	}

	public byte[] getImages() {
		return images;
	}

	public void setImages(byte[] images) {
		this.images = images;
	}

	public Showroom(Integer id, String showRoomName, String username, int registrationNo, String license,
			String ownerName, String address1, Date registrationDate, Set<Integer> employeelists) {
		this.id = id;
		this.showRoomName = showRoomName;
		this.username = username;
		this.registrationNo = registrationNo;
		this.license = license;
		this.ownerName = ownerName;
		this.address1 = address1;
		this.registrationDate = registrationDate;
		this.employeelists = employeelists;
	}

	public Showroom(Integer id, String showRoomName, String username, int registrationNo, String license,
			String ownerName, String address1, Date registrationDate, Set<Employee> list, Set<Integer> employeelists) {
		this.id = id;
		this.showRoomName = showRoomName;
		this.username = username;
		this.registrationNo = registrationNo;
		this.license = license;
		this.ownerName = ownerName;
		this.address1 = address1;
		this.registrationDate = registrationDate;
		this.list = list;
		this.employeelists = employeelists;
	}

	public Showroom() {
		super();

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getShowRoomName() {
		return showRoomName;
	}

	public void setShowRoomName(String showRoomName) {
		this.showRoomName = showRoomName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getRegistrationNo() {
		return registrationNo;
	}

	public void setRegistrationNo(int registrationNo) {
		this.registrationNo = registrationNo;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public Date getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}

	public Set<Employee> getList() {
		return list;
	}

	public void setList(Set<Employee> list) {
		this.list = list;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}