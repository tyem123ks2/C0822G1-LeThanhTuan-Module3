package repository;

import model.customer.Customer;
import model.customer.CustomerType;

import java.util.List;

public interface ICustomerRepository {

    List<Customer> selectAll();

    List<CustomerType> selectType();

    void insertCustomer(Customer customer);

    void delete(int id);

    void updateCustomer(Customer customer);

    List<Customer> findByName(String name);
}
