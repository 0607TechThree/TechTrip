package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import VO.TuserVO;
import util.JDBCUtil;

public class TuserDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_selectOne="SELECT * FROM TUSER WHERE TUID=? AND TUPW=?";
	final String sql_selectOne_K="SELECT * FROM TUSER WHERE KEMAIL = ?";	
	final String sql_selectOne_N="SELECT * FROM TUSER WHERE NEMAIL = ?";	
	final String sql_checkId="SELECT * FROM TUSER WHERE TUID=?";
	final String sql_insert="INSERT INTO TUSER VALUES((SELECT NVL(MAX(TUPK),0) +1 FROM TUSER),?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	final String sql_update="UPDATE TUSER SET TUNICKNAME = ? WHERE TUID = ?";
	final String sql_delete="UPDATE TUSER SET TUDEL = 0 WHERE TUID = ?";
	
	public int checkId(TuserVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_checkId);
			pstmt.setString(1, vo.getTuid());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				return 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return 1;
	}
	public TuserVO selectOne(TuserVO vo) {
		conn=JDBCUtil.connect();
		System.out.println("여긴 들어오지 ㅋ");
		System.out.println(vo);
		try {
			if(vo.getKemail() != null) {
				pstmt=conn.prepareStatement(sql_selectOne_K);
				pstmt.setString(1, vo.getKemail());
				System.out.println("kemail if문 들어옴");
			}else if(vo.getNemail() != null) {
				pstmt=conn.prepareStatement(sql_selectOne_N);
				pstmt.setString(1, vo.getNemail());
				System.out.println("nemail if문 들어옴");
			}else {
				pstmt=conn.prepareStatement(sql_selectOne);
				pstmt.setString(1, vo.getTuid());
				pstmt.setString(2, vo.getTupw());
				System.out.println("selectone if문 들어옴");
			}
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				TuserVO data=new TuserVO();
				data.setTupk(rs.getInt("TUPK"));
				data.setTuid(rs.getString("TUID"));
				data.setTupw(rs.getString("TUPW"));
				data.setTurole(rs.getString("TUROLE"));
				data.setTunickname(rs.getString("TUNICKNAME"));
				data.setTudel(rs.getInt("TUDEL"));
				data.setTugender(rs.getString("TUGENDER"));
				data.setTubirth(rs.getString("TUBIRTH"));
				data.setTuph(rs.getString("TUPH"));
				data.setTuaddresszipcode(rs.getInt("TUADDRESSZIPCODE"));
				data.setTuaddress(rs.getString("TUADDRESS"));
				data.setTuaddressdetail(rs.getString("TUADDRESSDETAIL"));
				data.setTunation(rs.getString("TUNATION"));
				data.setKemail(rs.getString("KEMAIL"));					
				data.setNemail(rs.getString("NEMAIL"));
				System.out.println("selectone 로그 : " +data);
				return data;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return null;
	}
	public boolean insert(TuserVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_insert);
			pstmt.setString(1, vo.getTuid());
			pstmt.setString(2, vo.getTupw());
			pstmt.setString(3, vo.getTurole());
			pstmt.setString(4, vo.getTunickname());
			pstmt.setInt(5, 1);
			pstmt.setString(6, vo.getTugender());
			pstmt.setString(7, vo.getTubirth());
			pstmt.setString(8, vo.getTuph());
			pstmt.setInt(9, vo.getTuaddresszipcode());
			pstmt.setString(10, vo.getTuaddress());
			pstmt.setString(11, vo.getTuaddressdetail());
			pstmt.setString(12, vo.getTunation());
			pstmt.setString(13, vo.getKemail());
			pstmt.setString(14, vo.getNemail());
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
	public boolean update(TuserVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_update);
			pstmt.setString(1, vo.getTunickname());
			pstmt.setString(2, vo.getTuid());
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
	public boolean delete(TuserVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_delete);
			pstmt.setString(1, vo.getTuid());
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
