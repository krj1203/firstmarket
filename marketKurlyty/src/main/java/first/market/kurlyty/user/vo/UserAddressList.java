package first.market.kurlyty.user.vo;

import lombok.Data;

@Data
public class UserAddressList {
	private int address_serial;
	private String user_address1;
	private String user_address2;
	private String user_zipcode;
	private String user_id;
}
