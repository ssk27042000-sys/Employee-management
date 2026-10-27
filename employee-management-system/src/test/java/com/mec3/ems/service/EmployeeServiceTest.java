
package com.mec3.ems.service;

import com.mec3.ems.model.Employee;
import com.mec3.ems.repository.EmployeeRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class EmployeeServiceTest {

    private EmployeeService employeeService;

    @BeforeEach
    void setUp() {
        employeeService = new EmployeeService(
                new EmployeeRepository());
    }

    @Test
    void shouldRegisterValidEmployee() {
        Employee employee = new Employee(
                null, "Arun", "arun@example.com",
                "IT", 35000);

        Employee saved =
                employeeService.registerEmployee(employee);

        assertNotNull(saved.getId());
        assertEquals("Arun", saved.getName());
    }

    @Test
    void shouldRejectInvalidEmail() {
        Employee employee = new Employee(
                null, "Arun", "invalid-email",
                "IT", 35000);

        assertThrows(IllegalArgumentException.class,
                () -> employeeService.registerEmployee(employee));
    }

    @Test
    void shouldRejectNonPositiveSalary() {
        Employee employee = new Employee(
                null, "Arun", "arun@example.com",
                "IT", 0);

        assertThrows(IllegalArgumentException.class,
                () -> employeeService.registerEmployee(employee));
    }

    @Test
    void shouldListRegisteredEmployees() {
        Employee employee = new Employee(
                null, "Arun", "arun@example.com",
                "IT", 35000);

        employeeService.registerEmployee(employee);

        List<Employee> employees =
                employeeService.getAllEmployees();

        assertEquals(1, employees.size());
        assertEquals("Arun", employees.get(0).getName());
    }
}
