/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.ProductCatalog;
import entity.ProductCategory;
import java.io.IOException;
import java.util.Collection;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import session.ProductCategoryFacade;

/**
 *
 * @author ankur
 */
@WebServlet(name = "ControllerServlet", urlPatterns = {"/category", "/addToCart", "/viewCart", "/updateCart",
    "/checkout",
    "/purchase",
    "/chooseLanguage"})
public class ControllerServlet extends HttpServlet {

    @EJB
    private ProductCategoryFacade categoryFacade;
    ProductCategory selectedCategory;
    Collection<ProductCatalog> categoryProducts;

    @Override
    public void init() throws ServletException {
        //System.out.println("Hii Guys from Init");
        getServletContext().setAttribute("categoryElex", categoryFacade.findAll());
    }

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

        String userPath = request.getServletPath();
        System.out.println("Hii Guys");
        // if category page is requested
        if (userPath.equals("/category")) {
            // get categoryId from request
            String categoryId = request.getQueryString();

            if (categoryId != null) {
                selectedCategory = categoryFacade.find(Short.parseShort(categoryId)); 
                request.setAttribute("selectedCategory", selectedCategory);
                categoryProducts = selectedCategory.getProductCatalogCollection();
                request.setAttribute("categoryProducts", categoryProducts);
            }

// if cart page is requested
        } else if (userPath.equals("/viewCart")) {
            // TODO: Implement cart page request

            userPath = "/e-cart";

            // if checkout page is requested
        } else if (userPath.equals("/checkout")) {
            // TODO: Implement checkout page request

            // if user switches language
        } else if (userPath.equals("/chooseLanguage")) {
            // TODO: Implement language request

        }

        // use RequestDispatcher to forward request internally
        String url = "/WEB-INF/view" + userPath + ".jsp";

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (IOException | ServletException ex) {
        }
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

        String userPath = request.getServletPath();
        System.out.println("Hii Guys");
        // if addToCart action is called
        if (userPath.equals("/addToCart")) {
            // TODO: Implement add product to cart action

            // if updateCart action is called
        } else if (userPath.equals("/updateCart")) {
            // TODO: Implement update cart action

            // if purchase action is called
        } else if (userPath.equals("/purchase")) {
            // TODO: Implement purchase action

            userPath = "/e-confirmation";
        }

        // use RequestDispatcher to forward request internally
        String url = "/WEB-INF/view" + userPath + ".jsp";

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (IOException | ServletException ex) {
        }
    }

}
