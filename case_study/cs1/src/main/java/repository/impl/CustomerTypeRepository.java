package repository.impl;

import model.customer.CustomerType;
import repository.ICustomerTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepository implements ICustomerTypeRepository {
    private final String SELECT_ALL_CUSTOMER_TYPE = "SELECT * FROM customer_type";
    @Override
    public List<CustomerType> findAllCustomerType() {
        List<CustomerType> customerTypeList = new ArrayList<>();
        CustomerType customerType = null;
        Connection connection = BaseRepository.getconnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                customerType = new CustomerType(id, name);
                customerTypeList.add(customerType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerTypeList;
    }
}
