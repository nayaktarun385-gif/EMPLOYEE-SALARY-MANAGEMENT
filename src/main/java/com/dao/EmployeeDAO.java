package com.dao;

import java.sql.*;
import java.util.*;
import com.model.Employee;

public class EmployeeDAO {

    // ================= DB CONNECTION =================
    private Connection getConnection() throws Exception {
        return DBConnection.getConnection();
    }

    // ================= DEPARTMENT LIST =================
    public List<String> getDepartments() {
        List<String> list = new ArrayList<>();

        list.add("Human Resources");
        list.add("Information Technology");
        list.add("Finance");
        list.add("Marketing");
        list.add("Sales");
        list.add("Operations");
        list.add("Customer Support");
        list.add("Research & Development");

        return list;
    }

    // ================= ADD =================
    public void addEmployee(Employee emp) {
        try {
            Connection con = getConnection();

            String sql = "INSERT INTO employee(name, salary, department, date_of_joining) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, emp.getName());
            ps.setDouble(2, emp.getSalary());
            ps.setString(3, emp.getDepartment());
            ps.setDate(4, emp.getDateOfJoining());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ================= GET ALL =================
    public List<Employee> getAllEmployees() {
        List<Employee> list = new ArrayList<>();

        try {
            Connection con = getConnection();
            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM employee");

            while (rs.next()) {
                Employee e = new Employee();
                e.setId(rs.getInt("emp_id"));
                e.setName(rs.getString("name"));
                e.setSalary(rs.getDouble("salary"));
                e.setDepartment(rs.getString("department"));
                e.setDateOfJoining(rs.getDate("date_of_joining"));

                list.add(e);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ================= DELETE =================
    public void deleteEmployee(int id) {
        try {
            Connection con = getConnection();

            PreparedStatement ps = con.prepareStatement(
                "DELETE FROM employee WHERE emp_id=?"
            );

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ================= UPDATE =================
    public void updateEmployee(Employee emp) {
        try {
            Connection con = getConnection();

            String sql = "UPDATE employee SET name=?, salary=?, department=?, date_of_joining=? WHERE emp_id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, emp.getName());
            ps.setDouble(2, emp.getSalary());
            ps.setString(3, emp.getDepartment());
            ps.setDate(4, emp.getDateOfJoining());
            ps.setInt(5, emp.getId());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ================= REPORT 1 =================
    public List<Employee> getEmployeesByDepartmentAndExperience(String dept, int exp) {
        List<Employee> list = new ArrayList<>();

        try {
            Connection con = getConnection();

            String sql = "SELECT *, TIMESTAMPDIFF(YEAR, date_of_joining, CURDATE()) AS exp " +
                         "FROM employee WHERE department LIKE ? HAVING exp >= ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + dept + "%");
            ps.setInt(2, exp);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Employee e = new Employee();
                e.setId(rs.getInt("emp_id"));
                e.setName(rs.getString("name"));
                e.setSalary(rs.getDouble("salary"));
                e.setDepartment(rs.getString("department"));
                e.setDateOfJoining(rs.getDate("date_of_joining"));

                list.add(e);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ================= REPORT 2 =================
    public List<Employee> getEmployeesByDepartmentAndSalary(String dept, double min, double max) {
        List<Employee> list = new ArrayList<>();

        try {
            Connection con = getConnection();

            String sql = "SELECT * FROM employee WHERE department LIKE ? AND salary BETWEEN ? AND ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + dept + "%");
            ps.setDouble(2, min);
            ps.setDouble(3, max);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Employee e = new Employee();
                e.setId(rs.getInt("emp_id"));
                e.setName(rs.getString("name"));
                e.setSalary(rs.getDouble("salary"));
                e.setDepartment(rs.getString("department"));
                e.setDateOfJoining(rs.getDate("date_of_joining"));

                list.add(e);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ================= REPORT 3 =================
    public List<Employee> getEmployeesByName(String letter) {
        List<Employee> list = new ArrayList<>();

        try {
            Connection con = getConnection();

            String sql = "SELECT * FROM employee WHERE name LIKE ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, letter + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Employee e = new Employee();
                e.setId(rs.getInt("emp_id"));
                e.setName(rs.getString("name"));
                e.setSalary(rs.getDouble("salary"));
                e.setDepartment(rs.getString("department"));
                e.setDateOfJoining(rs.getDate("date_of_joining"));

                list.add(e);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}