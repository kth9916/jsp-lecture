package polymorphism_2_3_2;

public class TVUser {

	public static void main(String[] args) {
		
		//SamsungTV tv = new SamsungTV();
		
		//LgTV tv = new LgTV();
		
		TV tv = new LgTV();		// 업캐스팅 (다형성 구현)
		
		tv.powerOn();
		tv.powerOff();
		tv.volumUp();
		tv.volumDown();
		
		// 인터페이스를 사용하면 약결합을 만들어서 유지 보수를 쉽게 한다

	}

}
