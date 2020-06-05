package DAO;

import models.PlaceOfWork;
import models.PlaceOfWork;
import utils.HibernateUtils;

import java.util.List;

public class PlaceOfWorkDao implements IDao<PlaceOfWork> {
    private static HibernateUtils currentSession = new HibernateUtils();

    @Override
    public void save(PlaceOfWork placeOfWork) {
        currentSession.openCurrentSessionwithTransaction();
        currentSession.getCurrentSession().save(placeOfWork);
        currentSession.closeCurrentSessionWithTransaction();
    }

    @Override
    public void delete(long id) {
        currentSession.openCurrentSessionwithTransaction();
        PlaceOfWork placeOfWork = getById(id);
        currentSession.getCurrentSession().delete(placeOfWork);
        currentSession.closeCurrentSessionWithTransaction();
    }

    @Override
    public PlaceOfWork get(long id) {
        currentSession.openCurrentSession();
        PlaceOfWork placeOfWork = (PlaceOfWork) currentSession.getCurrentSession().get(PlaceOfWork.class, id);
        currentSession.closeCurrentSession();
        return placeOfWork;
    }

    @Override
    public PlaceOfWork getById(long id) {
        return (PlaceOfWork) currentSession.getCurrentSession().get(PlaceOfWork.class, id);
    }

    @Override
    public void update(PlaceOfWork placeOfWork) {
        currentSession.openCurrentSessionwithTransaction();
        currentSession.getCurrentSession().update(placeOfWork);
        currentSession.closeCurrentSessionWithTransaction();
    }

    @Override
    public List<PlaceOfWork> findAll(){
        currentSession.openCurrentSession();
        List<PlaceOfWork> placeOfWorks = (List<PlaceOfWork>) currentSession.getCurrentSession().createQuery("FROM PlaceOfWork ORDER BY placeOfWorkName").list();
        currentSession.closeCurrentSession();
        return placeOfWorks;
    }

    @Override
    public List<PlaceOfWork> search(String search, String searchField) {
        return null;
    }

/*    public String getPlaceOfWorkType(long id){
        currentSession.openCurrentSession();
        String placeOfWorkType = currentSession.getCurrentSession().createQuery("SELECT place_of_work_type" +
                " FROM PlaceOfWork WHERE id_place_of_work = " + id).toString();
        currentSession.closeCurrentSession();
        return placeOfWorkType;
    }*/
}
