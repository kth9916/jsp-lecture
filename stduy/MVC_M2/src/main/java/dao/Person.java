package dao;

public class Person {
	private int id = 20181004;			// private : useBean : getProperty, setProperty
												// ������ getter�� ���ؼ� ����, setter�� ���ؼ� ����
	private String na = "ȫ�浿";			// private : useBean : getProperty, setProperty
	
	// �⺻ ������ : ���� �δ� ��� ����
	public Person () {}

	//Getter/Setter
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNa() {
		return na;
	}

	public void setNa(String na) {
		this.na = na;
	};	
	
	
}
