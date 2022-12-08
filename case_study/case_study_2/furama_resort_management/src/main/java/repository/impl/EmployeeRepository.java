package repository.impl;

import model.person.Customer;
import model.person.Employee;
import repository.IEmployeeRepository;

import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private String SELECT_ALL_EMPLOYEE = "select * from `employee`";
    private String ADD_NEW_EMPLOYEE = "insert into `employee` (`name`, date_of_birth, `gender`, id_card, salary, phone_number, email, address) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
    private String DELETE_EMPLOYEE = "update employee set `status` = 0 where id = ?;";
    private String FIND_EMPLOYEE_BY_ID = "select * from employee where id = ?;";
    private String EDIT_EMPLOYEE = "update employee set name = ?, date_of_birth = ?, gender = ?, id_card = ?, phone_number = ?, email = ?, address = ? " +
            "where id = ? and `status` = 1;";
    private String SRACH_EMPLOYEE = "select * from employee where customer_type_id = ?;";
    @Override
    public List<Employee> listEmployee() {
        return null;
    }

    @Override
    public void addNewEmployee(Employee employee) {

    }

    @Override
    public boolean deleteEmployee(int id) {
        return false;
    }

    @Override
    public Customer findEmployeeById(int idSreach) {
        return null;
    }

    @Override
    public void editEmployee(Employee employee) {

    }

    @Override
    public List<Employee> searchEmployee(String keySearch) {
        return null;
    }
}
