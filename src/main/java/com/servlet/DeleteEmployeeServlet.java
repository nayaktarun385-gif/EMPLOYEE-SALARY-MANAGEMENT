package com.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.dao.EmployeeDAO;

public class DeleteEmployeeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));

            new EmployeeDAO().deleteEmployee(id);

            res.sendRedirect("DisplayEmployeeServlet"); 

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}