package DAO;

import models.AssignmentOfManufactory;
import utils.HibernateUtils;

import java.util.List;

public class AssignmentOfManufactoryDao implements IDao<AssignmentOfManufactory> {
    private static HibernateUtils currentSession = new HibernateUtils();


    @Override
    public void save(AssignmentOfManufactory assignmentOfManufactory) {
        currentSession.openCurrentSessionwithTransaction();
        currentSession.getCurrentSession().save(assignmentOfManufactory);
        currentSession.closeCurrentSessionWithTransaction();
    }

    @Override
    public void delete(long id) {
        currentSession.openCurrentSessionwithTransaction();
        AssignmentOfManufactory assignmentOfManufactory = getById(id);
        currentSession.getCurrentSession().delete(assignmentOfManufactory);
        currentSession.closeCurrentSessionWithTransaction();
    }

    @Override
    public AssignmentOfManufactory get(long id) {
        currentSession.openCurrentSession();
        AssignmentOfManufactory assignmentOfManufactory = (AssignmentOfManufactory) currentSession.getCurrentSession().get(AssignmentOfManufactory.class, id);
        currentSession.closeCurrentSession();
        return assignmentOfManufactory;
    }

    @Override
    public AssignmentOfManufactory getById(long id) {
        return (AssignmentOfManufactory) currentSession.getCurrentSession().get(AssignmentOfManufactory.class, id);
    }

    @Override
    public void update(AssignmentOfManufactory assignmentOfManufactory) {
        currentSession.openCurrentSessionwithTransaction();
        currentSession.getCurrentSession().update(assignmentOfManufactory);
        currentSession.closeCurrentSessionWithTransaction();
    }

    @Override
    public List<AssignmentOfManufactory> findAll(){
        currentSession.openCurrentSession();
        List<AssignmentOfManufactory> assignmentOfManufactories = currentSession.getCurrentSession().createCriteria(AssignmentOfManufactory.class).list();
        currentSession.closeCurrentSession();
        return assignmentOfManufactories;
    }
}
