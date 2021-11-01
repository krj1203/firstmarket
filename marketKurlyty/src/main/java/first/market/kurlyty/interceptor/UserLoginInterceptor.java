package first.market.kurlyty.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class UserLoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Object loginStatus = session.getAttribute("userId");
		if(loginStatus==null) {
			response.sendRedirect("/kurlyty/login.do");
			return false;
		}
		return true;
	}
	
}
