package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import VO.TbookVO;
import VO.TroomVO;
import util.JDBCUtil;

public class TbookDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_selectAll="SELECT * FROM TBOOK, TROOM WHERE TBOOK.TRPK = TROOM.TRPK AND TBOOK.TUPK=?";
	final String sql_selectOne="SELECT * FROM TBOOK WHERE TRPK = ?";	
	final String sql_insert="INSERT INTO TBOOK VALUES((SELECT NVL(MAX(TBPK),0) +1 FROM TBOOK),?,?)";
	//final String sql_update="UPDATE TBOOK SET WHERE TBPK = ? AND TUPK = ?";
	//예약 정보를 수정 할 일이 없음
	final String sql_delete="DELETE FROM TBOOK WHERE TBPK = ?";
	public ArrayList<TroomVO> selectAll(TbookVO vo){
		ArrayList<TroomVO> datas=new ArrayList<TroomVO>();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectAll);
			pstmt.setInt(1, vo.getTupk());
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
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return datas;	
	}
	public TbookVO selectOne(TbookVO vo){
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectOne);
			pstmt.setInt(1, vo.getTrpk());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				TbookVO data=new TbookVO();
				data.setTupk(rs.getInt("TUPK"));
				return data;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return null;
	}
	public boolean insert(TbookVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_insert);
			pstmt.setInt(1, vo.getTupk());
			pstmt.setInt(2, vo.getTrpk());
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
	public boolean delete(TbookVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_delete);
			pstmt.setInt(1,vo.getTbpk());
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
}
	