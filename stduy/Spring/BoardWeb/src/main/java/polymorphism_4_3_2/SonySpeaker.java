package polymorphism_4_3_2;

public class SonySpeaker implements Speaker {
	
	//기본 생성자 
	public SonySpeaker() {
		System.out.println("===> 소니 스피커 객체 생성 ");
	}
	
	@Override
	public void volumUp() {
		System.out.println("SonySpeaker  --- 볼륨 업");
	}
	
	@Override
	public void volumDown() {
		System.out.println("SonySpeaker  --- 볼륨 다운 ");
	}

}
