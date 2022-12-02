package service.impl;

import model.Customer;
import service.ICustomerService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements ICustomerService {
    private static Map<Integer, Customer> customers;
    static {
        customers = new HashMap<>();
        customers.put(1, new Customer(1, "Reyna", "reynavalorant@riot.com", "Mexico"));
        customers.put(2, new Customer(2, "Chamber", "chambervalorant@riot.com", "France"));
        customers.put(3, new Customer(3, "Jett", "jettvalorant@riot.com", "Korea"));
        customers.put(4, new Customer(4, "Raze", "razevalorant@riot.com", "Brazil"));
    }
    @Override
    public List<Customer> findAll() {
        return new ArrayList<>(customers.values());
    }

    @Override
    public void save(Customer customer) {
        customers.put(customer.getId(), customer);
    }

    @Override
    public Customer findById(int id) {
        return customers.get(id);
    }

    @Override
    public void update(int id, Customer customer) {
        customers.put(id, customer);
    }

    @Override
    public void remove(int id) {
        customers.remove(id);
    }
}
