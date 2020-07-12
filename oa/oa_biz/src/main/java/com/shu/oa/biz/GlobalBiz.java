package com.shu.oa.biz;

import com.shu.oa.entity.Employee;

public interface GlobalBiz {


    Employee login(String sn, String password);

    void updatePassword(Employee employee);
}
