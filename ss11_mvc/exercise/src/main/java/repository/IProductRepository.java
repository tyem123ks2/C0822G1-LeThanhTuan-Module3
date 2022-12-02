package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();
    Product findById(int id);
    void save (Product product);
    void add (Product product);
    boolean delete(int id);
}
