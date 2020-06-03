package DAO;

import models.Attendance;
import models.Worker;
import utils.HibernateUtils;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Optional;

public class AttendanceDao implements IDao<Attendance>{
    HibernateUtils currentSession = new HibernateUtils();

    @Override
    public void save(Attendance attendance) {
        currentSession.openCurrentSessionwithTransaction();
        currentSession.getCurrentSession().save(attendance);
        currentSession.closeCurrentSessionWithTransaction();
    }

    @Override
    public void delete(long id) {
        currentSession.openCurrentSessionwithTransaction();
        Attendance attendance = getById(id);
        currentSession.getCurrentSession().delete(attendance);
        currentSession.closeCurrentSessionWithTransaction();
    }

    @Override
    public Attendance get(long id) {
        currentSession.openCurrentSession();
        Attendance attendance = (Attendance) currentSession.getCurrentSession().get(Attendance.class, id);
        currentSession.closeCurrentSession();
        return attendance;
    }

    @Override
    public void update(Attendance attendance) {
        currentSession.openCurrentSessionwithTransaction();
        currentSession.getCurrentSession().update(attendance);
        currentSession.closeCurrentSessionWithTransaction();
    }

    @Override
    public Attendance getById(long id) {
        return (Attendance) currentSession.getCurrentSession().get(Attendance.class, id);
    }

    @Override
    public List<Attendance> findAll() {
        currentSession.openCurrentSession();
        List<Attendance> attendances = (List<Attendance>) currentSession.getCurrentSession().createQuery("FROM Attendance ").list();
        currentSession.closeCurrentSession();
        return attendances;
    }

    @Override
    public List<Attendance> search(String search, String searchField) {
        currentSession.openCurrentSession();
        List<Attendance> attendances;
        attendances = (List<Attendance>) currentSession.getCurrentSession().createQuery(" FROM Attendance WHERE " +
                search + " LIKE '%" + searchField + "%'").list();
        currentSession.closeCurrentSession();
        return attendances;
    }


    public Attendance getByIdAndDate(Worker worker, Date date) {
        LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        currentSession.openCurrentSession();
        Object object = currentSession.getCurrentSession()
                .createQuery("FROM Attendance WHERE date_part('year', date_in_work)  = "+ localDate.getYear()
                        +"AND date_part('day', date_in_work) = "+ localDate.getDayOfMonth()
                        +"AND date_part('month', date_in_work) = "+ localDate.getMonthValue() +" AND id_worker = " + worker.getId())
                .uniqueResult();
        Attendance attendance = null;
        if (object != null) {
        attendance = (Attendance) object;
        }
        currentSession.closeCurrentSession();
        return attendance;
    }

    public List<Attendance> getAllByDate(Date date) {
        LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        currentSession.openCurrentSession();
        List<Attendance> attendances = currentSession.getCurrentSession()
                .createQuery("FROM Attendance WHERE date_part('year', date_in_work)  = "+ localDate.getYear()
                        +"AND date_part('day', date_in_work) = "+ localDate.getDayOfMonth()
                        +"AND date_part('month', date_in_work) = "+ localDate.getMonthValue())
                .list();
        currentSession.closeCurrentSession();
        return attendances;
    }
}
