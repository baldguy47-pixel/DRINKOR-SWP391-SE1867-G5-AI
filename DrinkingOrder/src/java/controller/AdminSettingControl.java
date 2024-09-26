package controller;

import DAO.SettingDAO;
import Model.Setting;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "AdminSettingControl", urlPatterns = {"/admin/setting"})
public class AdminSettingControl extends HttpServlet {

    private SettingDAO settingDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        settingDAO = new SettingDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        // List settings with pagination
        List<Setting> settingList = settingDAO.getAllSettings();

        // Forward setting list and pagination parameters to JSP
        request.setAttribute("settingList", settingList);


        request.getRequestDispatcher("../setting-list.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Determine action (add or update)
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "add":
                    addSetting(request, response);
                    break;
                case "update":
                    updateSetting(request, response);
                    break;
            }
        } else {
            // Handle missing action parameter
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    private void addSetting(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve setting data from request parameters
        String type = request.getParameter("type");
        String value = request.getParameter("value");
        int order = Integer.parseInt(request.getParameter("order"));
        String description = request.getParameter("description");

        // Add the setting
        boolean success = settingDAO.addSetting(type, value, order, description);
        if (success) {
            // Redirect to setting list page after successful addition
            response.sendRedirect("setting?success");
        } else {
            response.sendRedirect("setting?fail");
        }
    }

    private void updateSetting(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve setting data from request parameters
        int settingId = Integer.parseInt(request.getParameter("settingId"));
        String type = request.getParameter("type");
        String value = request.getParameter("value");
        int order = Integer.parseInt(request.getParameter("order"));
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        String description = request.getParameter("description");

        // Create a Setting object with the updated data
        Setting setting = new Setting(settingId, type, value, order);
        setting.setIsDeleted(status);
        setting.setDescription(description);

        // Update the setting
        boolean success = settingDAO.updateSetting(setting);
        if (success) {
            // Redirect to setting list page after successful update
            response.sendRedirect("setting?success");
        } else {
            // Handle update failure
            response.sendRedirect("setting?fail");
            
        }
    }
}