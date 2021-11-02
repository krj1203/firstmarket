package first.market.kurlyty.user.controller;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import first.market.kurlyty.vo.CategoryMainVO;
import first.market.kurlyty.vo.CategorySubVO;
import first.market.kurlyty.vo.ProductVO;



@Controller
public class HeaderController {
//	@Autowired
//	private JdbcTemplate jdbc;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@RequestMapping(value="categoryData.do", produces="html/text; charset=utf-8")
	@ResponseBody
	public String getCategoryMain() {
		StringBuffer categoryMain = new StringBuffer();
		List<CategoryMainVO> category = sqlSession.selectList("CategoryDAO.getCategoryMain");
		categoryMain.append("[");
		
		for(CategoryMainVO cm : category) {
			List<CategorySubVO> categorySub = sqlSession.selectList("CategoryDAO.getCategorySub",cm);
			categoryMain.append("{\"serial\":"+"\""+cm.getCategory_main_serial()+"\",");
			categoryMain.append("\"name\":"+"\""+cm.getCategory_main_name()+"\",");
			categoryMain.append("\"iconBlack\":"+"\""+cm.getCategory_main_icon_black()+"\",");
			categoryMain.append("\"iconColor\":"+"\""+cm.getCategory_main_icon_color()+"\",");
			categoryMain.append("\"data\":[");
			for(CategorySubVO sub : categorySub) {
				categoryMain.append("{\"serial\":"+"\""+sub.getCategory_sub_serial()+"\",");
				categoryMain.append("\"name\":"+"\""+sub.getCategory_sub_name()+"\",");
				categoryMain.append("\"firstSerial\":"+"\""+sub.getCategory_sub_first_no()+"\"},");
			}
			categoryMain.deleteCharAt(categoryMain.length()-1);
			categoryMain.append("]");
			categoryMain.append("},");
		}
		String jsonCategory = categoryMain.substring(0, categoryMain.length()-1) + "]";
		System.out.println(jsonCategory);
		System.out.println("변경 확인");
		return jsonCategory;
	}
	@RequestMapping("categoryGoods.do")
	public String categoryGoods(ProductVO product, Model model) {
		System.out.println(product.getCategory_main_serial());
		System.out.println(product.getCategory_sub_serial());
		List<ProductVO> categoryProductList = sqlSession.selectList("CategoryDAO.getCategoryProductList",product);
		model.addAttribute("categoryProductList",categoryProductList);
		model.addAttribute("itemCount",categoryProductList.size());
		return "mainPage/categoryGoods";
	}
	
	@RequestMapping("/index.do")
	public String index() {
		return "mainPage/index";
	}
	@RequestMapping("/BestGoodsPage.do")
	public String BestGoods() {
		return "mainPage/BestGoodsPage"; 
	}
	@RequestMapping("/newGoodsPage.do")
	public String newGoodsPage() {
		return "mainPage/newGoodsPage"; 
	}
	@RequestMapping("/altleShopping.do")
	public String altleShopping() {
		return "mainPage/altleShopping"; 
	}
	
	/*mykurly 파트*/
	//
	@RequestMapping("/order.do")
	public String mykuly1() {
		return "mykurly/order"; 
	} //
	@RequestMapping("/destination.do")
	public String mykuly2() {
		return "mykurly/destination"; 
	}//
	@RequestMapping("/review.do")
	public String mykuly3() {
		return "mykurly/review"; 
	}
	@RequestMapping("/inquiry.do")
	public String mykuly4() {
		return "mykurly/inquiry"; 
	}
	@RequestMapping("/point.do")
	public String mykuly5() {
		return "mykurly/point"; 
	}
	@RequestMapping("/coupon.do")
	public String mykuly6() {
		return "mykurly/coupon"; 
	}
	@RequestMapping("/infoModify1.do")
	public String mykuly7() {
		return "mykurly/infoModify1"; 
	}
	@RequestMapping("/infoModify2.do")
	public String mykuly8() {
		return "mykurly/infoModify2"; 
	}
	
	/*customerCenter*/
	//공지사항
//	@RequestMapping("/notice.do")
//	public String customerCenter1() {
//		return "customerCenter/notice"; 
//	}
	//자주하는질문
	@RequestMapping("/regularQuestion.do")
	public String customerCenter2() {
		return "customerCenter/regularQuestion"; 
	}
	//1:1문의작성
	@RequestMapping("/oneToOneInquiryWrite.do")
	public String customerCenter3() {
		return "customerCenter/oneToOneInquiryWrite"; 
	}
	//1:1문의게시판
	@RequestMapping("/oneToOneInquiryBoard.do")
	public String customerCenter4() {
		return "customerCenter/oneToOneInquiryBoard"; 
	}
	//대량주문 문의
	@RequestMapping("/largeInquiryWrite.do")
	public String customerCenter5() {
		return "customerCenter/largeInquiryWrite"; 
	}
	//상품제안작성
	@RequestMapping("/suggestWrite.do")
	public String customerCenter6() {
		return "customerCenter/suggestWrite"; 
	}
	//상품제안게시판
	@RequestMapping("/suggestBoard.do")
	public String customerCenter7() {
		return "customerCenter/suggestBoard"; 
	}
	//에코포장피드백작성
	@RequestMapping("/feedbackWrite.do")
	public String customerCenter8() {
		return "customerCenter/feedbackWrite"; 
	}
	//에코포장피드백게시판
	@RequestMapping("/feedbackBoard.do")
	public String customerCenter9() {
		return "customerCenter/feedbackBoard"; 
	}
	
	/*login and Join*/
	//회원가입
	
	//로그인
	@RequestMapping("/login.do")
	public String loginAndJoin2() {
		return "login_and_join/login"; 
	}
	//아이디찾기
	@RequestMapping("/idFind.do")
	public String loginAndJoin3() {
		return "login_and_join/idFind"; 
	}
	//비번찾기
	@RequestMapping("/pwFind.do")
	public String loginAndJoin4() {
		return "login_and_join/pwFind"; 
	}
	
	/*cart_and_payment*/
	//주문서
	@RequestMapping("/payment.do")
	public String cartAndPayment1() {
		return "cart_and_payment/payment"; 
	}
	//장바구니
	@RequestMapping("/cart.do")
	public String cartAndPayment2() {
		return "cart_and_payment/cart"; 
	}
}
