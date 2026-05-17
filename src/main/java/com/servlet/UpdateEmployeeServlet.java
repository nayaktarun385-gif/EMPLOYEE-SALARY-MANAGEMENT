package com.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.dao.EmployeeDAO;
import com.model.Employee;

public class UpdateEmployeeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        try {
            // ===== GET PARAMETERS =====
            String idStr = req.getParameter("id");
            String name = req.getParameter("name");
            String salStr = req.getParameter("salary");
            String dept = req.getParameter("department");
            String dojStr = req.getParameter("doj");

            // ===== ID VALIDATION =====
            int id;
            try {
                id = Integer.parseInt(idStr);
                if (id <= 0) {   // ✅ FIXED HERE
                    out.println("Invalid ID");
                    return;
                }
            } catch (Exception e) {
                out.println("Invalid ID");
                return;
            }

            // ===== NAME VALIDATION =====
            if (name == null || !name.matches("[A-Za-z ]+")) {
                out.println("Invalid Name");
                return;
            }

            // ===== SALARY VALIDATION =====
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

            // ===== DEPARTMENT VALIDATION =====
            if (dept == null || dept.trim().isEmpty()) {
                out.println("Department required");
                return;
            }

            // ===== DATE VALIDATION =====
            java.sql.Date doj;
            try {
                doj = java.sql.Date.valueOf(dojStr);
            } catch (Exception e) {
                out.println("Invalid Date");
                return;
            }

            // ===== FUTURE DATE CHECK =====
            java.util.Date today = new java.util.Date();
            if (doj.after(today)) {
                out.println("Date of Joining cannot be in the future");
                return;
            }

            // ===== CREATE OBJECT =====
            Employee emp = new Employee();
            emp.setId(id);
            emp.setName(name);
            emp.setSalary(salary);
            emp.setDepartment(dept);
            emp.setDateOfJoining(doj);

            // ===== UPDATE DB =====
            new EmployeeDAO().updateEmployee(emp);

            // ===== REDIRECT =====
            res.sendRedirect("DisplayEmployeeServlet");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        }
    }
}