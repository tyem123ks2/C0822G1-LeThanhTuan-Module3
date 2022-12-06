package repository;

import model.person.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> listCustomer();

    void addNewCustomer(Customer customer);

    boolean deleteCustomer(int id);

    Customer findCustommerById(int idSreach);

    void editCustomer(Customer customer);

    List<Customer> sreachCustomer(String keySreach);
}
