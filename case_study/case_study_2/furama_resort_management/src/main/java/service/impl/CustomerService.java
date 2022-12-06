package service.impl;

import model.person.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> listCustomer() {
        return this.customerRepository.listCustomer();
    }

    @Override
    public void addNewCustomer(Customer customer) {
        this.customerRepository.addNewCustomer(customer);
    }

    @Override
    public boolean deleteCustomer(int idDelete) {
        return customerRepository.deleteCustomer(idDelete);
    }

    @Override
    public Customer findCustommerById(int idSreach) {
        return this.customerRepository.findCustommerById(idSreach);
    }

    @Override
    public void editCustomer(Customer customer) {
        this.customerRepository.editCustomer(customer);
    }

    @Override
    public List<Customer> sreachCustomer(String keySreach) {
        return this.customerRepository.sreachCustomer(keySreach);
    }
}
