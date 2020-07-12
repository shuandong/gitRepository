package com.shu.oa.biz.impl;

import com.shu.oa.biz.DepartmentBiz;
import com.shu.oa.dao.DepartmentDao;
import com.shu.oa.entity.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentBizImpl implements DepartmentBiz {

    @Autowired
    private DepartmentDao departmentDao;

    public void add(Department department) {
        departmentDao.insert(department);

    }

    public void remove(String sn) {
        System.out.println("部门biz方法正常");
        departmentDao.delete(sn);
    }

    public void edit(Department department) {
        departmentDao.update(department);
    }

    public Department getOne(String sn) {

        return departmentDao.selectOne(sn);
    }

    public List<Department> getAll() {
        return departmentDao.selectAll();
    }
}
