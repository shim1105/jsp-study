package test;

class Dog {
	String name;
}

public class Exam02 {
	Dog d;

	public Dog getDog() {
		if (d == null) {
			d = new Dog();
		}
		return d;
	}

	public static void main(String[] args) {
		Exam02 e = new Exam02();
		Dog d = e.getDog();

	}

}
