package dao;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public User selectUserStore(int id);

    public List<User> selectAllUsers();

    public List<User> selectAllUsersStore();

    public boolean deleteUser(int id) throws SQLException;

    public boolean deleteUserStore(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    public  boolean updateUserStore(User user)  throws SQLException;

    public List<User> findUserCountry(String inputCountry) throws SQLException;

    public List<User> sortByName() throws SQLException;

    public List<User> sortByNameStore() throws SQLException;
}

