package first.market.kurlyty.user.vo;

import java.util.Date;

import lombok.Data;

@Data
public class UserDetailsVO {
	private int user_serial;
	private String user_id;
	private String user_membership_name;
	private Date user_last_login;
	private int user_point;
	private int user_status;
	private int user_total_purchase;
}
