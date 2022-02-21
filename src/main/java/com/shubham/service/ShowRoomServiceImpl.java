package com.shubham.service;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shubham.dao.ShowRoomDao;
import com.shubham.entity.Employee;
import com.shubham.entity.Showroom;

@Service
@Transactional
public class ShowRoomServiceImpl implements ShowRoomService {

	@Autowired
	private ShowRoomDao showRoomDao;

	@Override
	@Transactional
	public List<Showroom> getShowRooms(String Str) {
		return showRoomDao.getShowRooms(Str);
	}

	@Override
	@Transactional
	public void saveShowRoom(Showroom showRoom) {

		Integer id = showRoom.getId();
		System.out.println("id is " + id);
		Showroom applicant = null;
		if (id != null) {
			applicant = showRoomDao.getShowRoom(id);
		}
		boolean isNew = false;
		if (applicant == null) {
			isNew = true;
			applicant = new Showroom();
		}
		applicant.setShowRoomName(showRoom.getShowRoomName());
		applicant.setAddress1(showRoom.getAddress1());
		applicant.setLicense(showRoom.getLicense());
		applicant.setOwnerName(showRoom.getOwnerName());
		applicant.setRegistrationDate(showRoom.getRegistrationDate());
		applicant.setUsername(showRoom.getUsername());
		applicant.setRegistrationNo(showRoom.getRegistrationNo());

		Employee employee = null;

		Set<Employee> list = new HashSet<Employee>();

		Set<Integer> sys = showRoom.getEmployeelists();

		for (Integer integer : sys) {

			System.out.println(integer);

			employee = new Employee();

			employee.setId(integer);

			list.add(employee);

			showRoom.setList(list);

		}

		System.out.println(list);

		System.out.println(isNew);

		showRoomDao.saveShowRoom(showRoom);

	}

	@Override
	@Transactional
	public Showroom getShowRoom(int id) {
		

		Showroom showRoom = showRoomDao.getShowRoom(id);

		System.out.println(
				"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

		System.out.println(showRoom.getAddress1());

		System.out.println(showRoom.getLicense());

		System.out.println(showRoom.getOwnerName());

		System.out.println(showRoom.getId());

		System.out.println(showRoom.getUsername());

		System.out.println(showRoom.getShowRoomName());

		Set<Integer> list = new HashSet<Integer>();
		Set<Employee> s = showRoom.getList();
		for (Employee engineers : s) {
			list.add(engineers.getId());
		}

		showRoom.setEmployeelists(list);

		return showRoom;

	}

	@Override
	@Transactional
	public void deleteShowRoom(int theId) {
		showRoomDao.deleteShowRoom(theId);
	}

	@Override
	@Transactional
	public Map<Integer, String> engineerList() {

		return showRoomDao.engineerList();

	}

	@Override
	public void saveEmployee(Employee employee) {

		showRoomDao.saveEmployee(employee);

	}

	@Override
	public List<Employee> getEmployee() {

		return showRoomDao.getEmployee();
	}

}
