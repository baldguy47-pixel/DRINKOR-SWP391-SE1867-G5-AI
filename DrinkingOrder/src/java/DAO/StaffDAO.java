package DAO;

import Model.Staff;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class StaffDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public StaffDAO() {
        try {
            // Initialize the connection in the constructor
            conn = new DBContext().getConnection();
        } catch (Exception ex) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Create (Register)
    public boolean registerStaff(Staff staff) {
        String query = "INSERT INTO [Staff] (Email, Password, Fullname, Gender, Address, Phone, Role, CreatedBy, Avatar) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, staff.getEmail());
            ps.setString(2, staff.getPassword());
            ps.setString(3, staff.getFullname());
            ps.setString(4, staff.getGender());
            ps.setString(5, staff.getAddress());
            ps.setString(6, staff.getPhone());
            ps.setInt(7, staff.getRole());
            ps.setInt(8, staff.getCreatedBy());
            ps.setString(9, staff.getAvatar());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return false;
    }

    // Read (Get Staff by Id)
    public Staff getStaffById(int id) {
        String query = "SELECT * FROM [Staff] WHERE ID = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Staff staff = new Staff();
                staff.setId(rs.getInt("ID"));
                staff.setEmail(rs.getString("Email"));
                staff.setPassword(rs.getString("Password"));
                staff.setFullname(rs.getString("Fullname"));
                staff.setGender(rs.getString("Gender"));
                staff.setAddress(rs.getString("Address"));
                staff.setPhone(rs.getString("Phone"));
                staff.setRole(rs.getInt("Role"));
                staff.setIsDeleted(rs.getBoolean("IsDeleted"));
                staff.setCreatedAt(rs.getDate("CreatedAt"));
                staff.setCreatedBy(rs.getInt("CreatedBy"));
                staff.setAvatar(rs.getString("Avatar"));
                return staff;
            }
        } catch (SQLException e) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return null;
    }

    // Read (Get Staff by Email)
    public Staff getStaffByEmail(String email) {
        String query = "SELECT * FROM [Staff] WHERE Email = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                Staff staff = new Staff();
                staff.setId(rs.getInt("ID"));
                staff.setEmail(rs.getString("Email"));
                staff.setPassword(rs.getString("Password"));
                staff.setFullname(rs.getString("Fullname"));
                staff.setGender(rs.getString("Gender"));
                staff.setAddress(rs.getString("Address"));
                staff.setPhone(rs.getString("Phone"));
                staff.setRole(rs.getInt("Role"));
                staff.setIsDeleted(rs.getBoolean("IsDeleted"));
                staff.setCreatedAt(rs.getDate("CreatedAt"));
                staff.setCreatedBy(rs.getInt("CreatedBy"));
                staff.setAvatar(rs.getString("Avatar"));
                return staff;
            }
        } catch (SQLException e) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return null;
    }

    // Get all staff with pagination
    public List<Staff> getAllStaff(int pageNumber, int pageSize) {
        List<Staff> staffList = new ArrayList<>();
        String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY ID) AS RowNum, * FROM [Staff]) AS SubQuery WHERE RowNum BETWEEN ? AND ?";
        int startIndex = (pageNumber - 1) * pageSize + 1;
        int endIndex = pageNumber * pageSize;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, startIndex);
            ps.setInt(2, endIndex);
            rs = ps.executeQuery();
            while (rs.next()) {
                Staff staff = new Staff();
                staff.setId(rs.getInt("ID"));
                staff.setEmail(rs.getString("Email"));
                staff.setPassword(rs.getString("Password"));
                staff.setFullname(rs.getString("Fullname"));
                staff.setGender(rs.getString("Gender"));
                staff.setAddress(rs.getString("Address"));
                staff.setPhone(rs.getString("Phone"));
                staff.setRole(rs.getInt("Role"));
                staff.setIsDeleted(rs.getBoolean("IsDeleted"));
                staff.setCreatedAt(rs.getDate("CreatedAt"));
                staff.setCreatedBy(rs.getInt("CreatedBy"));
                staff.setAvatar(rs.getString("Avatar"));
                staffList.add(staff);
            }
        } catch (SQLException e) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return staffList;
    }

    // Get all staff with pagination
    public List<Staff> getAllStaff() {
        List<Staff> staffList = new ArrayList<>();
        String query = "SELECT * FROM [Staff]";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Staff staff = new Staff();
                staff.setId(rs.getInt("ID"));
                staff.setEmail(rs.getString("Email"));
                staff.setPassword(rs.getString("Password"));
                staff.setFullname(rs.getString("Fullname"));
                staff.setGender(rs.getString("Gender"));
                staff.setAddress(rs.getString("Address"));
                staff.setPhone(rs.getString("Phone"));
                staff.setRole(rs.getInt("Role"));
                staff.setIsDeleted(rs.getBoolean("IsDeleted"));
                staff.setCreatedAt(rs.getDate("CreatedAt"));
                staff.setCreatedBy(rs.getInt("CreatedBy"));
                staff.setAvatar(rs.getString("Avatar"));
                staffList.add(staff);
            }
        } catch (SQLException e) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return staffList;
    }

    public List<Staff> getFilteredStaff(String fullName, String email, String phone, int role, String gender, Boolean isDeleted, int pageNumber, int pageSize) {
        List<Staff> filteredUserList = new ArrayList<>();
        String query = "SELECT * FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY ID) AS RowNum FROM [Staff] WHERE 1=1";
        // Add filter conditions
        if (fullName != null && !fullName.isEmpty()) {
            query += " AND Fullname LIKE '%" + fullName + "%'";
        }
        if (email != null && !email.isEmpty()) {
            query += " AND Email LIKE '%" + email + "%'";
        }
        if (phone != null && !phone.isEmpty()) {
            query += " AND Phone LIKE '%" + phone + "%'";
        }
        if (role != -1) {
            query += " AND Role = " + role;
        }
        if (gender != null && !gender.isEmpty()) {
            query += " AND Gender = '" + gender + "'";
        }
        if (isDeleted != null) {
            query += "AND IsDeleted = " + (isDeleted ? "1" : "0");
        }
        // Add pagination
        query += ") AS SubQuery WHERE RowNum BETWEEN ? AND ?";
        int startIndex = (pageNumber - 1) * pageSize + 1;
        int endIndex = pageNumber * pageSize;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, startIndex);
            ps.setInt(2, endIndex);
            rs = ps.executeQuery();
            while (rs.next()) {
                Staff staff = new Staff();
                staff.setId(rs.getInt("ID"));
                staff.setEmail(rs.getString("Email"));
                staff.setPassword(rs.getString("Password"));
                staff.setFullname(rs.getString("Fullname"));
                staff.setGender(rs.getString("Gender"));
                staff.setAddress(rs.getString("Address"));
                staff.setPhone(rs.getString("Phone"));
                staff.setRole(rs.getInt("Role"));
                staff.setIsDeleted(rs.getBoolean("IsDeleted"));
                staff.setCreatedAt(rs.getDate("CreatedAt"));
                staff.setCreatedBy(rs.getInt("CreatedBy"));
                staff.setAvatar(rs.getString("Avatar"));
                filteredUserList.add(staff);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return filteredUserList;
    }
    
    public List<Staff> getFilteredStaff(String fullName, String email, int role, String gender, Boolean isDeleted) {
        List<Staff> filteredUserList = new ArrayList<>();
        String query = "SELECT * FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY ID) AS RowNum FROM [Staff] WHERE 1=1";
        // Add filter conditions
        if (fullName != null && !fullName.isEmpty()) {
            query += " AND Fullname LIKE '%" + fullName + "%'";
        }
        if (email != null && !email.isEmpty()) {
            query += " AND Email LIKE '%" + email + "%'";
        }
        if (role != -1) {
            query += " AND Role = " + role;
        }
        if (gender != null && !gender.isEmpty()) {
            query += " AND Gender LIKE '%" + gender + "%'";
        }
        if (isDeleted != null) {
            query += "AND IsDeleted = " + (isDeleted ? "1" : "0");
        }
        // Add pagination
        query += ") AS SubQuery";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Staff staff = new Staff();
                staff.setId(rs.getInt("ID"));
                staff.setEmail(rs.getString("Email"));
                staff.setPassword(rs.getString("Password"));
                staff.setFullname(rs.getString("Fullname"));
                staff.setGender(rs.getString("Gender"));
                staff.setAddress(rs.getString("Address"));
                staff.setPhone(rs.getString("Phone"));
                staff.setRole(rs.getInt("Role"));
                staff.setIsDeleted(rs.getBoolean("IsDeleted"));
                staff.setCreatedAt(rs.getDate("CreatedAt"));
                staff.setCreatedBy(rs.getInt("CreatedBy"));
                staff.setAvatar(rs.getString("Avatar"));
                filteredUserList.add(staff);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return filteredUserList;
    }

    // Update (Update Staff)
    public boolean updateStaff(Staff staff) {
        String query = "UPDATE [Staff] SET Email=?, Password=?, Fullname=?, Gender=?, Address=?, Phone=?, Role=?, IsDeleted=?, CreatedBy=?, Avatar=? WHERE ID=?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, staff.getEmail());
            ps.setString(2, staff.getPassword());
            ps.setString(3, staff.getFullname());
            ps.setString(4, staff.getGender());
            ps.setString(5, staff.getAddress());
            ps.setString(6, staff.getPhone());
            ps.setInt(7, staff.getRole());
            ps.setBoolean(8, staff.isIsDeleted());
            ps.setInt(9, staff.getCreatedBy());
            ps.setString(10, staff.getAvatar());
            ps.setInt(11, staff.getId());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return false;
    }

    // Delete (Delete Staff)
    public boolean deleteStaff(int staffID) {
        String query = "DELETE FROM [Staff] WHERE ID=?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, staffID);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return false;
    }

    // Login
    public Staff loginStaff(String email, String password) {
        String query = "SELECT * FROM [Staff] WHERE Email = ? AND Password = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                Staff staff = new Staff();
                staff.setId(rs.getInt("ID"));
                staff.setEmail(rs.getString("Email"));
                staff.setPassword(rs.getString("Password"));
                staff.setFullname(rs.getString("Fullname"));
                staff.setGender(rs.getString("Gender"));
                staff.setAddress(rs.getString("Address"));
                staff.setPhone(rs.getString("Phone"));
                staff.setRole(rs.getInt("Role"));
                staff.setIsDeleted(rs.getBoolean("IsDeleted"));
                staff.setCreatedAt(rs.getDate("CreatedAt"));
                staff.setCreatedBy(rs.getInt("CreatedBy"));
                staff.setAvatar(rs.getString("Avatar"));
                return staff;
            }
        } catch (SQLException e) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return null;
    }

    private void closeResources() {

    }
}
