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
	private String sql_selectAll="SELECT * FROM TROOM WHERE TRREGION = ?";
	private String sql_selectOne="SELECT * FROM TROOM WHERE TRPK = ?";
	private String sql_insert="INSERT INTO TROOM VALUES((SELECT NVL(MAX(TRPK),0) +1 FROM TROOM),?,?,?,?,?,?,?,?,?,?)";
	private String sql_update="UPDATE TROOM SET TRADDRESS = ?, TRREGION = ?, TRNAME = ?, TRPRICE = ?, TRINFO = ? WHERE TRPK = ?";
	private String sql_delete="UPDATE TROOM SET TRDEL = 0 WHERE TRPK = ?";

	public ArrayList<TroomVO> selectAll(TroomVO vo){
		ArrayList<TroomVO> datas=new ArrayList<TroomVO>();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectAll);
			pstmt.setString(1, vo.getTrregion());
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
			pstmt.setInt(1, vo.getTupk());
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
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
			pstmt.setString(6, vo.getTrinfo());
			pstmt.setInt(7, vo.getTupk());
			pstmt.setInt(8, 1);
			pstmt.setString(9, vo.getCheckin());
			pstmt.setString(10, vo.getCheckout());
			pstmt.executeUpdate();
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
			pstmt.executeUpdate();
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
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
}
