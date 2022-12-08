package repository.impl;

import model.person.Customer;
import model.person.CustomerType;
import repository.ICustomerTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepository implements ICustomerTypeRepository {
    private String SELECT_ALL_CUSTOMER_TYPE = "select * from `customer_type`";

    @Override
    public List<CustomerType> customerTypeList() {
        List<CustomerType> customerTypeList = new ArrayList<>();
        CustomerType customerType = null;
        Connection connection = MainRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int customerTypeId = resultSet.getInt("id");
                String customerTypeName = resultSet.getString("name");
                customerType = new CustomerType(customerTypeId, customerTypeName);
                customerTypeList.add(customerType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerTypeList;
    }

    @Override
    public List<CustomerType> getAllCustomerType() {
        List<CustomerType> customerTypes = new ArrayList<>();
        Connection connection = MainRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from customer_type");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                customerTypes.add(new CustomerType(resultSet.getInt(1), resultSet.getString(2)));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerTypes;
    }

    @Override
    public String getCustomerTypeName(int id) {
        List<CustomerType> customerTypes = new ArrayList<>();
        for (CustomerType customer : customerTypes) {
            if (customer.getId() == id) {
                return customer.getName();
            }
        }
        return null;
    }

    @Override
    public int getCustomerTypeId(String name) {
        List<CustomerType> customerTypes = new ArrayList<>();
        for (CustomerType customer: customerTypes) {
            if(customer.getName().equals(name)){
                return customer.getId();
            }
        }
        return -1;
    }
}
