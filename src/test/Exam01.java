package test;

public class Exam01 {
	int a;
	String str;
	int getInt() {
		return 1;
	}
	void getInt(String str) {
		return;
	}
	Exam01 getExam01() {
		this.a= 3;
		this.str="abc";
		return this;
	}
	public static void main(String[] args) {
		Exam01 e= new Exam01();
		Exam01 e1= new Exam01().getExam01();
		System.out.println(e.a); // 0
		System.out.println(e1.a); // 3
		StringBuilder sb= new StringBuilder()
				.append("a")
				.append("b")
				.append("c")
				.append("d")
				.append("e")
				.append("f")
				.append("g")
				.append("h")
				.append("i")
				.append("z")
				.append("w")
				.append("r")
				.append("t")
				.append("y");
		
		System.out.println(sb.toString());
				}
}
