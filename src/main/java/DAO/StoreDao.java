package DAO;


import models.Store;
import models.Worker;
import org.hibernate.Session;
import org.hibernate.Transaction;
import utils.HibernateUtils;

import java.util.List;

public class StoreDao implements IDao<Store> {
    private static HibernateUtils currentSession = new HibernateUtils();


    @Override
    public void save(Store store ) {
        currentSession.openCurrentSessionwithTransaction();
        currentSession.getCurrentSession().save(store);
        currentSession.closeCurrentSessionWithTransaction();
    }

    @Override
    public void delete(long id) {
        currentSession.openCurrentSessionwithTransaction();
        Store store = getById(id);
        currentSession.getCurrentSession().delete(store);
        currentSession.closeCurrentSessionWithTransaction();
    }

    @Override
    public Store get(long id) {
        currentSession.openCurrentSession();
        Store store = (Store)  currentSession.getCurrentSession().get(Store.class, id);
        currentSession.closeCurrentSession();
        return store;
    }

    @Override
    public Store getById(long id) {
        return (Store)  currentSession.getCurrentSession().get(Store.class, id);
    }

    @Override
    public void update(Store store) {
        currentSession.openCurrentSessionwithTransaction();
        currentSession.getCurrentSession().update(store);
        currentSession.closeCurrentSessionWithTransaction();
    }

    @Override
    public List<Store> findAll(){
        currentSession.openCurrentSession();
        List<Store> stores = (List<Store>) currentSession.getCurrentSession().createQuery("FROM Store").list();
        currentSession.closeCurrentSession();
        return stores;
    }
}
