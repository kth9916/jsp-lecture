package polymorphism_5_1_1;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TVUser {

	public static void main(String[] args) {
		
		//TVUser 클래스에서 객체를 생성하지 않고 외부 클래스에서 객체를 생성후 생성된 객체를 가지고 온다. 
			//결합도를 낮추는 방법 , 유지 보수를 아주 쉽게 해준다. 
		
		// 결합도 낮추는 2 가지 방법 
			//1. 인터페이스를 사용. (동일한 메소드)
			//2. 디자인 패턴 Factory 패턴 
				// -- 객체를 생성하는 별도의 클래스를 생성(BeanFactory) <== 객체 생성, 관리 
			//3. Spring 프레임워크에서 객체를 생성후 주입하는 방법 
					// - IoC (제어의 역행) : 객체 (개발자) ===> 객체 (Spring 프레임워크) 
					// - DI (의존성 주입) : 객체를 자바코드 내부에서 생성하지 않고 Spring 프레임워크에서
							//객체를 생성후 객체를 자바코드 내부로 주입 한다. 
		
		
		AbstractApplicationContext factory = 
				new GenericXmlApplicationContext("applicationContext.xml");
		
			//GenericXmlApplicationContext : Bean 설정 파일을 로드함 
		
		
		//스프링 컨테이너에서 객체를 요청 
	
		TV tv = (TV) factory.getBean("tv");   //가져온 객체를 TV 타입으로 업캐스팅 
		
		tv.powerOn();			//TV의 메소드 호출 ==> 생성된 객체의 메소드를 호출 
		tv.powerOff();
		tv.volumUp();
		tv.volumDown();
		
		factory.close();	

	}

}
