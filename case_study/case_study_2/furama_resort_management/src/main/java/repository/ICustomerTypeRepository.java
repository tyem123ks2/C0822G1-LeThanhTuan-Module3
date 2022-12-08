package repository;

import model.person.CustomerType;

import java.util.List;

public interface ICustomerTypeRepository {
    List<CustomerType> customerTypeList();

    List<CustomerType> getAllCustomerType();

    String getCustomerTypeName(int id);

    int getCustomerTypeId(String name);
}
