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
}
