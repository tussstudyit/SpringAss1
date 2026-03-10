package com.aipo.repository;

import com.aipo.config.DBConnection;
import com.aipo.entity.User;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@Repository
public class UserRepository {
    public List<User> findAll() {

        List<User> users = new ArrayList<>();

        String sql = "SELECT * FROM turbine_user";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);

            rs = ps.executeQuery();

            while (rs.next()) {

                User user = new User();

                user.setId(rs.getInt("user_id"));
                user.setLoginName(rs.getString("login_name"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setDisabled(rs.getString("disabled"));

                users.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return users;
    }

    public User findById(int id) {

        String sql = "SELECT * FROM turbine_user WHERE user_id = ?";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            rs = ps.executeQuery();

            if (rs.next()) {

                User user = new User();

                user.setId(rs.getInt("user_id"));
                user.setLoginName(rs.getString("login_name"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setDisabled(rs.getString("disabled"));

                return user;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return null;
    }

    public void save(User user) {

        String sql = "INSERT INTO turbine_user(login_name,password_value,first_name,last_name,email) VALUES (?,?,?,?,?)";

        Connection conn = null;
        PreparedStatement ps = null;

        try {

            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);

            ps.setString(1, user.getLoginName());
            ps.setString(2, user.getPassword() != null ? user.getPassword() : "123456");
            ps.setString(3, user.getFirstName());
            ps.setString(4, user.getLastName());
            ps.setString(5, user.getEmail());

            int result = ps.executeUpdate();
            System.out.println("Insert result: " + result + " rows affected");

            if (result > 0) {
                System.out.println("User saved successfully: " + user.getLoginName());
            } else {
                System.out.println("Failed to save user: " + user.getLoginName());
            }

        } catch (Exception e) {
            System.out.println("Error saving user: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void deleteById(int id) {

        String sql = "DELETE FROM turbine_user WHERE user_id = ?";

        Connection conn = null;
        PreparedStatement ps = null;

        try {

            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            int result = ps.executeUpdate();
            System.out.println("Delete result: " + result + " rows affected");

        } catch (Exception e) {
            System.out.println("Error deleting user: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void enableUser(int id) {

        String sql = "UPDATE turbine_user SET disabled='F' WHERE user_id=?";

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            int result = ps.executeUpdate();
            System.out.println("Enable user result: " + result + " rows affected");

        } catch (Exception e) {
            System.out.println("Error enabling user: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void disableUser(int id) {

        String sql = "UPDATE turbine_user SET disabled='T' WHERE user_id=?";

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            int result = ps.executeUpdate();
            System.out.println("Disable user result: " + result + " rows affected");

        } catch (Exception e) {
            System.out.println("Error disabling user: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}