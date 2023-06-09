package com.sh.groupware.emp.model.dao;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.sh.groupware.emp.model.dto.Authority;
import com.sh.groupware.emp.model.dto.Emp;
import com.sh.groupware.emp.model.dto.EmpDetail;

@Mapper
public interface EmpDao {

	@Select("select * from emp")
	Emp selectEmp();

	int insertEmp(Emp emp);

	@Insert("insert into authority values(#{empId},#{auth})")
	int insertAuthority(Authority auth);

	EmpDetail selectEmpDetail(String empId);
	
	List<EmpDetail> selectAllEmpList();
	
	@Select("select * from authority where emp_id = #{empId}")
	List<Authority> selectAllAuthorityList(String empId);

	@Select("select * from emp where dept_code = #{deptCode}")
	List<Emp> findByDeptCodeEmpList(String deptCode);

	@Select("select * from emp where dept_code = #{deptCode} and emp_id != #{empId}")
	List<Emp> findByDeptCodeEmpIdEmpList(Map<String, Object> param);

	@Update("update emp set password=#{password}, phone= #{phone}, address= #{address} where emp_id = #{empId}")
	int empUpdate(Emp emp);


	List<Emp> selectAllEmpAddTitleDept();

	
	List<Emp> findByMyDeptCodeManagerEmpList(Map<String, Object> param);

	@Select("select * from emp where dept_code = 'd1' and job_code in ('j1', 'j2', 'j3') and (quit_yn = 'N' or quit_date >= (TO_TIMESTAMP_TZ(TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS') AT TIME ZONE 'Asia/Seoul')) order by job_code desc")
	List<Emp> findByD1ManagerEmpList();

	@Update("update emp set quit_date = #{endDate}, quit_yn = 'Y' where emp_id = #{empId}")
	int updateQuit(Map<String, Object> param);
	
	//부서별 근태현황 사원조회
	List<EmpDetail> selectEmpDeptList(String deptCode);

	// 전사 인사정보
	List<EmpDetail> selectEmpAll(RowBounds rowBounds);

	//사원 기본 연차 가져오기
	@Select("select base_day_off  from job j join emp e on j.job_code = e.job_code where e.emp_id = #{empId}" )
	double selectBaseDayOff(String empId);

	List<EmpDetail> empFinderList(Map<String, Object> param, RowBounds rowBounds);

	@Select("select count(*) from emp where quit_yn = 'N' or quit_date >= (TO_TIMESTAMP_TZ(TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS') AT TIME ZONE 'Asia/Seoul')")
	int selectEmpCount();

	int selectEmpCountDept(Map<String, Object> param);

	@Select("select count(*) from emp where dept_code = #{deptCode}")
	int selectEmpDeptCount(String deptCode);

	List<EmpDetail> empFinderDeptList(Map<String, Object> param);

	List<Emp> selectEmpAddTitleDept(Map<String, Object> param);


	
	
}
