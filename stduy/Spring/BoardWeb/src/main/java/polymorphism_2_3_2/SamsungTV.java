package polymorphism_2_3_2;

public class SamsungTV implements TV {

	@Override
	public void powerOn() {
		System.out.println("»ï¼ºTV -- Àü¿øÀ» ÄÒ´Ù");

	}

	@Override
	public void powerOff() {
		System.out.println("»ï¼ºTV -- Àü¿øÀ» ²ö´Ù");

	}

	@Override
	public void volumUp() {
		System.out.println("»ï¼ºTV -- ¼Ò¸®¸¦ ³ôÀÎ´Ù");

	}

	@Override
	public void volumDown() {
		System.out.println("»ï¼ºTV -- ¼Ò¸®¸¦ ³·Ãá´Ù");

	}

}
