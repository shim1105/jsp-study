package text.jsp.study.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import text.jsp.study.service.UserService;
import text.jsp.study.service.impl.UserServiceImpl;

public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService us= new UserServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter(); // 이거 전에 해야지 글자가 안깨짐
		String cmd = request.getParameter("cmd");
		if (cmd == null) {
			pw.print("커맨드 없는 요청은 정상적인 요청이 아닙니다,");
		} else {
			if( "users".equals(cmd)) {
				pw.print(us.selectUserList(null));
			}else if( "user".equals(cmd)){
				String uiNum=request.getParameter("ui_num");
				if(uiNum==null || "".equals(uiNum)) {
					pw.print("누구를 조회하라고 ???");
				}else {
					Map<String,String> user=new HashMap<>(); 
					user.put("ui_num", uiNum);
					pw.print(us.selectUser(user));
				}
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String cmd = request.getParameter("cmd");
		if (cmd == null) {
			pw.print("커맨드 없는 요청은 정상적인 요청이 아닙니다,");
		} else {
			if ("insert".equals(cmd)) {
				String uiName= request.getParameter("ui_name");
				String uiId= request.getParameter("ui_id");
				String uiAge= request.getParameter("ui_age");
				String uiEtc=request.getParameter("ui_etc");
				Map<String,String> user= new HashMap<>();
				user.put("ui_name",uiName );
				user.put("ui_id", uiId);
				user.put("ui_age", uiAge);
				user.put("ui_etc", uiEtc);
				int cnt=us.insertUser(user);
				String result="등록 실패";
				if(cnt==1) {
					result="등록 성공";
				}
				pw.print(result);
			} else if ("update".equals(cmd)) {
				String uiNum= request.getParameter("ui_num");
				String uiName= request.getParameter("ui_name");
				String uiId= request.getParameter("ui_id");
				String uiAge= request.getParameter("ui_age");
				String uiEtc=request.getParameter("ui_etc");
				Map<String,String> user= new HashMap<>();
				user.put("ui_num", uiNum);
				user.put("ui_name",uiName );
				user.put("ui_id", uiId);
				user.put("ui_age", uiAge);
				user.put("ui_etc", uiEtc);
				int cnt=us.updateUser(user);
				String result="수정 실패";
				if(cnt==1) {
					result="수정 성공";
				}
				pw.print(result); 
			} else if ("delete".equals(cmd)) {
				Map<String,String> user= new HashMap<>();
				user.put("ui_num", request.getParameter("ui_num"));
				int cnt=us.deleteUser(user);
				String result="삭제 실패";
				if(cnt==1) {
					result="삭제 성공";
				}
				pw.print(result);
			}
		}

	}

}
