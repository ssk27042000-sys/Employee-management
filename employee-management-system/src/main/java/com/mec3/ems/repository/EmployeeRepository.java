
package com.mec3.ems.repository;

import com.mec3.ems.model.Employee;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicLong;

@Repository
public class EmployeeRepository {

    private final List<Employee> employees =
            new CopyOnWriteArrayList<>();

    private final AtomicLong idGenerator =
            new AtomicLong(1);

    public Employee save(Employee employee) {
        employee.setId(idGenerator.getAndIncrement());
        employees.add(employee);

        return employee;
    }

    public List<Employee> findAll() {
        return List.copyOf(employees);
    }
}
