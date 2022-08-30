package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import VO.TreviewVO;
import util.JDBCUtil;

public class TreviewDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_selectAll = "SELECT * FROM TREVIEW WHERE TRPK = ? ORDER BY TVPK";
	//final String sql_selectOne = "";
	//특정 리뷰를 조회 할 일이 없
	final String sql_insert = "INSERT INTO TREVIEW(TVPK,TUPK,TRPK,TSTAR,TBOARD) VALUES((SELECT NVL(MAX(TPPK),0) +1 FROM TREVIEW),?,?,?,?)";
	final String sql_update_S="UPDATE TREVIEW SET TSTAR = ? WHERE TVPK = ?";
	final String sql_update_M ="UPDATE TREVIEW SET TBOARD = ? WHERE TVPK = ?";
	final String sql_delete = "DELETE FROM TREVIEW WHERE TVPK = ?";
	
	public ArrayList<TreviewVO> selectAll(TreviewVO vo){
		ArrayList<TreviewVO> datas=new ArrayList<TreviewVO>();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectAll);
			pstmt.setInt(1, vo.getTrpk());
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				TreviewVO TreviewVO=new TreviewVO();
				TreviewVO.setTvpk(rs.getInt("TVPK"));
				TreviewVO.setTupk(rs.getInt("TUPK"));
				TreviewVO.setTrpk(rs.getInt("TRPK"));
				TreviewVO.setTstar(rs.getInt("TSTAR"));
				TreviewVO.setTboard(rs.getString("TBOARD"));
				datas.add(TreviewVO);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return datas;
	}
	public boolean insert(TreviewVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_insert);
			pstmt.setInt(1, vo.getTvpk());
			pstmt.setInt(2, vo.getTupk());
			pstmt.setInt(3, vo.getTrpk());
			pstmt.setInt(4, vo.getTstar());
			if(vo.getTboard() == null) {
				pstmt.setString(5, "-");		
			}else {
				pstmt.setString(5, vo.getTboard());					
			}
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
	public boolean delete(TreviewVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_delete);
			pstmt.setInt(1, vo.getTvpk());
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
	public boolean update_S(TreviewVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_update_S);
			pstmt.setInt(1, vo.getTstar());
			pstmt.setInt(2, vo.getTvpk());
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
	public boolean uodate_M(TreviewVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_update_M);
			pstmt.setString(1, vo.getTboard());
			pstmt.setInt(2, vo.getTvpk());
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
