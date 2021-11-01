package first.market.kurlyty.user.vo;

import lombok.Data;

@Data
public class UserVO {
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_email;
	private String user_phone;
	private String user_address1;
	private String user_address2;
	private String user_zipcode;
	private String user_sex;
	private String user_birth;
}
