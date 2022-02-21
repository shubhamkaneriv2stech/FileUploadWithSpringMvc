package com.shubham.service;

import java.util.List;
import java.util.Map;

import com.shubham.entity.Employee;
import com.shubham.entity.Showroom;



public interface ShowRoomService {

	public List<Showroom> getShowRooms(String object);

	public void saveShowRoom(Showroom student);

	public Showroom getShowRoom(int id); 

	public void deleteShowRoom(int id) ;

	public Map<Integer, String> engineerList();

	public void saveEmployee(Employee employee);

	public List<Employee> getEmployee();
	
}