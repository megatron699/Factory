package DAO;

import java.util.List;

public interface IDao<T> {
    void save(T entity);

    void delete(long id);

    T get(long id);

    void update(T t);

    T getById(long id);

    List<T> findAll();

    List<T> search(String search, String searchField);
}
