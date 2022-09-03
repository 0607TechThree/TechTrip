package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import VO.TreplyVO;
import util.JDBCUtil;

public class TreplyDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_selectAll = "SELECT * FROM TREPLY WHERE TPPK = ? ORDER BY TPPK";
	final String sql_insert = "INSERT INTO TREPLY(TPPK,TUPK,TVPK,TPMSG) VALUES((SELECT NVL(MAX(TPPK),0) +1 FROM TREPLY),?,?,?)";
	final String sql_update="UPDATE TREPLY SET TPMSG = ? WHERE TPPK = ?";
	final String sql_delete = "DELETE FROM TREPLY WHERE TPPK = ?";
	
	public ArrayList<TreplyVO> selectAll(TreplyVO vo){
		ArrayList<TreplyVO> datas=new ArrayList<TreplyVO>();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectAll);
			pstmt.setInt(1, vo.getTppk());
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				TreplyVO TreplyVO=new TreplyVO();
				TreplyVO.setTppk(rs.getInt("TPPK"));
				TreplyVO.setTupk(rs.getInt("TUPK"));
				TreplyVO.setTvpk(rs.getInt("TVPK"));
				TreplyVO.setTpmsg(rs.getString("TPMSG"));
				datas.add(TreplyVO);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return datas;
	}
	public boolean insert(TreplyVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_insert);
			pstmt.setInt(1,vo.getTupk());
			pstmt.setInt(2,vo.getTvpk());
			pstmt.setString(3,vo.getTpmsg());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public boolean update(TreplyVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_update);
			pstmt.setInt(1,vo.getTppk());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public boolean delete(TreplyVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_delete);
			pstmt.setInt(1,vo.getTppk());
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
