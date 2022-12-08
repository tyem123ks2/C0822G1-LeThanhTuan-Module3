package service.impl;

import model.person.Customer;
import model.person.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepository;
import service.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    private IEmployeeRepository employeeRepository = new EmployeeRepository();

    @Override
    public List<Employee> listEmployee() {
        return this.employeeRepository.listEmployee();
    }

    @Override
    public void addNewEmployee(Employee employee) {
        this.employeeRepository.addNewEmployee(employee);
    }

    @Override
    public boolean deleteEmployee(int id) {
        return this.employeeRepository.deleteEmployee(id);
    }

    @Override
    public Customer findEmployeeById(int idSreach) {
        return this.employeeRepository.findEmployeeById(idSreach);
    }

    @Override
    public void editEmployee(Employee employee) {
        this.employeeRepository.editEmployee(employee);
    }

    @Override
    public List<Employee> searchEmployee(String keySearch) {
        return this.employeeRepository.searchEmployee(keySearch);
    }
}
