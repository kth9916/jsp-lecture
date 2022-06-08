package polymorphism_2_3_3;

public interface TV {
	/*
	 * 인터페이스를 사용하면 메소드 이름을 동일하게 사용해서 유지 보수를 쉽게
	 * 할 수 있다. (결합도를 낮춘다.)
	 * 결합도를 낮추는 여러 밥법중의 하나. 
	 * 	-- 인터페이스의 메소드를 오버라이딩해서 결합도를 낮춘다. 
	 */
	
	//메소드 선언만 되고 구현 부가 없는 메소드 (추상메소드 )
	
	public void powerOn();    
	public void powerOff(); 
	public void volumUp(); 
	public void volumDown(); 
	
}
