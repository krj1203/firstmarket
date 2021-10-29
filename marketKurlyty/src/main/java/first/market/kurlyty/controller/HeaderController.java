package first.market.kurlyty.controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import first.market.kurlyty.vo.CategoryMainVO;
import first.market.kurlyty.vo.CategorySubVO;



@Controller
public class HeaderController {
   @Autowired
   private JdbcTemplate jdbc;
   @RequestMapping(value="categoryData.do", produces="html/text; charset=utf-8")
   @ResponseBody
   public String getCategoryMain() {
      StringBuffer categoryMain = new StringBuffer();
      List<CategoryMainVO> category =jdbc.query("select * from mk_category_main order by category_main_serial ASC", new RowMapper<CategoryMainVO>() {
         @Override
         public CategoryMainVO mapRow(ResultSet rs, int rowNum) throws SQLException {
            CategoryMainVO category = new CategoryMainVO();
            category.setSerial(rs.getString("category_main_serial"));
            category.setName(rs.getString("category_main_name"));
            category.setIconBlack(rs.getString("category_main_icon_black"));
            category.setIconColor(rs.getString("category_main_icon_color"));
            return category;
         }
         
      });
      categoryMain.append("[");
      
      for(CategoryMainVO cm : category) {
         List<CategorySubVO> categorySub = jdbc.query("select * from mk_category_sub where category_sub_first_no=?",
               new RowMapper<CategorySubVO>() {
                  @Override
                  public CategorySubVO mapRow(ResultSet rs, int rowNum) throws SQLException {
                     CategorySubVO category = new CategorySubVO();
                     category.setSerial(rs.getString("category_sub_serial"));
                     category.setName(rs.getString("category_sub_name"));
                     category.setFirstSerial(rs.getString("category_sub_first_no"));
                     return category;
                  }
            
         },new Object[]{cm.getSerial()});
         
         categoryMain.append("{\"serial\":"+"\""+cm.getSerial()+"\",");
         categoryMain.append("\"name\":"+"\""+cm.getName()+"\",");
         categoryMain.append("\"iconBlack\":"+"\""+cm.getIconBlack()+"\",");
         categoryMain.append("\"iconColor\":"+"\""+cm.getIconColor()+"\",");
         categoryMain.append("\"data\":[");
         for(CategorySubVO sub : categorySub) {
            categoryMain.append("{\"serial\":"+"\""+sub.getSerial()+"\",");
            categoryMain.append("\"name\":"+"\""+sub.getName()+"\",");
            categoryMain.append("\"firstSerial\":"+"\""+sub.getFirstSerial()+"\"},");
         }
         categoryMain.deleteCharAt(categoryMain.length()-1);
         categoryMain.append("]");
         categoryMain.append("},");
      }
      String jsonCategory = categoryMain.substring(0, categoryMain.length()-1) + "]";
      System.out.println(jsonCategory);
      return jsonCategory;
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
   
   /*mykurly ��Ʈ*/
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
   
   /*login and Join*/
   //ȸ������
   @RequestMapping("/join.do")
   public String loginAndJoin1() {
      return "login_and_join/join"; 
   }
   //�α���
   @RequestMapping("/login.do")
   public String loginAndJoin2() {
      return "login_and_join/login"; 
   }
   //���̵�ã��
   @RequestMapping("/idFind.do")
   public String loginAndJoin3() {
      return "login_and_join/idFind"; 
   }
   //���ã��
   @RequestMapping("/pwFind.do")
   public String loginAndJoin4() {
      return "login_and_join/pwFind"; 
   }
   
   /*cart_and_payment*/
   //�ֹ���
   @RequestMapping("/payment.do")
   public String cartAndPayment1() {
      return "cart_and_payment/payment"; 
   }
   //��ٱ���
   @RequestMapping("/cart.do")
   public String cartAndPayment2() {
      return "cart_and_payment/cart"; 
   }
   @RequestMapping("/admin_index.mdo")
   public String adminindex() {
      return "admin_index"; 
   }
}