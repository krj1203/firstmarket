package first.market.kurlyty.user.controller;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;

public class SecurityUtil {
	public static SecretKey getKey() throws Exception {
		KeyGenerator keyGen = KeyGenerator.getInstance("AES");
		SecretKey secretKey = keyGen.generateKey();
		
		return secretKey;
	}
	public static IvParameterSpec getIv() {
		byte[] iv=new byte[16];
		new SecureRandom().nextBytes(iv);
		return new IvParameterSpec(iv);
	}
	public static String encrypt(String specName, SecretKey key, IvParameterSpec iv, String plainText) throws Exception{
		Cipher cipher = Cipher.getInstance(specName);
		cipher.init(Cipher.ENCRYPT_MODE, key, iv);
		byte[] encrypted = cipher.doFinal(plainText.getBytes(StandardCharsets.UTF_8));
		
		return new String(Base64.getEncoder().encode(encrypted));
	}
	public static String decrypt(String specName, SecretKey key, IvParameterSpec iv, String cipherText) throws Exception{
		Cipher cipher = Cipher.getInstance(specName);
		cipher.init(Cipher.DECRYPT_MODE, key, iv);
		byte[] decrypted = cipher.doFinal(Base64.getDecoder().decode(cipherText));
		
		return new String(decrypted, StandardCharsets.UTF_8);
	}
	
	//이함수 사용
	public static String sha256(String msg) throws NoSuchAlgorithmException{
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.update(msg.getBytes());
		return bytesToHex(md.digest());
	}
	public static String bytesToHex(byte[] bytes) {
		StringBuilder builder = new StringBuilder();
		for(byte b: bytes) {
			builder.append(String.format("%02x", b));
		}
		return builder.toString();
	}
}
