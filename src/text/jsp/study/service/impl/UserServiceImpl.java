package text.jsp.study.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import text.jsp.study.dao.UserDAO;
import text.jsp.study.dao.impl.UserDAOImpl;
import text.jsp.study.service.UserService;

public class UserServiceImpl implements text.jsp.study.service.UserService {
	private UserDAO udao= new UserDAOImpl();
	@Override
	public List<Map<String, String>> selectUserList(Map<String, String> user) {
		return udao.selectUserList(user);
	}

	@Override
	public Map<String, String> selectUser(Map<String, String> user) {
		return udao.selectUser(user);
	}

	@Override
	public int insertUser(Map<String, String> user) {
		return udao.insertUser(user);
	}

	@Override
	public int updateUser(Map<String, String> user) {
		return udao.updateUser(user);
	}

	@Override
	public int deleteUser(Map<String, String> user) {
		return udao.deleteUser(user);
	}
	public static void main(String[] args) {
		UserService us= new UserServiceImpl();
		System.out.println(us.selectUserList(null));
		Map<String,String> user= new HashMap<>();
		user.put("ui_num", "42");
		System.out.println(us.selectUser(user));
		user= new HashMap<>();
//		user.put("ui_name", "whdh");
//		user.put("ui_id", "si1");
//		user.put("ui_age", "22");
//		user.put("ui_etc", "50");
//		System.out.println(us.insertUser(user));
//		user.put("ui_num", "42");
//		user.put("ui_name", "ㅗ호호호");
//		user.put("ui_id", "호홓");
//		user.put("ui_age", "50");
//		user.put("ui_etc", "1");
//		System.out.println(us.updateUser(user));
		user.put("ui_num", "64");
		System.out.println(us.deleteUser(user));
	}
}
