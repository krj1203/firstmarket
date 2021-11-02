package first.market.kurlyty.user.controller;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import first.market.kurlyty.vo.CategoryMainVO;
import first.market.kurlyty.vo.CategorySubVO;
import first.market.kurlyty.vo.ProductVO;



@Controller
public class oneToOneInquiryBoardController {
	
	//���� ���� �ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�
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
		System.out.println("���� Ȯ��");
		return jsonCategory;
	}
	@RequestMapping("categoryGoods.do")
	public String categoryGoods(ProductVO product) {
		System.out.println(product.getCategory_main_serial());
		System.out.println(product.getCategory_sub_serial());
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

	/*customerCenter*/
	//��������
	@RequestMapping("/notice.do")
	public String customerCenter1() {
		return "customerCenter/notice"; 
	}
	//�����ϴ�����
	@RequestMapping("/regularQuestion.do")
	public String customerCenter2() {
		return "customerCenter/regularQuestion"; 
	}
	//1:1�����ۼ�
	@RequestMapping("/oneToOneInquiryWrite.do")
	public String customerCenter3() {
		return "customerCenter/oneToOneInquiryWrite"; 
	}
	//1:1���ǰԽ���
	@RequestMapping("/oneToOneInquiryBoard.do")
	public String customerCenter4() {
		return "customerCenter/oneToOneInquiryBoard"; 
	}
	//�뷮�ֹ� ����
	@RequestMapping("/largeInquiryWrite.do")
	public String customerCenter5() {
		return "customerCenter/largeInquiryWrite"; 
	}
	//��ǰ�����ۼ�
	@RequestMapping("/suggestWrite.do")
	public String customerCenter6() {
		return "customerCenter/suggestWrite"; 
	}
	//��ǰ���ȰԽ���
	@RequestMapping("/suggestBoard.do")
	public String customerCenter7() {
		return "customerCenter/suggestBoard"; 
	}
	//���������ǵ���ۼ�
	@RequestMapping("/feedbackWrite.do")
	public String customerCenter8() {
		return "customerCenter/feedbackWrite"; 
	}
	//���������ǵ��Խ���
	@RequestMapping("/feedbackBoard.do")
	public String customerCenter9() {
		return "customerCenter/feedbackBoard"; 
	}
	