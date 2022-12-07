package service;

import model.person.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> listCustomer();

    void addNewCustomer(Customer customer);

    boolean deleteCustomer(int id);

    Customer findCustommerById(int idSreach);

    void editCustomer(Customer customer);

    List<Customer> searchCustomer(String keySearch);
}
