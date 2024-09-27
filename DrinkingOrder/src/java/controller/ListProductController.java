/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.CategoryDAO;
import DAO.PostDAO;
import DAO.ProductDAO;
import Model.Category;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author Legion
 */
@WebServlet(name = "ListProductController", urlPatterns = {"/public/list-product"})
public class ListProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ListProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListProductController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pageParam = request.getParameter("page");
        String searchQuery = request.getParameter("searchQuery") == null ? "" : request.getParameter("searchQuery");
        String categoryId = request.getParameter("categoryId");
        String minPriceParam = request.getParameter("minPrice");
        String maxPriceParam = request.getParameter("maxPrice");
        String[] categoriesCheckBox = request.getParameterValues("category");
        String arrange = request.getParameter("arrange") == null ? "ASC" : request.getParameter("arrange");
        String _categoriesCheckBox = "";
        if(categoriesCheckBox != null && categoriesCheckBox.length != 0){
            if(categoriesCheckBox.length == 1) _categoriesCheckBox = categoriesCheckBox[0];
            else{
                _categoriesCheckBox += categoriesCheckBox[0];
                for (String c : categoriesCheckBox) {
                    _categoriesCheckBox += (", "+c);
                }
            }
            request.setAttribute("categoriesCheckBox", Arrays.asList(categoriesCheckBox));
        }

        int pageNumber = pageParam == null ? 1 : Integer.parseInt(pageParam);
        int pageSize = 12;

        Double minPrice = minPriceParam == null || minPriceParam.isEmpty() ? 0 : Double.parseDouble(minPriceParam);
        Double maxPrice = maxPriceParam == null || maxPriceParam.isEmpty() ? 10000 : Double.parseDouble(maxPriceParam);

        List<Product> products = new ProductDAO().listProductsPage(searchQuery, _categoriesCheckBox, minPrice, maxPrice, pageSize, pageNumber, arrange);
        int total = new ProductDAO().countFilter(searchQuery, _categoriesCheckBox, minPrice, maxPrice);

        int endPage = (int)Math.ceil(1.0 *total / pageSize);
        List<Category> categories = new CategoryDAO().getCategories();


        request.setAttribute("products", products);
        request.setAttribute("endPage", endPage);
        request.setAttribute("page", pageNumber);
        request.setAttribute("categories", categories);

        request.setAttribute("searchQuery", searchQuery);
        request.setAttribute("arrange", arrange);
        request.setAttribute("minPrice", minPrice);
        request.setAttribute("maxPrice", maxPrice);


        request.getRequestDispatcher("/list-product.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
