package polymorphism_4_2_2;

public class AppleSpeaker implements Speaker {
	
	public AppleSpeaker () {
		System.out.println("====> AppleSpeaker °´Ã¼ »ý¼º ");
	}

	@Override
	public void volumUp() {
		System.out.println("AppleSpeaker - º¼·ý ¾÷");

	}

	@Override
	public void volumDown() {
		System.out.println("AppleSpeaker - º¼·ý ´Ù¿î");

	}

}
