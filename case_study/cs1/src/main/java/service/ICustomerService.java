package service;

import model.customer.Customer;
import model.customer.CustomerType;

import java.util.List;

public interface ICustomerService {
    List<Customer> selectAll();

    List<CustomerType> selectType();

    boolean insertCustomer(Customer customer);

    boolean delete(int id);

    boolean updateCustomer(Customer customer);

    List<Customer> findByName(String name);
}
