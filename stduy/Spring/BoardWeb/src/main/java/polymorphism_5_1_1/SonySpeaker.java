package polymorphism_5_1_1;

import org.springframework.stereotype.Component;

@Component ("sony")  //sony 객체는 Speaker 타입과, SonySpeaker 두 타입을 모두 내포
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
