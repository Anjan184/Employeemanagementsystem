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
import ems.entities.Tasks;
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
	public List<User> getAllAttendanceEmployees() {
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM User where role='employee' ";
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
	public boolean authenticateUser(String email, String password) {
		 Session session = sessionFactory.getCurrentSession();
	    String hql = "FROM User WHERE email = :email and password = :password ";
	    List<User> users = hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(hql, User.class).setParameter("email", email).setParameter("password", password).getResultList();
	   
	    return !users.isEmpty();
	}
	
	@Transactional
	public User getUserByEmail(String email) {
	    Session session = sessionFactory.getCurrentSession();
	    String hql = "FROM User WHERE email = :email";
	    List<User> users = session.createQuery(hql, User.class)
	                              .setParameter("email", email)
	                              .getResultList();
	    if (!users.isEmpty()) {
	        return users.get(0); // Assuming emails are unique, return the first user found
	    } else {
	        return null; // User not found
	    }
	}
	@Transactional
	public List<Events> getEvents(){
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM Events";
		return session.createQuery(hql,Events.class).getResultList();	
	}
	
	@Transactional
	public List<Integer> getDaysInEvent(){
		Session session=sessionFactory.getCurrentSession();
		String hql="select day(date) FROM Events";
		return session.createQuery(hql,Integer.class).getResultList();	
	}
	
	@Transactional
	public List<String> getMonthsandYearInEvent(){
		Session session=sessionFactory.getCurrentSession();
		String hql="SELECT CONCAT(CASE WHEN SUBSTRING(date, 6, 2) = '01' THEN 'JAN' WHEN SUBSTRING(date, 6, 2) = '02' THEN 'FEB' WHEN SUBSTRING(date, 6, 2) = '03' THEN 'MAR' WHEN SUBSTRING(date, 6, 2) = '04' THEN 'APR' WHEN SUBSTRING(date, 6, 2) = '05' THEN 'MAY' WHEN SUBSTRING(date, 6, 2) = '06' THEN 'JUN' WHEN SUBSTRING(date, 6, 2) = '07' THEN 'JUL' WHEN SUBSTRING(date, 6, 2) = '08' THEN 'AUG' WHEN SUBSTRING(date, 6, 2) = '09' THEN 'SEP' WHEN SUBSTRING(date, 6, 2) = '10' THEN 'OCT' WHEN SUBSTRING(date, 6, 2) = '11' THEN 'NOV' WHEN SUBSTRING(date, 6, 2) = '12' THEN 'DEC' END, ' ', YEAR(date)) AS month_year FROM Events";
		return session.createQuery(hql,String.class).getResultList();		
	}
	
	@Transactional
	public List<String> getDateOfEvent(){
		Session session=sessionFactory.getCurrentSession();
		String hql="SELECT CONCAT(day(date), CASE WHEN SUBSTRING(date, 6, 2) = '01' THEN 'JAN' WHEN SUBSTRING(date, 6, 2) = '02' THEN 'FEB' WHEN SUBSTRING(date, 6, 2) = '03' THEN 'MAR' WHEN SUBSTRING(date, 6, 2) = '04' THEN 'APR' WHEN SUBSTRING(date, 6, 2) = '05' THEN 'MAY' WHEN SUBSTRING(date, 6, 2) = '06' THEN 'JUN' WHEN SUBSTRING(date, 6, 2) = '07' THEN 'JUL' WHEN SUBSTRING(date, 6, 2) = '08' THEN 'AUG' WHEN SUBSTRING(date, 6, 2) = '09' THEN 'SEP' WHEN SUBSTRING(date, 6, 2) = '10' THEN 'OCT' WHEN SUBSTRING(date, 6, 2) = '11' THEN 'NOV' WHEN SUBSTRING(date, 6, 2) = '12' THEN 'DEC' END, ' ', YEAR(date)) AS month_year FROM Events";
		return session.createQuery(hql,String.class).getResultList();	
	}
	
	@Transactional
	public List<Integer> getDaysInHolidays(){
		Session session=sessionFactory.getCurrentSession();
		String hql="select day(fromdate) FROM Holidays";
		return session.createQuery(hql,Integer.class).getResultList();	
	}
	
	@Transactional
	public List<String> getMonthsandYearInHolidays(){
		Session session=sessionFactory.getCurrentSession();
		String hql="SELECT CONCAT(CASE WHEN SUBSTRING(date, 6, 2) = '01' THEN 'JAN' WHEN SUBSTRING(date, 6, 2) = '02' THEN 'FEB' WHEN SUBSTRING(date, 6, 2) = '03' THEN 'MAR' WHEN SUBSTRING(date, 6, 2) = '04' THEN 'APR' WHEN SUBSTRING(date, 6, 2) = '05' THEN 'MAY' WHEN SUBSTRING(date, 6, 2) = '06' THEN 'JUN' WHEN SUBSTRING(date, 6, 2) = '07' THEN 'JUL' WHEN SUBSTRING(date, 6, 2) = '08' THEN 'AUG' WHEN SUBSTRING(date, 6, 2) = '09' THEN 'SEP' WHEN SUBSTRING(date, 6, 2) = '10' THEN 'OCT' WHEN SUBSTRING(date, 6, 2) = '11' THEN 'NOV' WHEN SUBSTRING(date, 6, 2) = '12' THEN 'DEC' END, ' ', YEAR(fromdate)) AS month_year FROM Holidays";
		return session.createQuery(hql,String.class).getResultList();		
	}
	
	@Transactional
	public List<String> getDateOfHolidays(){
		Session session=sessionFactory.getCurrentSession();
		String hql="SELECT CONCAT(day(fromdate), CASE WHEN SUBSTRING(date, 6, 2) = '01' THEN 'JAN' WHEN SUBSTRING(date, 6, 2) = '02' THEN 'FEB' WHEN SUBSTRING(date, 6, 2) = '03' THEN 'MAR' WHEN SUBSTRING(date, 6, 2) = '04' THEN 'APR' WHEN SUBSTRING(date, 6, 2) = '05' THEN 'MAY' WHEN SUBSTRING(date, 6, 2) = '06' THEN 'JUN' WHEN SUBSTRING(date, 6, 2) = '07' THEN 'JUL' WHEN SUBSTRING(date, 6, 2) = '08' THEN 'AUG' WHEN SUBSTRING(date, 6, 2) = '09' THEN 'SEP' WHEN SUBSTRING(date, 6, 2) = '10' THEN 'OCT' WHEN SUBSTRING(date, 6, 2) = '11' THEN 'NOV' WHEN SUBSTRING(date, 6, 2) = '12' THEN 'DEC' END, ' ', YEAR(fromdate)) AS month_year FROM Holidays";
		return session.createQuery(hql,String.class).getResultList();	
	}
	
	@Transactional
	public List<String> getToDateOfHolidays(){
		Session session=sessionFactory.getCurrentSession();
		String hql="SELECT CONCAT(day(date), CASE WHEN SUBSTRING(date, 6, 2) = '01' THEN 'JAN' WHEN SUBSTRING(date, 6, 2) = '02' THEN 'FEB' WHEN SUBSTRING(date, 6, 2) = '03' THEN 'MAR' WHEN SUBSTRING(date, 6, 2) = '04' THEN 'APR' WHEN SUBSTRING(date, 6, 2) = '05' THEN 'MAY' WHEN SUBSTRING(date, 6, 2) = '06' THEN 'JUN' WHEN SUBSTRING(date, 6, 2) = '07' THEN 'JUL' WHEN SUBSTRING(date, 6, 2) = '08' THEN 'AUG' WHEN SUBSTRING(date, 6, 2) = '09' THEN 'SEP' WHEN SUBSTRING(date, 6, 2) = '10' THEN 'OCT' WHEN SUBSTRING(date, 6, 2) = '11' THEN 'NOV' WHEN SUBSTRING(date, 6, 2) = '12' THEN 'DEC' END, ' ', YEAR(date)) AS month_year FROM Holidays";
		return session.createQuery(hql,String.class).getResultList();	
	}
	
	@Transactional
	public void addEvents(Events event) {
		this.hibernateTemplate.saveOrUpdate(event);;
	}
	
	@Transactional
	public Events findEventById(int eventid) {
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM Events where eventid=:eventid";
		return session.createQuery(hql,Events.class).setParameter("eventid",eventid).uniqueResult();	
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
		this.hibernateTemplate.saveOrUpdate(holiday);
	}
	
	@Transactional
	public Holidays findHolidayById(int id) {
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM Holidays where id=:id";
		return session.createQuery(hql,Holidays.class).setParameter("id",id).uniqueResult();	
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
	public List<PunchOut> showPunchOutOne(String selectedDate,User user) {
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
		String hql="From PunchOut p where p.user = :user and p.PunchOut_Date = :selectedDate";
		  return session.createQuery(hql,PunchOut.class).setParameter("user", user).setParameter("selectedDate", date).getResultList();
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
	public List<PunchIn> showFirstInAdmin(int id){
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM PunchIn pi WHERE pi.PunchIn = (SELECT MIN(p.PunchIn) FROM PunchIn p WHERE p.user.id = :id)";
	
		return session.createQuery(hql,PunchIn.class).setParameter("id", id).getResultList();
	}
	
	@Transactional
	public List<PunchOut> showLastOutAdmin(int id){
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM PunchOut pi WHERE pi.PunchOut = (SELECT MAX(p.PunchOut) FROM PunchOut p WHERE p.user.id = :id)";		
		List<PunchOut> p= session.createQuery(hql,PunchOut.class).setParameter("id", id).getResultList();
		return p;
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
	public Long countLeaves(User user) {
		Session session=sessionFactory.getCurrentSession();
		String hql="select count(leave_Id) from Leaves where user=:user";
		Long count=(Long)session.createQuery(hql).setParameter("user", user).uniqueResult();
		return count;
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
	 
	@Transactional
	public void addTask(Tasks task) {
		this.hibernateTemplate.saveOrUpdate(task);
	}
	
	@Transactional
	public List<Tasks> getAllTasks() {
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM Tasks";
		 return session.createQuery(hql, Tasks.class).getResultList();	
	}
	
	@Transactional
	public void deleteTask(int task_id,Tasks task) {
		Tasks h=this.hibernateTemplate.load(Tasks.class,task_id);
		this.hibernateTemplate.delete(h);
	}
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
