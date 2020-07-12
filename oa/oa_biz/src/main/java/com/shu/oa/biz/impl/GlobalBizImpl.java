package com.shu.oa.biz.impl;

import com.shu.oa.biz.GlobalBiz;
import com.shu.oa.dao.EmployeeDao;
import com.shu.oa.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GlobalBizImpl implements GlobalBiz {

    @Autowired
    private EmployeeDao employeeDao;

    public Employee login(String sn, String password) {
        Employee employee = employeeDao.selectOne(sn);
        System.out.println(employee);
        if (employee != null && employee.getPassword().equals(password)) {
            return employee;
        } else {
            return null;
        }

    }
    public void updatePassword(Employee employee) {
        employeeDao.update(employee);
    }
}
