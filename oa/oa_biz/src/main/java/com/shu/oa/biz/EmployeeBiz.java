package com.shu.oa.biz;

import com.shu.oa.entity.Employee;

import java.util.List;

public interface EmployeeBiz {

    void add(Employee employee);

    void remove(String sn);

    void edit(Employee employee);

    Employee getOne(String sn);

    List<Employee> getAll();


}
