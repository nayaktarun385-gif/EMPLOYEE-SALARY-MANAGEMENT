package com.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ReportServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        RequestDispatcher rd = req.getRequestDispatcher("report_form.jsp");
        rd.forward(req, res);
    }
}
