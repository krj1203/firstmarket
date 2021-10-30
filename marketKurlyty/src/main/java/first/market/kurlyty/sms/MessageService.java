package first.market.kurlyty.sms;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


public class MessageService {
	public void sendMessage(String toNumber, String randomNumber) {
		String apiKey = "NCSOFKMCQIHNL3X8";
		String apiSecret = "RKZOXSDBRRO0K4M4SYYVMNJZWBHUG0ZM";
		String fromNumber = "01028894993";
		Message coolsms = new Message(apiKey, apiSecret);

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", toNumber);
		params.put("from", fromNumber);
		params.put("type", "SMS");
		params.put("text", "[grabMe] 인증번호 "+randomNumber+" 를 입력하세요.");
		params.put("app_version", "test app 1.2"); // application name and version
		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}
}
