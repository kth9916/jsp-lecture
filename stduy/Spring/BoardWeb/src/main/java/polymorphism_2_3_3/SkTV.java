package polymorphism_2_3_3;

public class SkTV implements TV {

	@Override
	public void powerOn() {
		System.out.println("SkTV - 전원을 켠다.");

	}

	@Override
	public void powerOff() {
		System.out.println("SkTV - 전원을 켠다.");

	}

	@Override
	public void volumUp() {
		System.out.println("SkTV - 볼륨을 올린다.");

	}

	@Override
	public void volumDown() {
		System.out.println("SkTV - 볼륨을 줄인다.");

	}

}
