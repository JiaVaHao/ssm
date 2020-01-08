package com.jwh.crud.javabean;

import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.Pattern;

public class Employee {
    private Integer empId;

    @Pattern(regexp = "^[\\u2E80-\\u9FFFa-zA-Z0-9_-]{2,8}$"
            ,message = "用户名必须是2～8位汉子数字或英文的组合")
    private String empName;

    private String gender;

    @Range(min=18,max=50,message="年龄必须是18～50之间")
    private Integer age;

    @Pattern(regexp = "^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*\\.[a-zA-Z0-9]{2,6}$"
    ,message = "邮箱必须是xxx@xxx.xxx格式")
    private String email;

    private Integer deptId;

    //查询员工时同时查询部门
    private Department department;

    public Employee() {
    }

    public Employee(Integer empId, String empName, String gender, Integer age, String email, Integer deptId) {
        this.empId = empId;
        this.empName = empName;
        this.gender = gender;
        this.age = age;
        this.email = email;
        this.deptId=deptId;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "empId=" + empId +
                ", empName='" + empName + '\'' +
                ", gender='" + gender + '\'' +
                ", age=" + age +
                ", email='" + email + '\'' +
                ", deptId=" + deptId +
                ", department=" + department +
                '}';
    }
}