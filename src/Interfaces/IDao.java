package Interfaces;

public interface IDao<T> {
     public T findByNameAndPass(T user);
}
