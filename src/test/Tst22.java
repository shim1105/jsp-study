package test;

public class Tst22 {
	public static void main(String[] args) {
		int[] arr = { 5, 4, 1, 7, 3 };
		for (int i = 0; i < arr.length; i++) {
			for (int j = i + 1; j < arr.length; j++) {
				if (arr[i] > arr[j]) {
					int tmp = arr[i];
					arr[i] = arr[j];
					arr[j] = tmp;
				}
			}
		}
		for (int t : arr) {
			System.out.println(t);
		}
	}
}
