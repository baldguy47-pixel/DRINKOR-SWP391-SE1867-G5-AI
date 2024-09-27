package DAO;

import Model.Slider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SliderDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public SliderDAO() {
        try {
            // Initialize the connection in the constructor
            conn = new DBContext().getConnection();
        } catch (Exception ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Create (Add new Slider)
    public boolean addSlider(Slider slider) {
        String query = "INSERT INTO [Slider] (ImageUrl, IsDeleted, CreatedAt, CreatedBy, Title, Notes, Backlink) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, slider.getImageUrl());
            ps.setBoolean(2, slider.isIsDeleted());
            ps.setDate(3, new java.sql.Date(slider.getCreatedAt().getTime()));
            ps.setInt(4, slider.getCreatedBy());
            ps.setString(5, slider.getTitle());
            ps.setString(6, slider.getNotes());
            ps.setString(7, slider.getBacklink());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    // Read (Get Slider by Id)
    public Slider getSliderById(int id) {
        String query = "SELECT * FROM [Slider] WHERE ID = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Slider slider = new Slider();
                slider.setId(rs.getInt("ID"));
                slider.setImageUrl(rs.getString("ImageUrl"));
                slider.setIsDeleted(rs.getBoolean("IsDeleted"));
                slider.setCreatedAt(rs.getDate("CreatedAt"));
                slider.setCreatedBy(rs.getInt("CreatedBy"));
                slider.setTitle(rs.getString("Title"));
                slider.setNotes(rs.getString("Notes"));
                slider.setBacklink(rs.getString("Backlink"));
                return slider;
            }
        } catch (SQLException e) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    // Read (Get all Sliders with pagination)
    public List<Slider> getAllSliders(int pageNumber, int pageSize) {
        List<Slider> sliderList = new ArrayList<>();
        String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY ID) AS RowNum, * FROM [Slider]) AS SubQuery WHERE RowNum BETWEEN ? AND ?";
        int startIndex = (pageNumber - 1) * pageSize + 1;
        int endIndex = pageNumber * pageSize;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, startIndex);
            ps.setInt(2, endIndex);
            rs = ps.executeQuery();
            while (rs.next()) {
                Slider slider = new Slider();
                slider.setId(rs.getInt("ID"));
                slider.setImageUrl(rs.getString("ImageUrl"));
                slider.setIsDeleted(rs.getBoolean("IsDeleted"));
                slider.setCreatedAt(rs.getDate("CreatedAt"));
                slider.setCreatedBy(rs.getInt("CreatedBy"));
                slider.setTitle(rs.getString("Title"));
                slider.setNotes(rs.getString("Notes"));
                slider.setBacklink(rs.getString("Backlink"));
                sliderList.add(slider);
            }
        } catch (SQLException e) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return sliderList;
    }
    
    // Read (Get all Sliders with pagination)
    public List<Slider> getAllSliders() {
        List<Slider> sliderList = new ArrayList<>();
        String query = "SELECT * FROM [Slider] where [IsDeleted] = 0";

        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Slider slider = new Slider();
                slider.setId(rs.getInt("ID"));
                slider.setImageUrl(rs.getString("ImageUrl"));
                slider.setIsDeleted(rs.getBoolean("IsDeleted"));
                slider.setCreatedAt(rs.getDate("CreatedAt"));
                slider.setCreatedBy(rs.getInt("CreatedBy"));
                slider.setTitle(rs.getString("Title"));
                slider.setNotes(rs.getString("Notes"));
                slider.setBacklink(rs.getString("Backlink"));
                sliderList.add(slider);
            }
        } catch (SQLException e) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return sliderList;
    }

    // Read (Get filtered Sliders with pagination)
    public List<Slider> getFilteredSliders(String searchText, Boolean isDeleted, int pageNumber, int pageSize) {
        List<Slider> sliderList = new ArrayList<>();
        StringBuilder queryBuilder = new StringBuilder("SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY ID) AS RowNum, * FROM [Slider] WHERE 1=1");
        
        if (searchText != null && !searchText.isEmpty()) {
            queryBuilder.append(" AND Title LIKE ?");
        }
        if (isDeleted != null) {
            queryBuilder.append(" AND IsDeleted = ?");
        }
        
        queryBuilder.append(") AS SubQuery WHERE RowNum BETWEEN ? AND ?");

        String query = queryBuilder.toString();
        int startIndex = (pageNumber - 1) * pageSize + 1;
        int endIndex = pageNumber * pageSize;
        try {
            ps = conn.prepareStatement(query);
            int paramIndex = 1;
            if (searchText != null && !searchText.isEmpty()) {
                ps.setString(paramIndex++, "%" + searchText + "%");
            }
            if (isDeleted != null) {
                ps.setBoolean(paramIndex++, isDeleted);
            }
            ps.setInt(paramIndex++, startIndex);
            ps.setInt(paramIndex, endIndex);
            rs = ps.executeQuery();
            while (rs.next()) {
                Slider slider = new Slider();
                slider.setId(rs.getInt("ID"));
                slider.setImageUrl(rs.getString("ImageUrl"));
                slider.setIsDeleted(rs.getBoolean("IsDeleted"));
                slider.setCreatedAt(rs.getDate("CreatedAt"));
                slider.setCreatedBy(rs.getInt("CreatedBy"));
                slider.setTitle(rs.getString("Title"));
                slider.setNotes(rs.getString("Notes"));
                slider.setBacklink(rs.getString("Backlink"));
                sliderList.add(slider);
            }
        } catch (SQLException e) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return sliderList;
    }
    
    public List<Slider> getFilteredSliders(String imageUrl, Boolean isDeleted) {
        List<Slider> sliderList = new ArrayList<>();
        StringBuilder queryBuilder = new StringBuilder("SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY ID) AS RowNum, * FROM [Slider] WHERE 1=1");
        
        if (imageUrl != null && !imageUrl.isEmpty()) {
            queryBuilder.append(" AND ImageUrl LIKE ?");
        }
        if (isDeleted != null) {
            queryBuilder.append(" AND IsDeleted = ?");
        }
        
        queryBuilder.append(") AS SubQuery");

        String query = queryBuilder.toString();
        try {
            ps = conn.prepareStatement(query);
            int paramIndex = 1;
            if (imageUrl != null && !imageUrl.isEmpty()) {
                ps.setString(paramIndex++, "%" + imageUrl + "%");
            }
            if (isDeleted != null) {
                ps.setBoolean(paramIndex++, isDeleted);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                Slider slider = new Slider();
                slider.setId(rs.getInt("ID"));
                slider.setImageUrl(rs.getString("ImageUrl"));
                slider.setIsDeleted(rs.getBoolean("IsDeleted"));
                slider.setCreatedAt(rs.getDate("CreatedAt"));
                slider.setCreatedBy(rs.getInt("CreatedBy"));
                slider.setTitle(rs.getString("Title"));
                slider.setNotes(rs.getString("Notes"));
                slider.setBacklink(rs.getString("Backlink"));
                sliderList.add(slider);
            }
        } catch (SQLException e) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return sliderList;
    }

    // Update (Update Slider)
    public boolean updateSlider(Slider slider) {
        String query = "UPDATE [Slider] SET ImageUrl=?, IsDeleted=?, CreatedAt=?, CreatedBy=?, Title=?, Notes=?, Backlink=? WHERE ID=?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, slider.getImageUrl());
            ps.setBoolean(2, slider.isIsDeleted());
            ps.setDate(3, new java.sql.Date(slider.getCreatedAt().getTime()));
            ps.setInt(4, slider.getCreatedBy());
            ps.setString(5, slider.getTitle());
            ps.setString(6, slider.getNotes());
            ps.setString(7, slider.getBacklink());
            ps.setInt(8, slider.getId());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    // Delete (Delete Slider)
    public boolean deleteSlider(int sliderID) {
        String query = "DELETE FROM [Slider] WHERE ID=?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, sliderID);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }
}
