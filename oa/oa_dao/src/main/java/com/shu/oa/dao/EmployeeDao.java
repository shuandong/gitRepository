package com.shu.oa.dao;
import com.shu.oa.entity.Employee;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository()
public interface EmployeeDao {

    void insert(Employee employee);

    void update(Employee employee);

    void delete(String sn);

    Employee selectOne(String sn);

    List<Employee> selectAll();

    List<Employee> selectByDepartmentAndPost(@Param("dsn") String dsn, @Param("post") String post);
}
