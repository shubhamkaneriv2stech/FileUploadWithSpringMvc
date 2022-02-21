package com.shubham.dao;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import com.shubham.entity.Employee;
import com.shubham.entity.Showroom;

@Repository
public class ShowRoomDaoImpl implements ShowRoomDao {

	@PersistenceContext
	public EntityManager entityManager;

	@Override
	public List<Showroom> getShowRooms(String str) {

		if (str == null) {

			Calendar c = Calendar.getInstance();
			c.add(Calendar.DATE, -1);

			Calendar c1 = Calendar.getInstance();
			c1.add(Calendar.DATE, -15);

			System.out.println(c1.getTime());
			System.out.println(c.getTime());

			CriteriaBuilder cb = entityManager.getCriteriaBuilder();
			CriteriaQuery<Showroom> q = cb.createQuery(Showroom.class);
			Root<Showroom> o = q.from(Showroom.class);
			q.distinct(true);

			

			q.where(cb.between(o.<Date>get("registrationDate"), c1.getTime(), c.getTime()));
			
			o.fetch("list", JoinType.INNER);
			List<Showroom> dept = entityManager.createQuery(q).getResultList();

			
			return dept;
		} 
		else 
		{
			CriteriaBuilder builder = entityManager.getCriteriaBuilder();
			CriteriaQuery<Showroom> cq = builder.createQuery(Showroom.class);
			cq.distinct(true);
			Root<Showroom> root = cq.from(Showroom.class);
			
			root.fetch("list", JoinType.INNER);
			Root<Employee> root1 = cq.from(Employee.class);
			
			
			Predicate like = builder.like(builder.lower(root.get("showRoomName")),
					builder.lower(builder.literal("%" +str + "%")));

			Predicate like2 = builder.like(builder.lower(root.get("username")),
					builder.lower(builder.literal("%" + str + "%")));
			

			Predicate like1 = builder.like(builder.lower(root.join("list").get("firstName")),
					builder.lower(builder.literal("%" + str + "%")));

			Predicate nameOrRollNumberPredicate = builder.or(like, like1,like2);

			cq.select(root);
			
			//cq.multiselect(root,root1)
			cq.where(nameOrRollNumberPredicate);
			

			List<Showroom> resultList = entityManager.createQuery(cq).getResultList();
			return resultList;
		}

	}

	@Override
	public void saveEmployee(Employee employee) {
		entityManager.persist(employee);

	}

	@Override
	public void saveShowRoom(Showroom showroom) {

		if (showroom.getId() == null) {

			entityManager.persist(showroom);
		}

		else {

			showroom.setId(showroom.getId());
			entityManager.merge(showroom);

		}

	}

	@Override
	public Showroom getShowRoom(int id) {

		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Showroom> createQuery = criteriaBuilder.createQuery(Showroom.class);
		Root<Showroom> root = createQuery.from(Showroom.class);

		createQuery.where(criteriaBuilder.equal(root.get("id"), id));

		TypedQuery<Showroom> createQuery2 = entityManager.createQuery(createQuery);
		;
		return createQuery2.getSingleResult();
	}

	@Override
	public void deleteShowRoom(int id) {
		/*
		 * CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		 * CriteriaDelete<ShowRoom> createCriteriaDelete =
		 * criteriaBuilder.createCriteriaDelete(ShowRoom.class); Root<ShowRoom> from =
		 * createCriteriaDelete.from(ShowRoom.class);
		 * 
		 * createCriteriaDelete.where(criteriaBuilder.equal(from.get("id"), id));
		 * 
		 * entityManager.createQuery(createCriteriaDelete).executeUpdate();
		 * 
		 * 
		 * }
		 */
	}

	@Override
	public Map<Integer, String> engineerList() {

		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();

		CriteriaQuery<Employee> createQuery = criteriaBuilder.createQuery(Employee.class);

		Root<Employee> root = createQuery.from(Employee.class);
		createQuery.select(root);

		TypedQuery<Employee> typedQuery = entityManager.createQuery(createQuery);

		Iterable<Employee> findAll = typedQuery.getResultList();
		Map<Integer, String> map = new HashMap<Integer, String>();
		for (Employee pen : findAll) {

			String fullName = pen.getFirstName() + " " + pen.getLastName();

			map.put(pen.getId(), fullName);
		}

		return map;
	}

	@Override
	public List<Employee> getEmployee() {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Employee> createQuery = criteriaBuilder.createQuery(Employee.class);

		Root<Employee> root = createQuery.from(Employee.class);
		createQuery.select(root);

		TypedQuery<Employee> typedQuery = entityManager.createQuery(createQuery);

		return typedQuery.getResultList();
	}
}