package polymorphism_4_1_2;

public class TVUser02 {

	public static void main(String[] args) {

		
		System.out.println("===================================");
		//별개의 객체를 생성 할 경우 : 메모리의 낭비가 초래됨 
			TV tv1 = new SamsungTV(); 
			TV tv2 = new SamsungTV(); 
			TV tv3 = new SamsungTV(); 
			TV tv4 = new SamsungTV(); 
			
			System.out.println(tv1);
			System.out.println(tv2);
			System.out.println(tv3);
			System.out.println(tv4);
		
		System.out.println("====================================");
		//주소를 복사해서 사용하면 메모리의 낭비를 줄여 줄 수 있다. 
			TV tv5 = new SamsungTV(); 
			TV tv6 = tv5; 			//tv6는 tv5의 주소만 복사함. 
			TV tv7 = tv6; 
			
			System.out.println(tv5);
			System.out.println(tv6);
			System.out.println(tv7);
	}

}
