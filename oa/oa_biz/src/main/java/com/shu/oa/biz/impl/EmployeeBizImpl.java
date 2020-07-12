package com.shu.oa.biz.impl;


import com.shu.oa.biz.EmployeeBiz;
import com.shu.oa.dao.EmployeeDao;
import com.shu.oa.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeBizImpl implements EmployeeBiz {

    @Autowired
    private EmployeeDao employeeDao;

    public void add(Employee employee) {
        employee.setPassword("shuandong");
        employeeDao.insert(employee);
    }

    public void remove(String sn) {

        employeeDao.delete(sn);
    }

    public void edit(Employee employee) {
        employeeDao.update(employee);
    }

    public Employee getOne(String sn) {
        return employeeDao.selectOne(sn);
    }

    public List<Employee> getAll() {
        return employeeDao.selectAll();
    }
}
