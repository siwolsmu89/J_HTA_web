package com.sample.hr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sample.hr.vo.Department;
import com.sample.hr.vo.Employee;
import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;

public class EmployeeDAO {
	
	public List<Department> getAllDepartments() throws SQLException {
		List<Department> allDepts = new ArrayList<Department>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("hr.getAllDepartments"));
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Department dept = new Department();
			dept.setId(rs.getInt("department_id"));
			dept.setName(rs.getString("department_name"));
			
			allDepts.add(dept);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return allDepts;
	}
	
	public List<Employee> getEmployeesByDept(int departmentId) throws SQLException {
		List<Employee> emps = new ArrayList<Employee>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("hr.getEmployeesByDept"));
		pstmt.setInt(1, departmentId);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Employee emp = new Employee();
			emp.setId(rs.getInt("employee_id"));
			emp.setFirstName(rs.getString("first_name"));
			emp.setLasstName(rs.getString("last_name"));
			emp.setPhoneNumber(rs.getString("phone_number"));
			emp.setJobId(rs.getString("job_id"));
			emp.setSalary(rs.getDouble("salary"));
			emp.setHireDate(rs.getDate("hire_date"));
			
			emps.add(emp);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return emps;
	}
	
}
