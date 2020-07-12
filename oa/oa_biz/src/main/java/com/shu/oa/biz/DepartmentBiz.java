package com.shu.oa.biz;

import com.shu.oa.entity.Department;

import java.util.List;

public interface DepartmentBiz {

    void add(Department department);

    void remove(String sn);

    void edit(Department department);

    Department getOne(String sn);

    List<Department> getAll();


}
