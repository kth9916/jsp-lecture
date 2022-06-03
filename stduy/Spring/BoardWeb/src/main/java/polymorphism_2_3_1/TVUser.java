package polymorphism_2_3_1;

public class TVUser {

	public static void main(String[] args) {
		/*
		SamsungTV tv = new SamsungTV();		
				// 강결합 상태, (개발자가 직접 프로그램 코드 내에서 객체를 생성)
		
		tv.powerOn();
		tv.powerOff();
		tv.volumeUp();
		tv.volumeDown();
		*/
		
		
		// 사용자의 요구로 인해서 Samsung TV에서 LgTV로 변경
			// 객체 생성, 메소드 이름 모두 변경
		LgTV tv = new LgTV();
		
		tv.turnOn();
		tv.turnOff();
		tv.soundUp();
		tv.soundDown();
	}

}
