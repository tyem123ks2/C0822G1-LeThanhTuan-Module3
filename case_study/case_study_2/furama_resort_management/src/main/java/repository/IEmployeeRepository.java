package repository;

import model.person.Customer;
import model.person.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> listEmployee();

    void addNewEmployee(Employee employee);

    boolean deleteEmployee(int id);

    Customer findEmployeeById(int idSreach);

    void editEmployee(Employee employee);

    List<Employee> searchEmployee(String keySearch);
}
