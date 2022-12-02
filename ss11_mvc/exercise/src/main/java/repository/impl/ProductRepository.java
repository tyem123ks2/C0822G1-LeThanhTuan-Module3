package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(1, "Phantom", 2900, "Silent", "RiotGames"));
        productList.add(new Product(2, "Vandal", 2900, "Heavy", "RiotGames"));
        productList.add(new Product(3, "Operator", 4700, "OneTab", "RiotGames"));
    }
    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public Product findById(int id) {
        return null;
    }

    @Override
    public void add(Product product) {
        productList.add(product);
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public void save(Product product) {

    }
}
