
package com.mec3.ems.controller;

import com.mec3.ems.model.Employee;
import com.mec3.ems.service.EmployeeService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class EmployeeController {

    private final EmployeeService employeeService;

    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @GetMapping({"/", ""})
    public String home() {
        return "redirect:/employees";
    }

    @GetMapping("/employees/new")
    public String showRegistrationForm(Model model) {
        model.addAttribute("employee", new Employee());
        return "employee-form";
    }

    @PostMapping("/employees")
    public String registerEmployee(
            @ModelAttribute("employee") Employee employee,
            Model model,
            RedirectAttributes redirectAttributes) {

        try {
            employeeService.registerEmployee(employee);

            redirectAttributes.addFlashAttribute(
                    "successMessage",
                    "Employee registered successfully!");

            return "redirect:/employees";

        } catch (IllegalArgumentException ex) {
            model.addAttribute("errorMessage", ex.getMessage());
            return "employee-form";
        }
    }

    @GetMapping("/employees")
    public String listEmployees(Model model) {
        model.addAttribute(
                "employees",
                employeeService.getAllEmployees());

        return "employee-list";
    }
}
