package com.sh.groupware.report.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.sh.groupware.emp.model.dto.Emp;
import com.sh.groupware.report.model.dto.Reference;
import com.sh.groupware.report.model.dto.Report;
import com.sh.groupware.report.model.dto.ReportCheck;
import com.sh.groupware.report.model.dto.ReportComment;
import com.sh.groupware.report.model.dto.ReportDetail;
import com.sh.groupware.report.model.dto.ReportMember;

@Mapper
public interface ReportDao {

	int insertReport(Report report);

	@Insert("insert into reportMember values (seq_reportMember_no.nextval, #{reportNo}, #{empId}, default, default)")
	int insertReportMember(ReportMember member);

	@Select("select * from view_reportMember where dept_code = #{deptCode} order by emp_id")
	List<ReportMember> findByDeptCodeReportMember(String deptCode);

	@Select("select * from view_reportReference where dept_code = #{deptCode} order by emp_id")
	List<Reference> findByDeptCodeReference(String deptCode);

	@Insert("insert into reference values (seq_reference_no.nextval, #{empId}, #{type}, #{referenceNo}, #{referenceType}, #{deptCode})")
	int insertReference(Reference refer);

	List<ReportCheck> selectMyReportCheck(String loginMember);

	@Select("select * from view_reportCheck where report_no = #{no} order by end_date desc")
	List<ReportCheck> findByReportNoReportCheckList(String no);

	@Select("select * from view_reportMember where report_no = #{no} order by emp_id")
	List<ReportMember> findByReportNoMemberList(String no);

//	@Select("select * from view_reportReference where reference_no = #{no}")
//	List<Reference> findByReportNoReference(String no);
	
	List<Emp> findByReportNoReference(String no);

	@Update("update reportMember set exclude_yn = 'Y' where report_no = #{no} and emp_id = #{empId}")
	int updateExcludeYnY(Map<String, Object> param);

	@Update("update reportMember set exclude_yn = 'N' where report_no = #{no} and emp_id = #{empId}")
	int updateExcludeYnN(Map<String, Object> param);

	int insertReportDetail(ReportDetail detail);

	@Update("update reportMember set create_yn = 'Y' where report_no = #{no} and emp_id = #{empId}")
	int updateCreateYnY(Map<String, Object> param);

	@Select("select * from report where dept_yn = 'Y' and writer in (select emp_id from emp where dept_code = #{code}) order by reg_date desc, end_date desc")
	List<Report> findByDeptCodeReportList(String code, RowBounds rowBounds);

	ReportDetail findByDetailNoReportDetail(String no);

	int updateReportDetail(ReportDetail reportDetail);

	@Delete("delete from reportDetail where no = #{no}")
	int reportDetailDelete(String no);

	@Update("update reportMember set create_yn = 'N' where report_no = #{reportNo} and emp_id = #{empId}")
	int updateCreateYnN(Map<String, Object> param);

	
	List<ReportComment> selectAllReportComment(String detailNo);

	int insertReportComment(ReportComment reportComment);

	int updateReportComment(ReportComment reportComment);

	@Delete("delete from reportComment where no = #{no}")
	int reportCommentDelete(String no);

	ReportComment findByNoReportComment(String no);

	@Select("select * from report where writer = #{empId} order by reg_date desc, end_date desc")
	List<Report> findByWriterReportList(String empId);

	@Select("select * from report where writer = #{empId} order by reg_date desc, end_date desc")
	List<Report> findByWriterReportCheckList(String empId, RowBounds rowBounds);

	List<Report> findByMemberReportCheckList(String empId, RowBounds rowBounds);

	List<Report> findByReferenceReportCheckList(Map<String, Object> param, RowBounds rowBounds);

	@Select("select count(*) from report where dept_yn = 'Y' and writer in (select emp_id from emp where dept_code = #{code}) order by end_date")
	int selectDeptCodeListCount(String code);

	@Select("select count(*) from report where writer = #{empId} order by end_date desc")
	int selectWriterListCount(String empId);

	int selectReferListCount(Map<String, Object> param);

	int selectMemberListCount(String empId);
	
} // class end