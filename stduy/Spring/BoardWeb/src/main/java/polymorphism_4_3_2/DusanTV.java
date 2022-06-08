package polymorphism_4_3_2;


public class DusanTV implements TV {

	@Override
	public void powerOn() {
		System.out.println("두산TV - TV를 켭니다. ");

	}

	@Override
	public void powerOff() {
		System.out.println("두산TV - TV를 끕니다. ");

	}

	@Override
	public void volumUp() {
		System.out.println("두산TV - 소리를 높입니다. . ");

	}

	@Override
	public void volumDown() {
		System.out.println("두산TV - 소리를 줄입니다.  ");

	}

}
