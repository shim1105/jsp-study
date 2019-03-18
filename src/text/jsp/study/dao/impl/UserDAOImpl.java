package text.jsp.study.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import text.jsp.study.dao.UserDAO;
import text.jsp.study.db.DBCon;

public class UserDAOImpl implements UserDAO {
	
	@Override
	public List<Map<String, String>> selectUserList(Map<String, String> user) {
		String sql= "select ui_num,ui_name,ui_id,ui_age,ui_etc from user_info";
		List<Map<String,String>> userList= new ArrayList<>();

		try {
			PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Map<String,String> u= new HashMap<>();
				u.put("ui_num", rs.getString("ui_num"));
				u.put("ui_name", rs.getString("ui_name"));
				u.put("ui_id", rs.getString("ui_id"));
				u.put("ui_age", rs.getString("ui_age"));
				u.put("ui_etc", rs.getString("ui_etc"));
				userList.add(u);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBCon.close();
		}
		return userList;
	}

	@Override
	public Map<String, String> selectUser(Map<String, String> user) {
		String sql= "select ui_num,ui_name,ui_id,ui_age,ui_etc from user_info where 1=1";
		sql += " and ui_num=?";
		try {
			PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
			ps.setString(1, user.get("ui_num"));
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Map<String,String> u= new HashMap<>();
				u.put("ui_num", rs.getString("ui_num"));
				u.put("ui_name", rs.getString("ui_name"));
				u.put("ui_id", rs.getString("ui_id"));
				u.put("ui_age", rs.getString("ui_age"));
				u.put("ui_etc", rs.getString("ui_etc"));
				return u;	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBCon.close();
		}
		return null;
	}

	@Override
	public int insertUser(Map<String, String> user) {
		String sql="insert into user_info(ui_num,ui_name,ui_id,ui_age,ui_etc)";
		sql += " values(seq_ui_num.nextval,?,?,?,?)";
		try {
			PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
			ps.setString(1, user.get("ui_name"));
			ps.setString(2, user.get("ui_id"));
			ps.setString(3, user.get("ui_age"));
			ps.setString(4, user.get("ui_etc"));
			return ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBCon.close();
		}
		return 0;
	}

	@Override
	public int updateUser(Map<String, String> user) {
		// TODO Auto-generated method stub
		String sql= "update user_info set ";
		if(user.get("ui_name")!=null) {
			sql +=" ui_name=? ,";
		}if(user.get("ui_id")!=null) {
			sql +=" ui_id=? ,";
		}if(user.get("ui_age")!=null) {
			sql +=" ui_age=? ,";
		}if(user.get("ui_etc")!=null) {
			sql +=" ui_etc=? ,";
		}
		sql = sql.substring(0,sql.length()-1);
		sql += " where ui_num = ?";
		
		try {
			int co = 1;
			PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
			if(user.get("ui_name")!=null) {
				ps.setString(co++,user.get("ui_name"));	
			}if(user.get("ui_id")!=null) {
				ps.setString(co++,user.get("ui_id"));
			}if(user.get("ui_age")!=null) {
				ps.setString(co++,user.get("ui_age"));
			}if(user.get("ui_etc")!=null) {
				ps.setString(co++,user.get("ui_etc"));
			}
			ps.setString(co, user.get("ui_num"));
			return ps.executeUpdate();			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBCon.close();
		}
		
		
		return 0;
	}

	@Override
	public int deleteUser(Map<String, String> user) {
		// TODO Auto-generated method stub
		String sql= "delete from user_info where ui_num=?";
		try {
			PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
			ps.setString(1, user.get("ui_num"));
			return ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBCon.close();
		}
		
		return 0;
	}
	public static void main(String[] args) {
		UserDAO udao = new UserDAOImpl();
		System.out.println(udao.selectUserList(null));
		Map<String,String> user = new HashMap<>();
		user.put("ui_num", "43");
		System.out.println(udao.selectUser(user));
		user = new HashMap<>();
//		user.put("ui_name", "임꺽정");
//		user.put("ui_id", "의적");
//		user.put("ui_age", "33");
//		user.put("ui_etc", "죽은살함");
//		System.out.println(udao.insertUser(user));
//		user.put("ui_num", "43");
//		user.put("ui_name", "ghghghg");
//		user.put("ui_id", "shw1");
//		user.put("ui_age", "30");
//		user.put("ui_etc", "5000");
//		System.out.println(udao.updateUser(user));
//		user.put("ui_num", "61");
//		System.out.println(udao.deleteUser(user));
		
	}

}
