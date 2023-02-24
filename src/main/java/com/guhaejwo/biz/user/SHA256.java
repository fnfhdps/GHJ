package com.guhaejwo.biz.user;

import java.security.MessageDigest;

public class SHA256 {

	// 이메일 값에 Hash를 적용한 값을 반환해서 이용하기 위해 만듬.
	// salt를 이용해서 악의적인 공격자의 공격으로부터 안전할 수 있도록 만들어줌.
	public static String getSHA256(String input) {
		StringBuffer result = new StringBuffer();
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");	// 실제로 사용자가 입력한 값을 SHA-256 으로 알고리즘 적용
			byte[] salt = "Hello! This is Salt.".getBytes();	// salt : 단순하게 SHA-256을 적용하게 되면 해커에 의해서 해킹을 당할 가능성이 높아지기 때문에 일반적으로 salt값을 적용한다.
			digest.reset();
			digest.update(salt);
			byte[] chars = digest.digest(input.getBytes("UTF-8"));
			for (int i=0; i<chars.length; i++) {
				String hex = Integer.toHexString(0xff & chars[i]);
				if (hex.length() == 1) result.append("0");	// 1자리수인 경우에는 "0"을 붙여서 총 두자리 값을 가지는 16진수 형태로 출력할 수 있도록 만들어줌.
				result.append(hex);	// hex 값을 뒤에 달아줌
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result.toString();
	}
}
