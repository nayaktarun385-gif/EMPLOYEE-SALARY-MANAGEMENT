package com.servlet;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.dao.EmployeeDAO;
import com.model.Employee;

public class DisplayEmployeeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            List<Employee> list = new EmployeeDAO().getAllEmployees();

            req.setAttribute("empList", list);

            RequestDispatcher rd =
                req.getRequestDispatcher("empdisplay.jsp");

            rd.forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}