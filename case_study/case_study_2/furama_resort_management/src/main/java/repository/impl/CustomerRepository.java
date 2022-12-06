package repository.impl;

import model.person.Customer;
import repository.ICustomerRepository;

import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private String SELECT_ALL_CUSTOMER = "select * from `customer`";
    private String ADD_NEW_CUSTOMER = "insert into furama_resort_management (customer_type_id, `name`, date_of_birth, `gender`, id_card, phone_number, email, address) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    private String
    @Override
    public List<Customer> listCustomer() {
        return null;
    }

    @Override
    public void addNewCustomer(Customer customer) {

    }

    @Override
    public boolean deleteCustomer(int id) {
        return false;
    }

    @Override
    public Customer findCustommerById(int idSreach) {
        return null;
    }

    @Override
    public void editCustomer(Customer customer) {

    }

    @Override
    public List<Customer> sreachCustomer(String keySreach) {
        return null;
    }
}
