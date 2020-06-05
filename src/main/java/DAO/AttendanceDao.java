package DAO;

import models.Attendance;
import models.Worker;
import utils.HibernateUtils;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

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

    public List<Attendance> findByIdWorker(long idWorker){
        currentSession.openCurrentSession();
        List<Attendance> attendances = (List<Attendance>)currentSession.getCurrentSession().createQuery("FROM Attendance WHERE id_worker = " + idWorker
        + " ORDER BY id_attendance").list();
        currentSession.closeCurrentSession();
        return attendances;
    }

    public Attendance getByIdAndDate(Worker worker, Date date) {
        LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        currentSession.openCurrentSession();
        Object object = currentSession.getCurrentSession()
                .createQuery("FROM Attendance WHERE date_part('year', date_in_work)  = "+ localDate.getYear()
                        +" AND date_part('day', date_in_work) = "+ localDate.getDayOfMonth()
                        +" AND date_part('month', date_in_work) = "+ localDate.getMonthValue() +" AND id_worker = " + worker.getIdWorker() +
                        " AND date_out_work IS NULL")
                .uniqueResult();
        Attendance attendance = null;
        if (object != null) {
        attendance = (Attendance) object;
        }
        currentSession.closeCurrentSession();
        return attendance;
    }
/*    // TODO
    public List<Long> getAllByDate(Date date) {
        try {
            LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            currentSession.openCurrentSession();
            List<Long> attendances = currentSession.getCurrentSession()
                    .createQuery("SELECT Attendance.worker FROM Attendance where date_part('year', dateInWork) = 2020 " +
                                    "AND date_part('month', dateInWork) = 06 and date_part('day', dateInWork) = 03 and dateOutWork IS NULL"

                            *//*"SELECT Attendance.worker FROM Attendance WHERE date_part('year', dateInWork)  = " + localDate.getYear()
                            + " AND date_part('day', dateInWork) = " + localDate.getDayOfMonth()
                            + " AND date_part('month', dateInWork) = " + localDate.getMonthValue()
                            + " AND dateOutWork IS NULL"*//*)
                    .list();
            currentSession.closeCurrentSession();
            return attendances;
        }
        catch (NullPointerException ex){
            currentSession.closeCurrentSession();
            return null;
        }
    }*/
}
