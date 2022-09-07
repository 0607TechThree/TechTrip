package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import VO.TreplyVO;
import VO.TreviewSet;
import VO.TreviewVO;
import util.JDBCUtil;

public class TreviewDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_selectAll = "SELECT * FROM TREVIEW WHERE TRPK = ? ORDER BY TVPK";
	final String sql_selectAll_U = "SELECT * FROM TREVIEW WHERE TUPK = ? ORDER BY TVPK";
	final String sql_selectAll_R = "SELECT * FROM TREPLY WHERE TVPK = ? ORDER BY TPPK";
	//final String sql_selectOne = "";
	//특정 리뷰를 조회 할 일이 없음
	final String sql_insert = "INSERT INTO TREVIEW(TVPK,TUPK,TRPK,TSTAR,TBOARD) VALUES((SELECT NVL(MAX(TVPK),0) +1 FROM TREVIEW),?,?,?,?)";
	final String sql_update_S="UPDATE TREVIEW SET TSTAR = ? WHERE TVPK = ?";
	final String sql_update_M ="UPDATE TREVIEW SET TBOARD = ? WHERE TVPK = ?";
	final String sql_delete = "DELETE FROM TREVIEW WHERE TVPK = ?";
	
	public ArrayList<TreviewSet> selectAll(TreviewVO vo){
		ArrayList<TreviewSet> datas=new ArrayList<TreviewSet>();
		conn=JDBCUtil.connect();
		try {
			if(vo.getTupk() != 0) {
				pstmt=conn.prepareStatement(sql_selectAll_U);
				pstmt.setInt(1, vo.getTupk());
			}else {			
				pstmt=conn.prepareStatement(sql_selectAll);
				pstmt.setInt(1, vo.getTrpk());
			}
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				TreviewSet ts = new TreviewSet();
				
				TreviewVO TreviewVO=new TreviewVO();
				TreviewVO.setTvpk(rs.getInt("TVPK"));
				TreviewVO.setTupk(rs.getInt("TUPK"));
				TreviewVO.setTrpk(rs.getInt("TRPK"));
				TreviewVO.setTstar(rs.getInt("TSTAR"));
				TreviewVO.setTboard(rs.getString("TBOARD"));
				ts.setTreviewVO(TreviewVO);
				
				ArrayList<TreplyVO> tList = new ArrayList<TreplyVO>();
				pstmt=conn.prepareStatement(sql_selectAll_R);
				pstmt.setInt(1, rs.getInt("TVPK"));
				ResultSet rs2=pstmt.executeQuery();
				while(rs2.next()) {
					TreplyVO TreplyVO=new TreplyVO();
					TreplyVO.setTppk(rs2.getInt("TPPK"));
					TreplyVO.setTupk(rs2.getInt("TUPK"));
					TreplyVO.setTvpk(rs2.getInt("TVPK"));
					TreplyVO.setTpmsg(rs2.getString("TPMSG"));
					tList.add(TreplyVO);
				}
				ts.setrList(tList);
				datas.add(ts);
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
			pstmt.setInt(1, vo.getTupk());
			pstmt.setInt(2, vo.getTrpk());
			pstmt.setInt(3, vo.getTstar());
			if(vo.getTboard().equals("")||vo.getTboard().equals(null)) {
				pstmt.setString(4, "-");		
			}else {
				pstmt.setString(4, vo.getTboard());					
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
