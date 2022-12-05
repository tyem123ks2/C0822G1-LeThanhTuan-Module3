package com.codegym.dao;

import com.codegym.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    User findbyCountry (String country);

    public List<User> selectAllUsers();

    public boolean updateUser(User user) throws SQLException;

    User getUserById(int id);

    void insertUserStore(User user) throws SQLException;

    public boolean deleteUser(int id) throws SQLException;

    void addUserTransaction(User user, int[] permision);

    public void insertUpdateUseTransaction();

}
