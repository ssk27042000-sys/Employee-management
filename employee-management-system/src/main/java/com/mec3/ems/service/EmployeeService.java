
package com.mec3.ems.service;

import com.mec3.ems.model.Employee;
import com.mec3.ems.repository.EmployeeRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.regex.Pattern;

@Service
public class EmployeeService {

    private final EmployeeRepository repository;

    private static final Pattern EMAIL_PATTERN =
            Pattern.compile("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$");

    public EmployeeService(EmployeeRepository repository) {
        this.repository = repository;
    }

    public Employee registerEmployee(Employee employee) {
        validateEmployee(employee);
        return repository.save(employee);
    }

    public List<Employee> getAllEmployees() {
        return repository.findAll();
    }

    private void validateEmployee(Employee employee) {
        if (employee == null) {
            throw new IllegalArgumentException(
                    "Employee details are required.");
        }

        if (employee.getName() == null
                || employee.getName().isBlank()) {
            throw new IllegalArgumentException(
                    "Employee name is required.");
        }

        if (employee.getEmail() == null
                || !EMAIL_PATTERN.matcher(
                        employee.getEmail().trim()).matches()) {
            throw new IllegalArgumentException(
                    "Enter a valid email address.");
        }

        if (employee.getDepartment() == null
                || employee.getDepartment().isBlank()) {
            throw new IllegalArgumentException(
                    "Department is required.");
        }

        if (!Double.isFinite(employee.getSalary())
                || employee.getSalary() <= 0) {
            throw new IllegalArgumentException(
                    "Salary must be greater than zero.");
        }
    }
}
