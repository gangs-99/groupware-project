package com.sh.groupware.emp.model.service;


import java.util.List;
import java.util.Map;
import com.sh.groupware.emp.model.dto.Emp;
import com.sh.groupware.emp.model.dto.EmpDetail;

public interface EmpService {


	Emp selectEmp();

	int insertEmp(Emp emp);

	EmpDetail selectEmpDetail(String empId);

	List<EmpDetail> selectAllEmpList();

	List<Emp> findByDeptCodeEmpList(String deptCode);

	List<Emp> findByDeptCodeEmpIdEmpList(Map<String, Object> param);

	int empUpdate(Emp emp);


}
