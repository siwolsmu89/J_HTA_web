package com.sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sample.util.ConnectionUtil;
import com.sample.vo.Employee;

public class EmployeeDAO {
	
	/**
	 * 모든 사원정보를 반환한다.
	 * @return 모든 사원정보
	 * @throws SQLException
	 */
	public List<Employee> getAllEmployees() throws SQLException {
		List<Employee> allEmployees = new ArrayList<Employee>();
		String sql = "SELECT E.employee_id, E.first_name, E.last_name, E.job_id, D.department_id, D.department_name "
				+ "FROM employees E, departments D "
				+ "WHERE E.department_id = D.department_id(+) "
				+ "ORDER BY E.employee_id ASC ";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Employee emp = new Employee();
			emp.setId(rs.getInt("employee_id"));
			emp.setFirstName(rs.getString("first_name"));
			emp.setLastName(rs.getString("last_name"));
			emp.setJobId(rs.getString("job_id"));
			emp.setDepartmentId(rs.getInt("department_id"));
			emp.setDepartmentName(rs.getString("department_name"));
			
			allEmployees.add(emp);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return allEmployees;
	}
	
	/**
	 * 지정된 범위 내의 사원정보를 반환한다.
	 * @param beginNumber 시작순번
	 * @param endNumber 끝순번
	 * @return 범위 내의 모든 사원정보
	 * @throws SQLException
	 */
	public List<Employee> getEmployeesByRange(int beginNumber, int endNumber) throws SQLException {
		List<Employee> employees = new ArrayList<Employee>();
		String sql = "SELECT E.ROWNUMBER, E.employee_id, E.first_name, E.last_name, E.email "
						+ ", E.phone_number, E.hire_date, E.job_id, E.salary, E.commission_pct "
						+ ", D.department_id, D.department_name "
						+ ", M.manager_id, M.first_name AS manager_first_name, M.last_name AS manager_last_name "  
				   + "FROM (SELECT ROW_NUMBER() OVER (ORDER BY employee_id ASC) AS ROWNUMBER "
				   				+ ", employee_id, first_name, last_name, email "
				   				+ ", phone_number, hire_date, job_id, salary, commission_pct "
				   				+ ", department_id, manager_id "
						+ "FROM employees) E, departments D, employees M " 
				+ "WHERE E.department_id = D.department_id(+) "
				+ "AND E.manager_id = M.employee_id(+) "   
				+ "AND E.ROWNUMBER BETWEEN ? AND ?";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, beginNumber);
		pstmt.setInt(2, endNumber);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Employee employee = new Employee();
			
			employee.setId(rs.getInt("employee_id"));
			employee.setFirstName(rs.getString("first_name"));
			employee.setLastName(rs.getString("last_name"));
			employee.setEmail(rs.getString("email"));
			employee.setPhoneNumber(rs.getString("phone_number"));
			employee.setHireDate(rs.getDate("hire_date"));
			employee.setJobId(rs.getString("job_id"));
			employee.setSalary(rs.getDouble("salary"));
			employee.setCommission_pct(rs.getDouble("commission_pct"));
			employee.setManagerId(rs.getInt("manager_id"));
			employee.setManagerFirstName(rs.getString("manager_first_name"));
			employee.setManagerLastName(rs.getString("manager_last_name"));
			employee.setDepartmentId(rs.getInt("department_id"));
			employee.setDepartmentName(rs.getString("department_name"));
			
			employees.add(employee);
		}	
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return employees;
	}
	
	public int getEmployeesCount() throws SQLException {
		String sql = "SELECT COUNT(*) AS cnt FROM employees ";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		// count(*)는 무조건 있는 행이기 때문에 if나 while 없이 rs.next()를 사용해 커서만 1칸 아래로 내려준다.
		rs.next();
		int count = 0;
		count = rs.getInt("cnt");
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return count;
	}
	
	/**
	 * 지정된 사원번호에 해당하는 사원의 상세정보를 반환한다.
	 * @param employeeId 조회할 사원번호
	 * @return 사원번호에 해당하는 사원이 존재하지 않는 경우 null, 존재할 경우 해당 사원정보
	 * @throws SQLException
	 */
	public Employee getEmployeeById(int employeeId) throws SQLException {
		Employee employee = null;
		String sql = "SELECT E.employee_id, E.first_name, E.last_name, E.email, E.phone_number "
				+ ", E.hire_date, E.job_id, E.salary, E.commission_pct "
				+ ", M.employee_id AS manager_id, M.first_name AS manager_first_name, M.last_name AS manager_last_name "
				+ ", D.department_id, D.department_name AS department_name "
				+ "FROM employees E, departments D, employees M "
				+ "WHERE E.department_id = D.department_id(+) "
				+ "AND E.manager_id = M.employee_id "
				+ "AND E.employee_id = ? "
				+ "ORDER BY E.employee_id ASC";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, employeeId);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			employee = new Employee();
			
			employee.setId(rs.getInt("employee_id"));
			employee.setFirstName(rs.getString("first_name"));
			employee.setLastName(rs.getString("last_name"));
			employee.setEmail(rs.getString("email"));
			employee.setPhoneNumber(rs.getString("phone_number"));
			employee.setHireDate(rs.getDate("hire_date"));
			employee.setJobId(rs.getString("job_id"));
			employee.setSalary(rs.getDouble("salary"));
			employee.setCommission_pct(rs.getDouble("commission_pct"));
			employee.setManagerId(rs.getInt("manager_id"));
			employee.setManagerFirstName(rs.getString("manager_first_name"));
			employee.setManagerLastName(rs.getString("manager_last_name"));
			employee.setDepartmentId(rs.getInt("department_id"));
			employee.setDepartmentName(rs.getString("department_name"));
		}
		
		
		return employee;
	}
	
}
