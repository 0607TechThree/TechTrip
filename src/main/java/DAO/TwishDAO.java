package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import VO.TwishVO;
import util.JDBCUtil;

public class TwishDAO {
	Connection conn;
	PreparedStatement pstmt;
	private String sql_selectAll="SELECT * FROM TWISH WHERE TUPK = ?";
	private String sql_insert="INSERT INTO TWISH VALUES((SELECT NVL(MAX(TWPK),0) +1 FROM TWISH),?,?)";
	private String sql_delete="DELETE FROM TWISH WHERE TWPK = ?";
	
	public ArrayList<TwishVO> selectAll(TwishVO vo){
		ArrayList<TwishVO> datas = new ArrayList<TwishVO>();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectAll);
			pstmt.setInt(1, vo.getTupk());
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				TwishVO data = new TwishVO();
				data.setTwpk(rs.getInt("TWPK"));
				data.setTupk(rs.getInt("TUPK"));
				data.setTrpk(rs.getInt("TRPK"));
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
	public boolean insert(TwishVO vo) {
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
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public boolean delete(TwishVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_delete);
			pstmt.setInt(1, vo.getTwpk());
			int res=pstmt.executeUpdate();
			if(res==0) {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
}
