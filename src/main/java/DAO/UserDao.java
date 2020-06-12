package DAO;

import models.User;
import utils.HibernateUtils;

import java.util.List;

public class UserDao implements IDao<User>{
    HibernateUtils currentSession = new HibernateUtils();

    @Override
    public void save(User user) {
        currentSession.openCurrentSessionwithTransaction();
        currentSession.getCurrentSession().save(user);
        currentSession.closeCurrentSessionWithTransaction();
    }

    @Override
    public void delete(long id) {
        currentSession.openCurrentSessionwithTransaction();
        User user = getById(id);
        currentSession.getCurrentSession().delete(user);
        currentSession.closeCurrentSessionWithTransaction();
    }

    @Override
    public User get(long id) {
        currentSession.openCurrentSession();
        User user = (User) currentSession.getCurrentSession().get(User.class, id);
        currentSession.closeCurrentSession();
        return user;
    }

    @Override
    public User getById(long id) {
        return (User) currentSession.getCurrentSession().get(User.class, id);
    }

    @Override
    public void update(User user) {
        currentSession.openCurrentSessionwithTransaction();
        currentSession.getCurrentSession().update(user);
        currentSession.closeCurrentSessionWithTransaction();
    }

    @Override
    public List<User> findAll(){
        currentSession.openCurrentSession();
        List<User> users;
        users = (List<User>) currentSession.getCurrentSession().createQuery("FROM User ORDER BY idUser").list();
        currentSession.closeCurrentSession();
        return users;
    }
    @Override
    public List<User> search(String search, String searchField){
        currentSession.openCurrentSession();
        List<User> users;
        users = (List<User>) currentSession.getCurrentSession().createQuery(" FROM User WHERE " +
                search + " LIKE '%" + searchField + "%' ORDER BY " + search).list();
        currentSession.closeCurrentSession();
        return users;
    }

    public User login(String username, String password){
        currentSession.openCurrentSession();
        User user;
        try {
            user = (User) currentSession.getCurrentSession().createQuery("FROM User WHERE username = '" + username + "' AND" +
                    " password = '" + password + "'").uniqueResult();
        } catch (IllegalArgumentException ex) {
            currentSession.closeCurrentSession();
            return null;
        }
        return user;
    }
    public User getByUsername(String username) {
        currentSession.openCurrentSession();
        User user = (User) currentSession.getCurrentSession().createQuery("FROM User WHERE username = '" + username + "'").uniqueResult();
        currentSession.closeCurrentSession();
        return user;
    }
}
