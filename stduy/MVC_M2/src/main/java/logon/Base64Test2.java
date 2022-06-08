package logon;

import org.apache.tomcat.util.codec.binary.Base64;

// ���¼ҽ� : ���̺귯�� ����� �ʿ� : https://mvnrepository.com/artifact/commons-codec/commons-codec/1.9

public class Base64Test2 {

	public static void main(String[] args) {
		base64();
	}
	
	public static void base64() {
		String text = "12345";
		
		// ���ڵ�
		byte[] encodedBytes = Base64.encodeBase64(text.getBytes());
		String encodedTxt = new String(encodedBytes);
		
		System.out.println("====== ���ڵ� ======");
		System.out.println("���ڵ� �� ������ : " + text);
		System.out.println("���ڵ� �� ������ : " + encodedTxt);
		
		// ���ڵ�
		byte[] decodedBytes = Base64.decodeBase64(encodedBytes);
		byte[] decodedBytes2 = Base64.decodeBase64(encodedTxt);
		
		String decodedTxt = new String (decodedBytes);
		String decodedTxt2 = new String (decodedBytes2);
		
		System.out.println("====== ���ڵ� ======");
		System.out.println("���ڵ� (byte �迭) : " + decodedTxt);
		System.out.println("���ڵ� (byte �迭) : " + decodedTxt2);
	}

}
