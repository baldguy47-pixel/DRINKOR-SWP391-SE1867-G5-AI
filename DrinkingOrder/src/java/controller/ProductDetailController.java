/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.ProductDAO;
import Model.Product;
import Model.ProductDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Legion
 */
@WebServlet(name="ProductDetailController", urlPatterns={"/public/product-detail"})
public class ProductDetailController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet ProductDetailController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductDetailController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final int PAGE_SIZE = 10;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        int page = 1;
//        if (request.getParameter("page") != null) {
//            page = Integer.parseInt(request.getParameter("page"));
//        }
        //int offset = (page - 1) * PAGE_SIZE;
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = new ProductDAO().getProductById(id);
        if(request.getParameter("pdid") != null) {
            int pdid = Integer.parseInt(request.getParameter("pdid"));
            product.setProductDetail(new ProductDAO().getProductDetailById(pdid));
        }
        
        
        //List<Feedback> feedbackList = new FeedbackDAO().getFeedbackByProductDetailID(product.getProductDetail().getProductDetailId(), offset, PAGE_SIZE);
        
       
        //List<Topping> toppings = new ProductDAO().getAllToppings();
        //request.setAttribute("toppings", toppings);
        //request.setAttribute("feedbackList", feedbackList);
        //request.setAttribute("currentPage", page);
        List<ProductDetail> listDetails = new ProductDAO().getProductDetailsByProductId(id);
        request.setAttribute("product", product);
        request.setAttribute("listDetails", listDetails);
        request.getRequestDispatcher("/product-detail.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
