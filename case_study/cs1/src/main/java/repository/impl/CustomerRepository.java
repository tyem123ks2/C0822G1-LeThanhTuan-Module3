package repository.impl;

import model.customer.Customer;
import model.customer.CustomerType;
import repository.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static final String SELECT_ALL = "select c.*,ct.name as type_name from customer c join customer_type ct on c.customer_type_id = ct.id order by c.id;";
    private static final String SELECT_CUSTOMER_TYPE = "select * from customer_type;";
    private static final String INSERT = "INSERT INTO customer (id,name, date_of_birth, gender, id_card, phone_number, email, address, customer_type_id) VALUES (id(),?,?,?,?,?,?,?,?);";
    private static final String DELETE = "delete from customer where id = ?";
    private static final String SAFE = "SET FOREIGN_KEY_CHECKS=0;";
    private static final String CONTRAINS = "set SQL_SAFE_UPDATES = 0;";
    private static final String UPDATE = "UPDATE customer set name = ?,date_of_birth = ?,gender = ?,id_card = ?,phone_number = ?, email = ?, address = ?, customer_type_id = ? where id = ?;";
    private static final String FIND_BY_NAME = "select c.*,ct.name as type_name from customer c join customer_type ct on c.customer_type_id = ct.id where c.name like ?;";

    @Override
    public List<Customer> selectAll() {
        List<Customer> customerList = new ArrayList<>();
        Customer customer = null;
        Connection connection = BaseRepository.getconnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                int idType = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("name");
                String date = resultSet.getString("date_of_birth");
                boolean gender = resultSet.getBoolean("gender");
                String iDcard = resultSet.getString("id_card");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                String typeName = resultSet.getString("type_name");
                CustomerType customerType = new CustomerType(idType, typeName);
                customer = new Customer(id, name, date, gender, iDcard, phoneNumber, email, address, customerType);
                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

    @Override
    public List<CustomerType> selectType() {
        List<CustomerType> list = new ArrayList<>();
        Connection connection = BaseRepository.getconnectDB();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_TYPE);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                CustomerType customerType = new CustomerType(id,name);
                list.add(customerType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    @Override
    public void insertCustomer(Customer customer) {
        Connection connection = BaseRepository.getconnectDB();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1,customer.getName());
            preparedStatement.setString(2,customer.getDateOfBirth());
            preparedStatement.setBoolean(3,customer.isGender());
            preparedStatement.setString(4,customer.getiDCard());
            preparedStatement.setString(5,customer.getPhoneNumber());
            preparedStatement.setString(6,customer.getEmail());
            preparedStatement.setString(7,customer.getAddress());
            preparedStatement.setInt(8,customer.getCustomerType().getId());
            preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        Connection connection = BaseRepository.getconnectDB();
        try {
            PreparedStatement statement =connection.prepareStatement(SAFE);
            statement.executeUpdate();
            PreparedStatement statement1 = connection.prepareStatement(CONTRAINS);
            statement1.executeUpdate();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void updateCustomer(Customer customer) {
        Connection connection = BaseRepository.getconnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1,customer.getName());
            preparedStatement.setString(2,customer.getDateOfBirth());
            preparedStatement.setBoolean(3,customer.isGender());
            preparedStatement.setString(4,customer.getiDCard());
            preparedStatement.setString(5,customer.getPhoneNumber());
            preparedStatement.setString(6,customer.getEmail());
            preparedStatement.setString(7,customer.getAddress());
            preparedStatement.setInt(8,customer.getCustomerType().getId());
            preparedStatement.setInt(9,customer.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Customer> findByName(String name) {
        List<Customer> list = new ArrayList<>();
        Connection connection = BaseRepository.getconnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_NAME);
            preparedStatement.setString(1,"%" + name + "%");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                int idType = rs.getInt("customer_type_id");
                String namez = rs.getString("name");
                String date = rs.getString("date_of_birth");
                boolean gender = rs.getBoolean("gender");
                String iDcard = rs.getString("id_card");
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String typeName = rs.getString("type_name");
                CustomerType customerType = new CustomerType(idType, typeName);
                Customer customer = new Customer(id, namez, date, gender, iDcard, phoneNumber, email, address, customerType);
                list.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }
}
