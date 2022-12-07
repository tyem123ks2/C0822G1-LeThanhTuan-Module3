package repository.impl;

import model.person.Customer;
import repository.ICustomerRepository;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private String SELECT_ALL_CUSTOMER = "select * from `customer`";
    private String ADD_NEW_CUSTOMER = "insert into furama_resort_management (customer_type_id, `name`, date_of_birth, `gender`, id_card, phone_number, email, address) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
    private String DELETE_CUSTOMER = "update customer set `status` = 0 where id = ?;";
    private String FIND_CUSTOMER_BY_ID = "select * from customer where id = ?;";
    private String EDIT_CUSTOMER = "update customer set name = ?, date_of_birth = ?, gender = ?, id_card = ?, phone_number = ?, email = ?, address = ? " +
            "where id = ? and `status` = 1;";
    private String SRACH_CUSTOMER = "select * from customer where customer_type_id = ?;";
    @Override
    public List<Customer> listCustomer() {
        List<Customer> customerList = new ArrayList<>();
        Customer customer = null;
        Connection connection = MainRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int customerId = resultSet.getInt("id");
                String typeCustomer = resultSet.getString("customer_type");
                String name = resultSet.getString("name");
                LocalDate birthDay = LocalDate.parse(resultSet.getString("date_of_birth"));
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String phone = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                customer = new Customer(name, birthDay, gender, idCard, phone, email, customerId, typeCustomer, address);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public void addNewCustomer(Customer customer) {
        Connection connection = MainRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_NEW_CUSTOMER);
            preparedStatement.setInt(1, Integer.parseInt(customer.getCustomerType()));
            preparedStatement.setString(2,customer.getName());
            preparedStatement.setDate(3, Date.valueOf(customer.getBirthday()));
            preparedStatement.setBoolean(4, customer.getGender());
            preparedStatement.setString(5,customer.getId());
            preparedStatement.setString(6,customer.getPhoneNumber());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public boolean deleteCustomer(int id) {
        Connection connection = MainRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_CUSTOMER);
            callableStatement.setInt(1,id);
            return callableStatement.executeUpdate() > 0;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public Customer findCustommerById(int idSreach) {
        Customer customer = null;
        Connection connection = MainRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_CUSTOMER_BY_ID);
            preparedStatement.setInt(1, idSreach);
            preparedStatement.executeQuery();
            ResultSet resultSet = preparedStatement.getResultSet();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                LocalDate birthDay = LocalDate.parse(resultSet.getString("date_of_birth"));
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String phone = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                int customerId = resultSet.getInt("id");
                String customerType = resultSet.getString("customer_type_id");
                String address = resultSet.getString("address");
                customer = new Customer(name, birthDay, gender, idCard, phone, email, customerId, customerType, address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    @Override
    public void editCustomer(Customer customer) {
        Connection connection = MainRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(EDIT_CUSTOMER);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setDate(2, Date.valueOf(customer.getBirthday()));
            preparedStatement.setBoolean(3,customer.getGender());
            preparedStatement.setString(4, customer.getId());
            preparedStatement.setString(5, customer.getPhoneNumber());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getAddress());
            preparedStatement.setInt(8, customer.getCustomerID());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Customer> sreachCustomer(String keySreach) {
       List<Customer> customerList = new ArrayList<>();
       Customer customer = null;
       Connection connection = MainRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SRACH_CUSTOMER);
            preparedStatement.setString(1, keySreach);
            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getResultSet();
            while (resultSet.next()) {
//                customer_type_id, `name`, date_of_birth, gender, id_card, phone_number, email, address
                String name = resultSet.getString("customer_name");
                LocalDate birthDay = LocalDate.parse(resultSet.getString("date_of_birth"));
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String phone = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                int customerId = resultSet.getInt("id");
                String customerType = resultSet.getString("customer_type_name");
                String address = resultSet.getString("address");
                customer = new Customer(name, birthDay, gender, idCard, phone, email, customerId, customerType, address);
                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }
}
