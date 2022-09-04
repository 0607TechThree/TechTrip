package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import VO.TroomVO;
import util.JDBCUtil;

public class TroomDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_selectAll_R="SELECT * FROM TROOM WHERE TRREGION = ?";
	final String sql_selectAll="SELECT * FROM TROOM";
	final String sql_selectAll_S="SELECT * FROM TROOM WHERE TRNAME LIKE '%'||?||'%'";
	final String sql_selectOne="SELECT * FROM TROOM WHERE TRPK = ?";
	final String sql_insert="INSERT INTO TROOM VALUES((SELECT NVL(MAX(TRPK),0) +1 FROM TROOM),?,?,?,?,?,?,?,?,?,?)";
	final String sql_update="UPDATE TROOM SET TRADDRESS = ?, TRREGION = ?, TRNAME = ?, TRPRICE = ?, TRINFO = ? WHERE TRPK = ?";
	final String sql_delete="UPDATE TROOM SET TRDEL = 0 WHERE TRPK = ?";
	final String sql_sample="SELECT COUNT(*) AS CNT FROM TROOM";
	final String sql_maxtrpk="SELECT NVL(MAX(TRPK),0) +1 FROM TROOM";

	public ArrayList<TroomVO> selectAll(TroomVO vo){
		ArrayList<TroomVO> datas=new ArrayList<TroomVO>();
		conn=JDBCUtil.connect();
		try {
			if(vo.getTrregion() != null) {
				pstmt=conn.prepareStatement(sql_selectAll_R);
				pstmt.setString(1, vo.getTrregion());				
			}else if(vo.getTrname() != null){
				pstmt=conn.prepareStatement(sql_selectAll_S);
				pstmt.setString(1, vo.getTrname());				
			}else {
				pstmt=conn.prepareStatement(sql_selectAll);		
			}
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				TroomVO data=new TroomVO();
				data.setTrpk(rs.getInt("TRPK"));
				data.setTrcategory(rs.getString("TRCATEGORY"));
				data.setTraddress(rs.getString("TRADDRESS"));
				data.setTrregion(rs.getString("TRREGION"));
				data.setTrname(rs.getString("TRNAME"));
				data.setTrprice(rs.getInt("TRPRICE"));
				data.setTrinfo(rs.getString("TRINFO"));
				data.setTupk(rs.getInt("TUPK"));
				data.setTrdel(rs.getInt("TRDEL"));
				data.setCheckin(rs.getString("CHECKIN"));
				data.setCheckout(rs.getString("CHECKOUT"));
				datas.add(data);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return datas;
	}
	public TroomVO selectOne(TroomVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectOne);
			pstmt.setInt(1, vo.getTrpk());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				TroomVO data = new TroomVO();
				data.setTrpk(rs.getInt("TRPK"));
				data.setTrcategory(rs.getString("TRCATEGORY"));
				data.setTraddress(rs.getString("TRADDRESS"));
				data.setTrregion(rs.getString("TRREGION"));
				data.setTrname(rs.getString("TRNAME"));
				data.setTrprice(rs.getInt("TRPRICE"));
				data.setTrinfo(rs.getString("TRINFO"));
				data.setTupk(rs.getInt("TUPK"));
				data.setTrdel(rs.getInt("TRDEL"));
				data.setCheckin(rs.getString("CHECKIN"));
				data.setCheckout(rs.getString("CHECKOUT"));
				return data;
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return null;
	}
	public boolean insert(TroomVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_insert);
			pstmt.setString(1, vo.getTrcategory());
			pstmt.setString(2, vo.getTraddress());
			pstmt.setString(3, vo.getTrregion());
			pstmt.setString(4, vo.getTrname());
			pstmt.setInt(5, vo.getTrprice());
			if(vo.getTrinfo().equals("") || vo.getTrinfo().equals(null)) {
				pstmt.setString(6, "-");		
			}else {				
				pstmt.setString(6, vo.getTrinfo());				
			}
			pstmt.setInt(7, vo.getTupk());
			pstmt.setInt(8, 1);
			pstmt.setString(9, vo.getCheckin());
			pstmt.setString(10, vo.getCheckout());
			int res=pstmt.executeUpdate();
			if(res==0) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public boolean update(TroomVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_update);
			pstmt.setString(1,vo.getTraddress());
			pstmt.setString(2,vo.getTrregion());
			pstmt.setString(3,vo.getTrname());
			pstmt.setInt(4,vo.getTrprice());
			pstmt.setString(5,vo.getTrinfo());
			pstmt.setInt(6,vo.getTrpk());
			int res=pstmt.executeUpdate();
			if(res==0) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public boolean delete(TroomVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_delete);
			pstmt.setInt(1,vo.getTrpk());
			int res=pstmt.executeUpdate();
			if(res==0) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public boolean hasSample(TroomVO vo) { //샘플이 존재하는지 확인하는 작업
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_sample);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			int cnt=rs.getInt("CNT"); // 데이터의 개수가
			if(cnt>=1) { // 1이상이라면
				return true; // 데이터가 있음을 true로 리턴
			}
			return false; // 아니라면 false 리턴
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
	}
	
	public int maxtrpk(TroomVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_maxtrpk);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				System.out.println(rs.getInt(1));
				return rs.getInt(1);
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return 0;
	}
}
