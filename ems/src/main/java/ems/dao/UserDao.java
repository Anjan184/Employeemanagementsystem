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
import org.springframework.scheduling.config.Task;
import org.springframework.stereotype.Component;

import ems.entities.Events;
import ems.entities.Holidays;
import ems.entities.Leaves;
import ems.entities.Project;
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
	public User findUserById(int id) {
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM User where id=:id";
		return session.createQuery(hql,User.class).setParameter("id",id).uniqueResult();
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
		String hql="FROM PunchIn p WHERE (p.PunchIn_Date, p.p_in_id) IN (SELECT p2.PunchIn_Date, MIN(p2.p_in_id) FROM PunchIn p2 WHERE p2.user.id = :id GROUP BY p2.PunchIn_Date)";
		return session.createQuery(hql,PunchIn.class).setParameter("id", id).getResultList();
	}
	
	@Transactional
	public List<PunchOut> showLastOutAdmin(int id){
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM PunchOut p WHERE (p.PunchOut_Date, p.p_out_id) IN (SELECT p2.PunchOut_Date, MAX(p2.p_out_id) FROM PunchOut p2 WHERE p2.user.id = :id GROUP BY p2.PunchOut_Date)";		
		return session.createQuery(hql,PunchOut.class).setParameter("id", id).getResultList();
	}
	
	@Transactional
	public List<Object[]> TotalTime(int id){
		Session session=sessionFactory.getCurrentSession();
		String hql="select SEC_TO_TIME(SUM(TIME_TO_SEC(timediff(po.PunchOut,pi.PunchIn)))) as TotalTime from PunchIn pi join PunchOut po on pi.p_in_id=po.p_out_id where pi.user.id=:id group by pi.PunchIn_Date";
		List<Object[]> l= session.createQuery(hql).setParameter("id", id).getResultList();
		return l;
	}

	@Transactional
	public List<Object[]> BreakTime(int id){
		Session session=sessionFactory.getCurrentSession();
	
		String hql = "SELECT " +
	             "  TIMEDIFF(" +
	             "    TIMEDIFF(MAX(po.PunchOut), MIN(pi.PunchIn)), " +
	             "    SUM(TIMEDIFF(po.PunchOut, pi.PunchIn))" +
	             "  ) AS breakhour " +
	             "FROM " +
	             "  PunchIn pi " +
	             "JOIN " +
	             "  PunchOut po " +
	             "ON " +
	             "  pi.p_in_id = po.p_out_id " +
	             "WHERE " +
	             "  pi.user.id = :id " +
	             "GROUP BY " +
	             "  pi.PunchIn_Date";
		
		List<Object[]> l= session.createQuery(hql).setParameter("id", id).getResultList();
		System.out.println(l);
		return l;
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
		this.hibernateTemplate.saveOrUpdate(leave);
	}
	
	@Transactional
	public Leaves findLeaveById(int leave_Id) {
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM Leaves where leave_Id=:leave_Id";
		return session.createQuery(hql,Leaves.class).setParameter("leave_Id",leave_Id).uniqueResult();
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
	public void addProject(Project project) {
		this.hibernateTemplate.saveOrUpdate(project);
	}
	
	@Transactional
	public void addTask(Tasks task) {
		this.hibernateTemplate.saveOrUpdate(task);
	}
	
	@Transactional
	public void saveStatus(int task_id,String status,Tasks task) {
		Session session=sessionFactory.getCurrentSession();
		 String hql = "UPDATE Tasks t SET " +
                 "t.status = :status " +
                 "WHERE t.task_id = :task_id";
    
    Query query = session.createQuery(hql);
    query.setParameter("status", task.getStatus());
    query.setParameter("task_id",task.getTask_id() );
    query.executeUpdate();
	}
	
	@Transactional
	public List<Project> getProjects() {
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM Project";
		 return session.createQuery(hql, Project.class).getResultList();	
	}
	
      @Transactional
public List<Object[]> getProjectStatus() {
    Session session = sessionFactory.getCurrentSession();
    String sql = "SELECT " +
                 "    CASE " +
                 "        WHEN SUM(CASE WHEN t.status = 'Todo' THEN 1 ELSE 0 END) = COUNT(t.task_id) THEN 'Todo' " +
                 "        WHEN SUM(CASE WHEN t.status = 'Done' THEN 1 ELSE 0 END) = COUNT(t.task_id) THEN 'Done' " +
                 "        ELSE 'In_Progress' " +
                 "    END AS project_status " +
                 "FROM EMS.Project p " +
                 "JOIN EMS.Tasks t ON p.project_id = t.project_id " +
                 "GROUP BY p.project_id";
    return session.createNativeQuery(sql).getResultList();
}

        
	@Transactional
	public Project getProjectsId(int project) {
		Session session=sessionFactory.getCurrentSession();
		return session.get(Project.class, project);
	}
	
	@Transactional
	public Project findProjectById(int project_id) {
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM Project where project_id=:project_id";
		return session.createQuery(hql,Project.class).setParameter("project_id",project_id).uniqueResult();	
	}
	
	@Transactional
	public void deleteProject(int project_id,Project project) {
		Project h=this.hibernateTemplate.load(Project.class,project_id);
		this.hibernateTemplate.delete(h);
	}
	
	@Transactional
	public List<Tasks> getTodoTasks(int project_id) {
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM Tasks where status='Todo' and project_id=:project_id";
		 return session.createQuery(hql, Tasks.class).setParameter("project_id",project_id).getResultList();	
	}
	
	
	
	@Transactional
	public List<Tasks> getInProgressTasks(int project_id) {
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM Tasks where status='In_Progress' and project_id=:project_id";
		 return session.createQuery(hql, Tasks.class).setParameter("project_id",project_id).getResultList();	
	}
	
	@Transactional
	public List<Tasks> getDoneTasks(int project_id) {
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM Tasks where status='Done' and project_id=:project_id";
		 return session.createQuery(hql, Tasks.class).setParameter("project_id",project_id).getResultList();	
	}
	
	@Transactional
	public List<Tasks> getAllTasksByName(String name,int project_id) {
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM Tasks where AssignedTo=:name and project_id=:project_id";
		 return session.createQuery(hql, Tasks.class).setParameter("name",name).setParameter("project_id",project_id).getResultList();	
	}
	
	@Transactional
	public Tasks findTaskById(int task_id) {
		Session session=sessionFactory.getCurrentSession();
		String hql="FROM Tasks where task_id=:task_id";
		return session.createQuery(hql,Tasks.class).setParameter("task_id",task_id).uniqueResult();	
	}
	
	@Transactional
	public void deleteTask(int task_id) {
		Tasks h=hibernateTemplate.load(Tasks.class,task_id);
		this.hibernateTemplate.delete(h);
	}
	
	@Transactional
	public Long countTask(String AssignedTo) {
		Session session=sessionFactory.getCurrentSession();
		String hql="select count(task_id) from Tasks where AssignedTo=:AssignedTo";
		Long count=(Long)session.createQuery(hql).setParameter("AssignedTo", AssignedTo).uniqueResult();
		return count;
	}
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
