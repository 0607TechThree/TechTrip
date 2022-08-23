package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class TbookDAO {
	Connection conn;
	PreparedStatement pstmt;
	private String sql_selectAll="SELECT * FROM TBOOK, TROOM WHERE TBOOK.TRPK = TROOM.TRPK";
	private String sql_insert="INSERT INTO TBOOK VALUES((SELECT NVL(MAX(TRPK),0) +1 FROM TROOM),?,?)";
	private String sql_update="UPDATE TBOOK SET WHERE TBPK = ? AND TUPK = ?";
	private String sql_delete="DELETE FROM TBOOK WHERE TBPK = ?";
}
