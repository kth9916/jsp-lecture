package polymorphism_2_3_2;

public class LgTV implements TV {

	@Override
	public void powerOn() {
		System.out.println("LgTV -- ������ �Ҵ�");

	}

	@Override
	public void powerOff() {
		System.out.println("LgTV -- ������ ����");

	}

	@Override
	public void volumUp() {
		System.out.println("LgTV -- �Ҹ��� ���δ�");

	}

	@Override
	public void volumDown() {
		System.out.println("LgTV -- �Ҹ��� �����");

	}

}
