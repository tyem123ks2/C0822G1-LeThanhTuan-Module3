package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    Product findById(int id);
    void add (Product product);
    boolean delete(int id);
    void save (Product product);
}
