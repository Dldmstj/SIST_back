package backWeb.a01_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import backWeb.z01_vo.Code;
import backWeb.z01_vo.Department;
import backWeb.z01_vo.Department01;
import backWeb.z01_vo.Dept;
import backWeb.z01_vo.Emp;
import backWeb.z01_vo.Employee;
import backWeb.z01_vo.Job;
import backWeb.z01_vo.Jobs;
import backWeb.z01_vo.Locations;
import backWeb.z01_vo.Manager;
import backWeb.z01_vo.ShMember;

/*
	 # DAO(Database Access Object)
	 1. 프로그램은 기능별 모듈 분리화 정책을 하여야 추후 확장성이 뛰어나고,
	 	다른 코드에 영향력이 적어, 유지보수가 효과적으로 이루어짐
	 2. 기능적인 다른 내용을 분리시켜서 사용하세요
	 	1) console 처리: 객체를 생성해 매개변수를 데이터로 받고, 리턴값으로 결과를 리턴처리
	 	2) 웹 화면 처리: 요청값을 데이터로 받아서, 리턴할 VO객체를 받아 화면에 출력한다.
	 	
 */
public class A04_PreParedDao {
	// 필드
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public List<Manager> getManager() {
	    List<Manager> elist = new ArrayList<Manager>();
	    String sql = "SELECT empno, ename, dname\r\n"
	    		+ "	FROM emp e, dept d\r\n"
	    		+ "	WHERE e.deptno = d.deptno\r\n"
	    		+ "	AND empno in (\r\n"
	    		+ "	   SELECT DISTINCT mgr FROM emp\r\n"
	    		+ "	) order by ename ";
	    System.out.println("# DB 접속 #");
	    try {
	        conn = DB2.conn();
	        pstmt = conn.prepareStatement(sql); 
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	        	// empno, ename, dname
	            elist.add(new Manager(
	                    rs.getInt("empno"),
	                    rs.getString("ename"),
	                    rs.getString("dname")
	            ));
	        }
	    } catch (SQLException e) {
	        System.out.println("DB 관련 오류: " + e.getMessage());
	    } catch (Exception e) {
	        System.out.println("일반 오류: " + e.getMessage());
	    } finally {
	        DB2.close(rs, pstmt, conn);
	    }
	    return elist;
	}
	
	public List<Job> getJobs() {
	    List<Job> elist = new ArrayList<Job>();
	    String sql = "	SELECT * \r\n"
	    		+ "	FROM jobs\r\n"
	    		+ "	ORDER BY job_title ";
	    System.out.println("# DB 접속 #");
	    try {
	        conn = DB2.conn();
	        pstmt = conn.prepareStatement(sql); 
	        rs = pstmt.executeQuery();
	        //job_id, job_title, min_salary, max_salary
	        while (rs.next()) {
	        	elist.add(new Job(
	        			rs.getString("job_id"),
	        			rs.getString("job_title"),
	        			rs.getInt("min_salary"),
	        			rs.getInt("max_salary")
	            ));
	        }
	    } catch (SQLException e) {
	        System.out.println("DB 관련 오류: " + e.getMessage());
	    } catch (Exception e) {
	        System.out.println("일반 오류: " + e.getMessage());
	    } finally {
	        DB2.close(rs, pstmt, conn);
	    }
	    return elist;
	}
	
	public List<Code> getCodeList(String title) {
		List<Code> elist = new ArrayList<Code>();
		String sql = "SELECT NO, title, refno, ordno\r\n"
				+ "FROM CODE WHERE title LIKE ?\r\n"
				+ "ORDER BY refno, ordno";
		try {
			conn = DB2.conn();
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, title);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				elist.add(new Code(
						rs.getInt("no"),
						rs.getString("title"),
						rs.getInt("refno"),
						rs.getInt("ordno")
						));
			}
		} catch (SQLException e) {
			System.out.println("DB 관련 오류: " + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 오류: " + e.getMessage());
		} finally {
			DB2.close(rs, pstmt, conn);
		}
		return elist;
	}
	
	public List<Code> getCodeList(String title, int refno) {
		List<Code> elist = new ArrayList<Code>();
		String sql = "SELECT *\r\n"
				+ "FROM CODE\r\n"
				+ "WHERE title LIKE ?\r\n"
				+ "START WITH refno = ?\r\n"
				+ "CONNECT BY PRIOR NO = refno";
		try {
			conn = DB2.conn();
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1,'%'+title+'%');
			pstmt.setInt(2,refno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				elist.add(new Code(
						rs.getInt("no"),
						rs.getString("title"),
						rs.getInt("refno"),
						rs.getInt("ordno")
						));
			}
		} catch (SQLException e) {
			System.out.println("DB 관련 오류: " + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 오류: " + e.getMessage());
		} finally {
			DB2.close(rs, pstmt, conn);
		}
		return elist;
	}
	
	public List<Employee> getEmpList(Map<String, String> sch){
		List<Employee> elist = new ArrayList<Employee>();
		String sql = "SELECT * FROM Employees WHERE FIRST_NAME||LAST_NAME LIKE '%'||?||'%' "
				+ "AND SALARY BETWEEN ? AND ?";
		try {
			conn = DB2.conn();
			// 초기에 sql을 넘기면서 pstmt 객체 생성
			pstmt = conn.prepareStatement(sql);
			// pstmt.set데이터유형(순서-1부터, 입력할 데이터)
			pstmt.setString(1, sch.get("name"));	// name 	minSal 	maxSal
			pstmt.setDouble(2, Double.parseDouble(sch.get("minSal")));
			pstmt.setDouble(3, Double.parseDouble(sch.get("maxSal")));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				elist.add(new Employee(
						rs.getInt("employee_id"),
						rs.getString("first_name"),
						rs.getString("last_name"),
						rs.getString("email"),
						rs.getString("phone_number"),
						rs.getDate("hire_date"),
						rs.getString("job_id"),
						rs.getDouble("salary"),
						rs.getDouble("commission_pct"),
						rs.getInt("manager_id"),
						rs.getInt("department_id")
						));
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		}catch(SQLException e) {
			System.out.println("DB에러: " + e.getMessage());
		}catch(Exception e) {
			System.out.println("기타예외: " + e.getMessage());
		}finally {
			DB2.close(rs, pstmt, conn);
		}
		return elist;
	}
	public List<Emp> getEmpList() {
	    List<Emp> elist = new ArrayList<>();
	    String sql = "SELECT * FROM emp02 order by empno";
	    
	    try {
	        conn = DB2.conn();
	        pstmt = conn.prepareStatement(sql); 
	        rs = pstmt.executeQuery();
	
	        while (rs.next()) {
	            elist.add(new Emp(
	                    rs.getInt("empno"),
	                    rs.getString("ename"),
	                    rs.getString("job"),
	                    rs.getInt("mgr"),
	                    rs.getDate("hiredate"),
	                    rs.getDouble("sal"),
	                    rs.getDouble("comm"),
	                    rs.getInt("deptno")
	            ));
	        }
	    } catch (SQLException e) {
	        System.out.println("DB 관련 오류: " + e.getMessage());
	    } catch (Exception e) {
	        System.out.println("일반 오류: " + e.getMessage());
	    } finally {
	        DB2.close(rs, pstmt, conn);
	    }
	    return elist;
	}
	
	public List<Emp> getEmp(){
		List<Emp> elist = new ArrayList<Emp>();
		String sql = "SELECT * FROM Emp02 order by empno";
		try {
			conn = DB2.conn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				elist.add(new Emp(
						rs.getInt("empno"),
						rs.getString("ename"),
						rs.getString("job"),
						rs.getInt("mgr"),
						rs.getDate("hiredate"),
						rs.getDouble("sal"),
						rs.getDouble("comm"),
						rs.getInt("deptno")
						));
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		}catch(SQLException e) {
			System.out.println("DB에러: " + e.getMessage());
		}catch(Exception e) {
			System.out.println("기타예외: " + e.getMessage());
		}finally {
			DB2.close(rs, pstmt, conn);
		}
		return elist;
	}
	
	public int getMemberid(String id){
		int result = -1;
		ShMember member = null;
		String sql = "SELECT * FROM member01 where memid = ?";
		try {
			conn = DB2.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = 1;
				
			}else{
				result = 0;
			}			
			rs.close();
			pstmt.close();
			conn.close();
			
		}catch(SQLException e) {
			System.out.println("DB에러: " + e.getMessage());
		}catch(Exception e) {
			System.out.println("기타예외: " + e.getMessage());
		}finally {
			DB2.close(rs, pstmt, conn);
		}
		System.out.println(result);
		return result;
	}
	
	public ShMember getMemberLogin(String id, String pw){
		ShMember member = null;
		String sql = "SELECT * FROM member01 where memid = ? and mempw = ?";
		try {
			conn = DB2.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				member = new ShMember(
						rs.getString("memname"),
						rs.getString("memid")
						);
			}	
			rs.close();
			pstmt.close();
			conn.close();
			
		}catch(SQLException e) {
			System.out.println("DB에러: " + e.getMessage());
		}catch(Exception e) {
			System.out.println("기타예외: " + e.getMessage());
		}finally {
			DB2.close(rs, pstmt, conn);
		}
		return member;
	}
	
	public List<Department> getDepartList(Map<String, String> sch){
		List<Department> dlist = new ArrayList<Department>();
		String sql = "SELECT * FROM JOB_HISTORY WHERE JOB_ID LIKE '%'||?||'%' "
					+ "AND DEPARTMENT_ID BETWEEN ? AND ?";
		try {
			conn = DB2.conn();
			// 초기에 sql을 넘기면서 pstmt 객체 생성
			pstmt = conn.prepareStatement(sql);
			// pstmt.set데이터유형(순서-1부터, 입력할 데이터)
			pstmt.setString(1, sch.get("name"));	// name 	minSal 	maxSal
			pstmt.setInt(2, Integer.parseInt(sch.get("min")));
			pstmt.setInt(3, Integer.parseInt(sch.get("max")));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dlist.add(new Department(
						rs.getInt("employee_id"),
						rs.getDate("start_date"),
						rs.getDate("end_date"),
						rs.getString("job_id"),
						rs.getInt("department_id")
						));
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		}catch(SQLException e) {
			System.out.println("DB에러: " + e.getMessage());
		}catch(Exception e) {
			System.out.println("기타예외: " + e.getMessage());
		}finally {
			DB2.close(rs, pstmt, conn);
		}
		
		return dlist;
	}
	
	public List<Jobs> getJobsList(Map<String,String> sch){
		List<Jobs> jlist = new ArrayList<Jobs>();
		/*
		 SELECT * FROM JOBS WHERE JOB_TITLE  LIKE '%'||'S'||'%' AND MIN_SALARY BETWEEN 1000 AND 10000;
		 */
		String sql = "SELECT * FROM JOBS WHERE JOB_TITLE  LIKE '%'||?||'%' AND MIN_SALARY BETWEEN ? AND ?";
		try {
			conn = DB2.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,sch.get("job_title"));
			pstmt.setInt(2,Integer.parseInt(sch.get("min")));
			pstmt.setInt(3,Integer.parseInt(sch.get("max")));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				jlist.add(new Jobs(
				rs.getString("job_id"),
				rs.getString("job_title"),
				rs.getInt("min_salary"),
				rs.getInt("max_salary")
				));
			}
		}catch(SQLException e) {
			System.out.println("DB에러: " + e.getMessage());
		}catch(Exception e) {
			System.out.println("기타예외: " + e.getMessage());
		}finally {
			DB2.close(rs, pstmt, conn);
		}
		return jlist;
	}
	
	public void insertEmp(Emp ins) {
		String sql = "insert into emp02 values(?,?,?,?,to_date(?,'YYYY-MM-DD'),?,?,?)";
		try {
			conn = DB2.conn();
			conn.setAutoCommit(false);		// 자동 commit 방지
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ins.getEmpno());
			pstmt.setString(2, ins.getEname());
			pstmt.setString(3, ins.getJob());
			pstmt.setInt(4, ins.getMgr());
			pstmt.setString(5, ins.getHiredateS());
			pstmt.setDouble(6, ins.getSal());
			pstmt.setDouble(7, ins.getComm());
			pstmt.setInt(8, ins.getDeptno());
			System.out.println(pstmt.executeUpdate());
			
			conn.commit(); 	// 입력시 확정
			pstmt.close();
			conn.close();
			System.out.println("등록 성공");
		} catch (SQLException e) {
			System.out.println("DB예외: " + e.getMessage());
			try {
				conn.rollback();	// 예외 발생시 rollback
			} catch (SQLException e1) {
				System.out.println("rollback예외: " + e.getMessage());
			}
		} catch (Exception e) {
			System.out.println("기타예외: " + e.getMessage());
		}finally {
			DB2.close(rs, pstmt, conn);
		}
	}
	
	public int insertDepart(Department01 dpt) {
		int isInsert = 0;
		String sql = "insert into DEPARTMENTS01 values(?,?,?,?)";
		try {
			conn = DB2.conn();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,dpt.getDepartment_id());
			pstmt.setString(2,dpt.getDepartment_name());
			pstmt.setInt(3,dpt.getManager_id());
			pstmt.setInt(4,dpt.getLocation_id());
			isInsert = pstmt.executeUpdate();
			
			conn.commit();
			if(isInsert == 1 )System.out.println("등록 성공");
			
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			System.out.println("DB예외: " + e.getMessage());
			try {
				conn.rollback();	// 예외 발생시 rollback
			} catch (SQLException e1) {
				System.out.println("rollback예외: " + e.getMessage());
			}
		} catch (Exception e) {
			System.out.println("기타예외: " + e.getMessage());
		}finally {
			DB2.close(rs, pstmt, conn);
		}
		return isInsert;
	}
	
	
	public void updateLocation(Locations loc) {
		int isUpt = 0;
		String sql = "UPDATE LOCATIONS01 SET "
				+ "street_address =?,"
				+ " postal_code=?,"
				+ " city =?, "
				+ "state_province=?, "
				+ "country_id=?"
				+ "WHERE location_id=?";
		try {
			conn = DB2.conn();
			conn.setAutoCommit(false);		// 자동 commit 방지
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loc.getStreet_address());
			pstmt.setString(2, loc.getPostal_code());
			pstmt.setString(3, loc.getCity());
			pstmt.setString(4, loc.getState_province());
			pstmt.setString(5, loc.getCountry_id());
			pstmt.setInt(6, loc.getLocation_id());
			isUpt = pstmt.executeUpdate();
			
			conn.commit(); 	// 입력시 확정
			pstmt.close();
			conn.close();
			
			if (isUpt == 1) System.out.println("수정 성공");
		} catch (SQLException e) {
			System.out.println("DB예외: " + e.getMessage());
			try {
				conn.rollback();	// 예외 발생시 rollback
			} catch (SQLException e1) {
				System.out.println("rollback예외: " + e.getMessage());
			}
		} catch (Exception e) {
			System.out.println("기타예외: " + e.getMessage());
		}finally {
			DB2.close(rs, pstmt, conn);
		}
	}
	
	public void deleteLocation(int loc_id) {
		int isDel = 0;
		String sql = "DELETE FROM LOCATIONS01 WHERE location_id=?";
		try {
			conn = DB2.conn();
			conn.setAutoCommit(false);		// 자동 commit 방지
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loc_id);
			isDel = pstmt.executeUpdate();
			
			conn.commit(); 	// 입력시 확정
			pstmt.close();
			conn.close();
			if (isDel == 1) System.out.println("삭제 성공");
			
		} catch (SQLException e) {
			System.out.println("DB예외: " + e.getMessage());
			try {
				conn.rollback();	// 예외 발생시 rollback
			} catch (SQLException e1) {
				System.out.println("rollback예외: " + e.getMessage());
			}
		} catch (Exception e) {
			System.out.println("기타예외: " + e.getMessage());
		}finally {
			DB2.close(rs, pstmt, conn);
		}
	}

	public void updateEmp(Emp upt) {
		int isUpt = 0;
		String sql = "UPDATE emp02 SET "
				+ "ENAME =?,"
				+ "JOB = ?, "
				+ "HIREDATE = TO_DATE(?,'YYYY/MM/DD'),"
				+ "sal = ?"
				+ "WHERE empno = ?";
		try {
			conn = DB2.conn();
			conn.setAutoCommit(false);		// 자동 commit 방지
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, upt.getEname());
			pstmt.setString(2, upt.getJob());
			pstmt.setString(3, upt.getHiredateS());
			pstmt.setDouble(4, upt.getSal());
			pstmt.setInt(5, upt.getEmpno());
			isUpt = pstmt.executeUpdate();
			
			conn.commit(); 	// 입력시 확정
			pstmt.close();
			conn.close();
			
			if (isUpt == 1) System.out.println("수정 성공");
		} catch (SQLException e) {
			System.out.println("DB예외: " + e.getMessage());
			try {
				conn.rollback();	// 예외 발생시 rollback
			} catch (SQLException e1) {
				System.out.println("rollback예외: " + e.getMessage());
			}
		} catch (Exception e) {
			System.out.println("기타예외: " + e.getMessage());
		}finally {
			DB2.close(rs, pstmt, conn);
		}
	}

	/*
	 select * from Employees
	WHERE FIRST_NAME || LAST_NAME LIKE '%'||?||'%' AND SALARY BETWEEN ? AND ?; 
	 */
	public Employee getEmpList(String id){
		Employee emp = null;
		String sql = "SELECT * FROM Employees WHERE id = ?";
		try {
			conn = DB2.conn();
			// 초기에 sql을 넘기면서 pstmt 객체 생성
			pstmt = conn.prepareStatement(sql);
			// pstmt.set데이터유형(순서-1부터, 입력할 데이터)
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				emp = new Employee(
						rs.getInt("employee_id"),
						rs.getString("first_name"),
						rs.getString("last_name"),
						rs.getString("email"),
						rs.getString("phone_number"),
						rs.getDate("hire_date"),
						rs.getString("job_id"),
						rs.getDouble("salary"),
						rs.getDouble("commission_pct"),
						rs.getInt("manager_id"),
						rs.getInt("department_id")
						);
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		}catch(SQLException e) {
			System.out.println("DB에러: " + e.getMessage());
		}catch(Exception e) {
			System.out.println("기타예외: " + e.getMessage());
		}finally {
			DB2.close(rs, pstmt, conn);
		}
		return emp;
	}

	public List<Emp> getEmpList(String ename, String job) {
	    List<Emp> elist = new ArrayList<>();
	    String sql = "SELECT * FROM emp02 where ename like ? and job like ? order by empno ";
	    
	    try {
	        conn = DB2.conn();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, '%'+ename+"%");
	        pstmt.setString(2, '%'+job+"%");
	        rs = pstmt.executeQuery();
	        
	
	        while (rs.next()) {
	            elist.add(new Emp(
	                    rs.getInt("empno"),
	                    rs.getString("ename"),
	                    rs.getString("job"),
	                    rs.getInt("mgr"),
	                    rs.getDate("hiredate"),
	                    rs.getDouble("sal"),
	                    rs.getDouble("comm"),
	                    rs.getInt("deptno")
	            ));
	        }
	    } catch (SQLException e) {
	        System.out.println("DB 관련 오류: " + e.getMessage());
	    } catch (Exception e) {
	        System.out.println("일반 오류: " + e.getMessage());
	    } finally {
	        DB2.close(rs, pstmt, conn);
	    }
	    return elist;
	}
	
	public List<Dept> getDeptList(String dname, String loc) {
		List<Dept> dlist = new ArrayList<>();
		String sql = "SELECT * FROM dept where dname like ? and loc like ? order by deptno";
		
		try {
			conn = DB2.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%'+dname+"%");
			pstmt.setString(2, '%'+loc+"%");
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				dlist.add(new Dept(
						rs.getInt("deptno"),
						rs.getString("dname"),
						rs.getString("loc")
						));
			}
		} catch (SQLException e) {
			System.out.println("DB 관련 오류: " + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 오류: " + e.getMessage());
		} finally {
			DB2.close(rs, pstmt, conn);
		}
		return dlist;
	}
	
	public void insertCode(Code ins) {
		String sql = "INSERT INTO code VALUES"
	    		+ " (code_seq.nextval, ?,?,?,?)";
	    try {
	    	conn = DB2.conn();
	        conn.setAutoCommit(false);
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, ins.getTitle());
	        pstmt.setInt(2, ins.getRefno());
	        pstmt.setInt(3, ins.getOrdno());
	        pstmt.setString(4, ins.getVal());
	        int result = pstmt.executeUpdate();
	        if (result == 1) {
	        	conn.commit();
	            System.out.println("등록 성공");
	        }
	    } catch (SQLException e) {
	        System.out.println("DB 오류: " + e.getMessage());
	        DB2.rollback(conn);
	    } catch (Exception e) {
	        System.out.println("일반 오류: " + e.getMessage());
	    } finally {
	    	DB2.close(rs, pstmt, conn);
	    }
	}

	public Code getCode(int no) {
		Code c = null;
	    String sql = " SELECT * \r\n"
	    		+ "FROM code\r\n"
	    		+ "WHERE NO = ?";
	    try {
	        conn = DB2.conn();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, no);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            c = new Code(
	                    rs.getInt("no"),
	                    rs.getString("title"),
	                    rs.getString("val"),
	                    rs.getInt("refno"),
	                    rs.getInt("ordno")
	            );
	        }
	    } catch (SQLException e) {
	        System.out.println("DB 관련 오류: " + e.getMessage());
	    } catch (Exception e) {
	        System.out.println("일반 오류: " + e.getMessage());
	    } finally {
	        DB2.close(rs, pstmt, conn);
	    }
	    return c;
	}

	public void updateCode(Code upt) {
		String sql = "UPDATE code\r\n"
	    		+ "    SET title = ?,\r\n"
	    		+ "        refno = ?,\r\n"
	    		+ "        ordno = ?,\r\n"
	    		+ "        val = ?\r\n"
	    		+ "   WHERE NO = ?";
	    try {
	    	conn = DB2.conn();
	    	conn.setAutoCommit(false);
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, upt.getTitle());
	        pstmt.setInt(2, upt.getRefno());
	        pstmt.setInt(3, upt.getOrdno());
	        pstmt.setString(4, upt.getVal());
	        pstmt.setInt(5, upt.getNo());
	        int result = pstmt.executeUpdate();
	        if (result == 1) {
	        	conn.commit();
	            System.out.println("수정 성공");
	        }
	    } catch (SQLException e) {
	        System.out.println("DB 오류: " + e.getMessage());
	        DB2.rollback(conn);
	    } catch (Exception e) {
	        System.out.println("일반 오류: " + e.getMessage());
	    } finally {
	    	DB2.close(rs, pstmt, conn);
	    }
	}

	public void deleteCode(int no) {
		 String sql = "delete\r\n"
		    		+ "FROM code\r\n"
		    		+ "WHERE NO = ?";
		    try {
		    	conn = DB2.conn();
		        conn.setAutoCommit(false);
		        pstmt = conn.prepareStatement(sql);
		        pstmt.setInt(1, no);
		        int result = pstmt.executeUpdate();
		        if (result == 1) {
		        	conn.commit();
		            System.out.println("삭제 성공");
		        }
		    } catch (SQLException e) {
		        System.out.println("DB 오류: " + e.getMessage());
		        DB2.rollback(conn);
		    } catch (Exception e) {
		        System.out.println("일반 오류: " + e.getMessage());
		    } finally {
		    	DB2.close(rs, pstmt, conn);
		    }
	}

	public Dept getDept(int no) {
		Dept d = new Dept(0,"","");	// 데이터 없으면 대체될 default 객체
	    String sql = " SELECT * \r\n"
	    		+ "FROM dept\r\n"
	    		+ "WHERE deptno = ?";
	    try {
	        conn = DB2.conn();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, no);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            d = new Dept(
	                    rs.getInt("deptno"),
	                    rs.getString("dname"),
	                    rs.getString("loc")
	            );
	        }
	    } catch (SQLException e) {
	        System.out.println("DB 관련 오류: " + e.getMessage());
	    } catch (Exception e) {
	        System.out.println("일반 오류: " + e.getMessage());
	    } finally {
	        DB2.close(rs, pstmt, conn);
	    }
	    return d;
	}
	public Job getJobs(String job_id) {
	    Job job = new Job("","",0,0);
	    String sql = "	SELECT * \r\n"
	    		+ "FROM jobs\r\n"
	    		+ "WHERE JOB_ID = ? ";
	    System.out.println("# DB 접속 #");
	    try {
	        conn = DB2.conn();
	        pstmt = conn.prepareStatement(sql); 
	        pstmt.setString(1, job_id);; 
	        rs = pstmt.executeQuery();
	        //job_id, job_title, min_salary, max_salary
	        if (rs.next()) {
	        	job = new Job(
	        			rs.getString("job_id"),
	        			rs.getString("job_title"),
	        			rs.getInt("min_salary"),
	        			rs.getInt("max_salary")
	            );
	        }
	    } catch (SQLException e) {
	        System.out.println("DB 관련 오류: " + e.getMessage());
	    } catch (Exception e) {
	        System.out.println("일반 오류: " + e.getMessage());
	    } finally {
	        DB2.close(rs, pstmt, conn);
	    }
	    return job;
	}

	public static void main(String[] args) {
		A04_PreParedDao dao = new A04_PreParedDao();
		Map<String, String> emp = new HashMap<String, String>();
		//  name 	minSal 	maxSal
		emp.put("name","A");
		emp.put("minSal","0");
		emp.put("maxSal","12000");
		
		for(Employee e: dao.getEmpList(emp)) {
			
			System.out.print(e.getEmployee_id()+"\t");
			System.out.print(e.getFirst_name()+"\t");
			System.out.print(e.getLast_name()+"\t");
			System.out.print(e.getEmail()+"\t");
			System.out.print(e.getPhone_number()+"\t");
			System.out.print(e.getHire_date()+"\t");
			System.out.print(e.getJob_id()+"\t");
			System.out.print(e.getSalary()+"\t");
			System.out.print(e.getCommission_pct()+"\t");
			System.out.print(e.getDepartment_id()+"\n");
		}
		
		Map<String, String> dpm = new HashMap<String, String>();
		dpm.put("job_id", "IT_PROG");
		dpm.put("min", "10");
		dpm.put("max", "120");
		
		for(Department d: dao.getDepartList(dpm)) {
			System.out.print(d.getEmployee_id()+"\t");
			System.out.print(d.getStart_date()+"\t");
			System.out.print(d.getEnd_date()+"\t");
			System.out.print(d.getJob_id()+"\t");
			System.out.print(d.getDepartment_id()+"\n");
		}
		
		Map<String, String> jbs = new HashMap<String, String>();
		jbs.put("job_title","S");
		jbs.put("min","1000");
		jbs.put("max","10000");
		
		for(Jobs j: dao.getJobsList(jbs)) {
			System.out.print(j.getJobId()+"\t"
					+ j.getJobTitle()+"\t"
					+ j.getMinSal()+"\t"
					+ j.getMaxSal()+"\n"
					);
		}
		
/*		Emp ins = new Emp(1005, "맹구", "사장", 7902, "2002-03-01", 5000.0, 500.0, 20);
		dao.insertEmp(ins);
		
		Department01 dpt01 = new Department01(290,"untitle-2",30,3000);
		dao.insertDepart(dpt01);
		
		Emp upt = new Emp("맹구","사장","1970/09/11",5000.0,7369);
		dao.updateEmp(upt);
		
		Locations upt01 = new Locations("종로 1가", "343122", "서울", "서울", "SE", 1000);
		dao.updateLocation(upt01);
 */
		
//		Locations del = new Locations(1000);
		dao.deleteLocation(1100);
	}

}