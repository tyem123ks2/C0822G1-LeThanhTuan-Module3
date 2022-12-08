package service.impl;

import model.customer.Customer;
import model.customer.CustomerType;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> selectAll() {
        return this.customerRepository.selectAll();
    }

    @Override
    public List<CustomerType> selectType() {
        return this.customerRepository.selectType();
    }

    @Override
    public boolean insertCustomer(Customer customer) {
        this.customerRepository.insertCustomer(customer);
        return false;
    }

    @Override
    public boolean delete(int id) {
        this.customerRepository.delete(id);
        return false;
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        this.customerRepository.updateCustomer(customer);
        return false;
    }

    @Override
    public List<Customer> findByName(String name) {
        return this.customerRepository.findByName(name);
    }
}
