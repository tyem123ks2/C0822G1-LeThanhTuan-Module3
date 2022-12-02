package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    IProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public Product findById(int id) {
        return null;
    }

    @Override
    public void add(Product product) {
        productRepository.add(product);
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public void save(Product product) {

    }
}
