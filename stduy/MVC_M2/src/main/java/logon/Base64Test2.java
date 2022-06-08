package logon;

import org.apache.tomcat.util.codec.binary.Base64;

// 오픈소스 : 라이브러리 등록이 필요 : https://mvnrepository.com/artifact/commons-codec/commons-codec/1.9

public class Base64Test2 {

	public static void main(String[] args) {
		base64();
	}
	
	public static void base64() {
		String text = "12345";
		
		// 인코딩
		byte[] encodedBytes = Base64.encodeBase64(text.getBytes());
		String encodedTxt = new String(encodedBytes);
		
		System.out.println("====== 인코딩 ======");
		System.out.println("인코딩 전 데이터 : " + text);
		System.out.println("인코딩 후 데이터 : " + encodedTxt);
		
		// 디코딩
		byte[] decodedBytes = Base64.decodeBase64(encodedBytes);
		byte[] decodedBytes2 = Base64.decodeBase64(encodedTxt);
		
		String decodedTxt = new String (decodedBytes);
		String decodedTxt2 = new String (decodedBytes2);
		
		System.out.println("====== 디코딩 ======");
		System.out.println("디코딩 (byte 배열) : " + decodedTxt);
		System.out.println("디코딩 (byte 배열) : " + decodedTxt2);
	}

}
