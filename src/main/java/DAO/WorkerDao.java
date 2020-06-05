package DAO;

import models.Worker;
import utils.HibernateUtils;

import java.util.List;

public class WorkerDao implements IDao<Worker> {
    private HibernateUtils currentSession = new HibernateUtils();


    @Override
    public void save(Worker worker) {
        currentSession.openCurrentSessionwithTransaction();
        currentSession.getCurrentSession().save(worker);
        currentSession.closeCurrentSessionWithTransaction();
    }

    @Override
    public void delete(long id) {
        currentSession.openCurrentSessionwithTransaction();
        Worker worker = getById(id);
        currentSession.getCurrentSession().delete(worker);
        currentSession.closeCurrentSessionWithTransaction();
    }

    @Override
    public Worker get(long id) {
        currentSession.openCurrentSession();
        Worker worker = (Worker) currentSession.getCurrentSession().get(Worker.class, id);
        currentSession.closeCurrentSession();
        return worker;
    }

    @Override
    public Worker getById(long id) {
        return (Worker) currentSession.getCurrentSession().get(Worker.class, id);
    }

    @Override
    public void update(Worker worker) {
        currentSession.openCurrentSessionwithTransaction();
        currentSession.getCurrentSession().update(worker);
        currentSession.closeCurrentSessionWithTransaction();
    }

    @Override
    public List<Worker> findAll(){
        currentSession.openCurrentSession();
        List<Worker> workers = (List<Worker>) currentSession.getCurrentSession().createQuery("FROM Worker ORDER BY lastname").list();
        currentSession.closeCurrentSession();
        return workers;
    }
    @Override
    public List<Worker> search(String search, String searchField){
        currentSession.openCurrentSession();
        List<Worker> workers;
            workers = (List<Worker>) currentSession.getCurrentSession().createQuery(" FROM Worker WHERE " +
                    search + " LIKE '%" + searchField + "%' ORDER BY " + search).list();
        currentSession.closeCurrentSession();
        return workers;
    }
}
