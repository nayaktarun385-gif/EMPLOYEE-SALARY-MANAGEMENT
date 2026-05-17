package com.servlet;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.EmployeeDAO;
import com.model.Employee;

public class ReportCriteriaServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            String type = req.getParameter("type");

            EmployeeDAO dao = new EmployeeDAO();
            List<Employee> list = new ArrayList<>();

            // ===== EXPERIENCE =====
            if ("experience".equals(type)) {

                String dept = req.getParameter("department");
                String expStr = req.getParameter("experience");

                int exp = 0;
                try {
                    exp = Integer.parseInt(expStr);
                } catch (Exception e) {}

                list = dao.getEmployeesByDepartmentAndExperience(dept, exp);
            }

            // ===== DEPARTMENT + SALARY =====
            else if ("department".equals(type)) {

                String dept = req.getParameter("department");

                double min = 0, max = 0;

                try {
                    min = Double.parseDouble(req.getParameter("minSalary"));
                    max = Double.parseDouble(req.getParameter("maxSalary"));
                } catch (Exception e) {}

                if (min > max) {
                    double temp = min;
                    min = max;
                    max = temp;
                }

                list = dao.getEmployeesByDepartmentAndSalary(dept, min, max);
            }

            // ===== NAME =====
            else if ("name".equals(type)) {

                String letter = req.getParameter("letter");

                list = dao.getEmployeesByName(letter);
            }

            // 🔥 DEBUG
            System.out.println("REPORT SIZE = " + list.size());

            // ✅ VERY IMPORTANT
            req.setAttribute("reportList", list);

            RequestDispatcher rd = req.getRequestDispatcher("report_result.jsp");
            rd.forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}