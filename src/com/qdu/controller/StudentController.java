package com.qdu.controller;

import com.qdu.entity.Student;
import com.qdu.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * StudentController 用于处理学生相关的一些请求
 *
 * @author Anna
 */
@Controller
@RequestMapping("/students")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @GetMapping("/findStudents")
    public String findStudents(String batchName, Model model) {
        if ("all".equals(batchName)) {
            model.addAttribute("studentList", studentService.getStudentList());
        } else {
            model.addAttribute("studentList", studentService.getStudentListByBatchName(batchName));
        }
        return "student_list";
    }

    @GetMapping("/to_add_student")
    public String toEditStudent() {
        return "add_student";
    }

    @PostMapping("/add_student")
    public String addStudent(Student s) {
        studentService.addStudent(s);
        return "redirect:/index";
    }

    @PostMapping("/edit_student")
    public String editStudent(Student s) {
        studentService.updateStudent(s);
        return "redirect:/index";
    }

    @GetMapping("/to_edit_student/{srollno}")
    public String toEditStudent(@PathVariable String srollno, Model model) {
        model.addAttribute("student", studentService.getStudentById(srollno));
        return "edit_student";
    }

    @PostMapping("/delete")
    @ResponseBody
    public void delete(String srollno) {
        studentService.deleteStudent(srollno);
    }

}
