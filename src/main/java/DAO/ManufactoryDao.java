package DAO;

import models.Manufactory;
import models.Store;
import utils.HibernateUtils;

import java.util.List;

public class ManufactoryDao implements IDao<Manufactory> {
    private static HibernateUtils currentSession = new HibernateUtils();
    

    @Override
    public void save(Manufactory manufactory) {
        currentSession.openCurrentSessionwithTransaction();
        currentSession.getCurrentSession().save(manufactory);
        currentSession.closeCurrentSessionWithTransaction();
    }
    
    @Override
    public void delete(long id) {
        currentSession.openCurrentSessionwithTransaction();
        Manufactory manufactory = getById(id);
        currentSession.getCurrentSession().delete(manufactory);
        currentSession.closeCurrentSessionWithTransaction();
    }
    
    @Override
    public Manufactory get(long id) {
        currentSession.openCurrentSession();
        Manufactory manufactory = (Manufactory) currentSession.getCurrentSession().get(Manufactory.class, id);
        currentSession.closeCurrentSession();
        return manufactory;
    }

    @Override
    public Manufactory getById(long id) {
        return (Manufactory) currentSession.getCurrentSession().get(Manufactory.class, id);
    }

    @Override
    public void update(Manufactory manufactory) {
        currentSession.openCurrentSessionwithTransaction();
        currentSession.getCurrentSession().update(manufactory);
        currentSession.closeCurrentSessionWithTransaction();
    }
    
    @Override
    public List<Manufactory> findAll(){
        currentSession.openCurrentSession();
        List<Manufactory> manufactories = (List<Manufactory>) currentSession.getCurrentSession().createQuery("FROM Manufactory ORDER BY placeOfWorkName").list();
        currentSession.closeCurrentSession();
        return manufactories;
    }

    @Override
    public List<Manufactory> search(String search, String searchField) {
        currentSession.openCurrentSession();
        List<Manufactory> manufactories;
        manufactories = (List<Manufactory>) currentSession.getCurrentSession().createQuery(" FROM Manufactory WHERE " +
                search + " LIKE '%" + searchField + "%' ORDER BY " + search).list();
        currentSession.closeCurrentSession();
        return manufactories;
    }
}
