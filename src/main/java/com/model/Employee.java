package com.model;

import java.sql.Date;

public class Employee {

    private int id;
    private String name;
    private double salary;
    private String department;
    private Date dateOfJoining;

    public Employee() {}

    public Employee(String name, double salary, String department, Date dateOfJoining) {
        this.name = name;
        this.salary = salary;
        this.department = department;
        this.dateOfJoining = dateOfJoining;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public double getSalary() { return salary; }
    public void setSalary(double salary) { this.salary = salary; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    public Date getDateOfJoining() { return dateOfJoining; }
    public void setDateOfJoining(Date dateOfJoining) { this.dateOfJoining = dateOfJoining; }
}