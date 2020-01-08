package com.jwh.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jwh.crud.javabean.Employee;
import com.jwh.crud.javabean.Msg;
import com.jwh.crud.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {

    private EmployeeService employeeService;

    @Autowired
    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @ResponseBody
    @RequestMapping("/emps")
    public Msg getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        //分页查询，要查的对象紧跟pageHelper，每次显示5行
        PageHelper.startPage(pn, 5);
        List<Employee> emps = employeeService.getAll();
        //包装分页结果，每次显示五页
        PageInfo<Employee> pageInfo = new PageInfo<>(emps, 5);
        return Msg.success().add("pageInfo", pageInfo);
    }

    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result) {
        if (result.hasErrors()) {
            Map<String, Object> map = new HashMap<>();
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        } else {
            employeeService.saveEmp(employee);
            return Msg.success();
        }
    }

    @RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id) {
        Employee employee = employeeService.getEmp(id);
        return Msg.success().add("emp", employee);
    }

    @RequestMapping(value = "/emp/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmp(@PathVariable("id") Integer id, Employee employee) {
        employee.setEmpId(id);
        System.out.println(employee);
        employeeService.updateEmp(employee);
        return Msg.success().add("emp", employee);
    }

    @RequestMapping(value = "/emp/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmp(@PathVariable("id") String ids) {
        if (ids.contains("-")) {
            List<Integer> list= new ArrayList<>();
            String[] str_ids = ids.split("-");
            //组装id数组
            for (String str_id : str_ids) {
                list.add(Integer.parseInt(str_id));
            }
            employeeService.deleteBatch(list);
        } else {
            Integer id = Integer.parseInt(ids);
            employeeService.deleteEmpById(id);
        }
        return Msg.success();
    }

    @RequestMapping("/checkname")
    @ResponseBody
    public Msg checkName(String empName) {
        //先判断是否满足表达式
        String regx = "^[\\u2E80-\\u9FFFa-zA-Z0-9_-]{2,8}$";
        if (!empName.matches(regx))
            return Msg.fail().add("validate_msg", "用户名必须是2～8位汉子数字或英文的组合");
        boolean b = employeeService.checkName(empName);
        if (b)
            return Msg.success().add("validate_msg", "用户名可用");
        else
            return Msg.fail().add("validate_msg", "用户名重复");
    }

}
