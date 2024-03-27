package ems.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import ems.entities.Events;
import ems.entities.Holidays;
import ems.entities.Leaves;
import ems.entities.PunchIn;
import ems.entities.PunchOut;
import ems.entities.User;


@Component
public class UserDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Transactional
	public void createUser(User user) {
	this.hibernateTemplate.saveOrUpdate(user);
	}
	
	@Transactional
	public List<User> getAllEmployees() {
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM User";
		return session.createQuery(hql,User.class).getResultList();
		
	}
	
	@Transactional
	public void updateEmployee(int id,User user) {
		Session session=sessionFactory.getCurrentSession();
		 String hql = "UPDATE User u SET " +
                 "u.fullname = :fullname, " +
                 "u.contact = :contact, " +
                 "u.email = :email, " +
                 "u.gender = :gender, " +
                 "u.position = :position, " +
                 "u.bloodgroup = :bloodgroup, " +
                 "u.role = :role, " + "u.address = :address "+
                 "WHERE u.id = :id";
    
    Query query = session.createQuery(hql);
    query.setParameter("fullname", user.getFullname());
    query.setParameter("contact", user.getContact());
    query.setParameter("email", user.getEmail());
    query.setParameter("gender", user.getGender());
    query.setParameter("position", user.getPosition());
    query.setParameter("bloodgroup", user.getBloodgroup());
    query.setParameter("role", user.getRole());
    query.setParameter("id", id);
    query.setParameter("address",user.getAddress());
    query.executeUpdate();
	}
	
	@Transactional
	public void deleteUser(int id,User user) {
		User u=this.hibernateTemplate.load(User.class,id);
		this.hibernateTemplate.delete(u);
	}
 
	@Transactional
	public User getEmployee(int id) {
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM User where id=:id";
		 return session.createQuery(hql, User.class).setParameter("id", id) .getSingleResult();	
	}
	
	 @Transactional
	    public User getCurrentUserByEmail(String email) {
	        Session session = sessionFactory.getCurrentSession();
	        String hql = "FROM User WHERE email = :email";
	        return session.createQuery(hql, User.class).setParameter("email", email).uniqueResult();	 
		  }
	
	@Transactional
	public boolean authenticateUser(String email, String password,String role) {
		 Session session = sessionFactory.getCurrentSession();
	    String hql = "FROM User WHERE email = :email and password = :password and role=:role";
	    List<User> users = hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(hql, User.class).setParameter("email", email).setParameter("password", password).setParameter("role", role).getResultList();
	    return !users.isEmpty();
	}
	
	@Transactional
	public List<Events> getEvents(){
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM Events";
		return session.createQuery(hql,Events.class).getResultList();	
	}
	
	@Transactional
	public void addEvents(Events event) {
		this.hibernateTemplate.save(event);
	}
	
	@Transactional
	public void deleteEvent(int eventid,Events event) {
		Events e=this.hibernateTemplate.load(Events.class,eventid);
		this.hibernateTemplate.delete(e);
	}
	
	
	@Transactional
	public List<Holidays> getHolidays() {
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM Holidays";
		return session.createQuery(hql,Holidays.class).getResultList();	
	}
	
	@Transactional
	public void addHoliday(Holidays holiday) {
		this.hibernateTemplate.save(holiday);
	}
	
	@Transactional
	public void deleteHoliday(int id,Holidays Holiday) {
		Holidays h=this.hibernateTemplate.load(Holidays.class,id);
		this.hibernateTemplate.delete(h);
	}
	
	@Transactional
	public List<PunchIn> showPunchIn(String selectedDate,User user) {
		Session session=sessionFactory.getCurrentSession();
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    Date date;
	    try {
	        date = dateFormat.parse(selectedDate);
	    } catch (ParseException e) {
	        // Handle parsing exception
	        e.printStackTrace();
	        return Collections.emptyList(); // Or handle it appropriately
	    }
		String hql="From PunchIn p where p.user = :user and p.PunchIn_Date = :selectedDate";
		  return session.createQuery(hql,PunchIn.class).setParameter("user", user).setParameter("selectedDate", date).getResultList();
	}
	
	@Transactional
	public List<PunchIn> showPunchInOne(User user) {
		Session session=sessionFactory.getCurrentSession();
		String hql="From PunchIn p WHERE p.user = :user ";
		  return session.createQuery(hql,PunchIn.class).setParameter("user", user).getResultList();
	}
	
	@Transactional
	public List<PunchOut> showPunchOut(User user) {
		Session session=sessionFactory.getCurrentSession();
		String hql="From PunchOut p WHERE p.user = :user";
		  return session.createQuery(hql,PunchOut.class).setParameter("user", user).getResultList();
	}
	
	@Transactional
	public List<PunchIn> showFirstIn(User user){
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM PunchIn p WHERE (p.PunchIn_Date, p.p_in_id) IN (SELECT p2.PunchIn_Date, MIN(p2.p_in_id) FROM PunchIn p2 WHERE p2.user = :user GROUP BY p2.PunchIn_Date)";
		return session.createQuery(hql,PunchIn.class).setParameter("user", user).getResultList();
	}
	
	@Transactional
	public List<PunchOut> showLastOut(User user){
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM PunchOut p WHERE (p.PunchOut_Date, p.p_out_id) IN (SELECT p2.PunchOut_Date, MAX(p2.p_out_id) FROM PunchOut p2 WHERE p2.user = :user GROUP BY p2.PunchOut_Date)";
		return session.createQuery(hql,PunchOut.class).setParameter("user", user).getResultList();
	}
	
	@Transactional
	public List<PunchIn> showFirstInAdmin(){
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM PunchIn p WHERE (p.PunchIn_Date, p.p_in_id) IN (SELECT p2.PunchIn_Date, MIN(p2.p_in_id) FROM PunchIn p2 GROUP BY p2.PunchIn_Date)";
		return session.createQuery(hql,PunchIn.class).getResultList();
	}
	
	@Transactional
	public List<PunchOut> showLastOutAdmin(){
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM PunchOut p WHERE (p.PunchOut_Date, p.p_out_id) IN (SELECT p2.PunchOut_Date, MAX(p2.p_out_id) FROM PunchOut p2 GROUP BY p2.PunchOut_Date)";

		return session.createQuery(hql,PunchOut.class).getResultList();
	}
	
	
	@Transactional
	public void addpunchin(PunchIn punchIn,User user) {
		punchIn.setUser(user);
		this.hibernateTemplate.save(punchIn);
	}
	
	@Transactional
	public void addpunchout(PunchOut punchOut,User user) {
		punchOut.setUser(user);
		this.hibernateTemplate.save(punchOut);
	}
	
	
	@Transactional
	public void addLeaves(Leaves leave,User user) {
		leave.setUser(user);
		this.hibernateTemplate.save(leave);
	}
	
	@Transactional
	public List<Leaves> getLeaves(User user) {
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM Leaves where user=:user";
		return session.createQuery(hql,Leaves.class).setParameter("user", user).getResultList();	
	}
	
	@Transactional
	public List<Leaves> getAllLeaves() {
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM Leaves where status='pending'";
		return session.createQuery(hql,Leaves.class).getResultList();	
	}
	
	@Transactional
	public List<Leaves> getApprovedLeaves() {
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM Leaves where status='approve'";
		return session.createQuery(hql,Leaves.class).getResultList();	
	}
	
	@Transactional
	public List<Leaves> getRejectedLeaves() {
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM Leaves where status='reject'";
		return session.createQuery(hql,Leaves.class).getResultList();	
	}
	
	@Transactional
	public void delete_leave(int leave_Id,Leaves leave) {
		Leaves l=this.hibernateTemplate.load(Leaves.class,leave_Id);
		this.hibernateTemplate.delete(l);
	}
	
	@Transactional
	public int add_status(int leave_Id,String status) {
		Session session=sessionFactory.getCurrentSession();
		String hql="update Leaves set status=:status where leave_Id=:leave_Id";
		return session.createQuery(hql).setParameter("status", status).setParameter("leave_Id", leave_Id).executeUpdate();		
	}
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
