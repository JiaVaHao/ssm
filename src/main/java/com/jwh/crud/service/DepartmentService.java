package com.jwh.crud.service;

import com.jwh.crud.dao.DepartmentMapper;
import com.jwh.crud.javabean.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {

    private DepartmentMapper departmentMapper;

    @Autowired
    public void setDepartmentMapper(DepartmentMapper departmentMapper) {
        this.departmentMapper = departmentMapper;
    }

    public List<Department> getAll() {
        return departmentMapper.selectByExample(null);
    }
}
