package com.shubham.model;

import java.util.Set;

import com.shubham.entity.Employee;

public class OneToManyRequest {

	private Long departmentId;
	private String departmentName;
	
	private Set<Employee> employee;

	public Long getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Long departmentId) {
		this.departmentId = departmentId;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public Set<Employee> getEmployee() {
		return employee;
	}

	public void setEmployee(Set<Employee> employee) {
		this.employee = employee;
	}


}
