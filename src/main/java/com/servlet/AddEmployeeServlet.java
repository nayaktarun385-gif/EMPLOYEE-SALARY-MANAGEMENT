package com.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.dao.EmployeeDAO;
import com.model.Employee;

public class AddEmployeeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        try {
            // 🔹 Get parameters
            String name = req.getParameter("name");
            String salStr = req.getParameter("salary");
            String dept = req.getParameter("department");
            String dojStr = req.getParameter("doj");

            // 🔹 Name validation
            if (name == null || !name.matches("[A-Za-z ]+")) {
                out.println("Invalid Name");
                return;
            }

            // 🔹 Salary validation
            double salary;
            try {
                salary = Double.parseDouble(salStr);
                if (salary <= 0) {
                    out.println("Salary must be greater than 0");
                    return;
                }
            } catch (Exception e) {
                out.println("Invalid Salary");
                return;
            }

            // 🔹 Department validation
            if (dept == null || dept.trim().isEmpty()) {
                out.println("Department required");
                return;
            }

            // 🔹 Date validation
            java.sql.Date doj;
            try {
                doj = java.sql.Date.valueOf(dojStr);
            } catch (Exception e) {
                out.println("Invalid Date");
                return;
            }

            // 🔹 Create object
            Employee emp = new Employee();
            emp.setName(name);
            emp.setSalary(salary);
            emp.setDepartment(dept);
            emp.setDateOfJoining(doj);

            // 🔹 Insert using DAO
            new EmployeeDAO().addEmployee(emp);

            // ✅ FIX: redirect instead of success.jsp
            res.sendRedirect("DisplayEmployeeServlet");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        }
    }
}