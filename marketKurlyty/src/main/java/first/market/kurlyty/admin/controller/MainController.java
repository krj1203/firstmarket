package first.market.kurlyty.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/admin_index.mdo")
	public String adminindex() {
		return "admin_index"; 
	}
	@RequestMapping("/admin_login.mdo")
	public String adminlogin() {
		return "admin_login"; 
	}
}
