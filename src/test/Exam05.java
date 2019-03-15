package test;

import java.util.HashMap;
import java.util.Map;

public class Exam05 {
	public static void main(String[] args) {
		Map<String,String[]> map = new HashMap<>();
		String[] strs= new String[3];
		
		System.out.println(strs.length);
		map.put("id", strs);
		System.out.println(map.get("id")[0]);
		System.out.println(map.get("id")[1]);
		System.out.println(map.get("id")[2]);
	}
}
