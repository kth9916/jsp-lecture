package polymorphism_5_1_1;

import org.springframework.stereotype.Component;

//@Component ("tv")
public class LgTV implements TV {

	@Override
	public void powerOn() {
		System.out.println("LGTV -- 전원을 켠다");

	}

	@Override
	public void powerOff() {
		System.out.println("LGTV -- 전원을 끈다");

	}

	@Override
	public void volumUp() {
		System.out.println("LGTV -- 소리를 높인다");

	}

	@Override
	public void volumDown() {
		System.out.println("LGTV -- 소리를 낮춘다. ");

	}

}
