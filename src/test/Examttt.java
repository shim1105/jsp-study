package test;

public class Examttt {
	public static void main(String[] args) {
		for(int i = 1;i<=1000000000;i++) {
			int num =Integer.parseInt((i+"").substring((i+"").length()-1));
			if(num != 0 && num%3==0) {
				System.out.print("짝,");
			}else {
				System.out.print(i+",");
			}
			if(i%10==0) {
				System.out.println();
			}
		}
	}
}
