package com.jwh.crud.controller;

import com.jwh.crud.javabean.Department;
import com.jwh.crud.javabean.Msg;
import com.jwh.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {

    private DepartmentService departmentService;

    @Autowired
    public void setDepartmentService(DepartmentService departmentService) {
        this.departmentService = departmentService;
    }

    @ResponseBody
    @RequestMapping("/depts")
    public Msg getDeptsWithJson(){
        List<Department> depts = departmentService.getAll();
        return Msg.success().add("depts",depts);
    }
}
