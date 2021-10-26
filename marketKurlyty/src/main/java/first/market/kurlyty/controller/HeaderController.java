package first.market.kurlyty.controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import first.market.kurlyty.vo.Category_main;

@Controller
public class HeaderController {
	@Autowired
	private JdbcTemplate jdbc;
	
	
	@RequestMapping(value="categoryData.do", produces="html/text; charset=utf-8")
	@ResponseBody
	public String getCategoryMain() {
		StringBuffer categoryData = new StringBuffer();
		List<Category_main> category = jdbc.query("select * from mk_category_main", new RowMapper<Category_main>() {
			@Override
			public Category_main mapRow(ResultSet rs, int rowNum) throws SQLException {
				Category_main category = new Category_main();
				category.setSerial(rs.getString("category_main_serial"));
				category.setName(rs.getString("category_main_name"));
				category.setIconBlack(rs.getString("category_main_icon_black"));
				category.setIconColor(rs.getString("category_main_icon_color"));
				return category;
			}
			
		});
		//categoryData.append("[");
		for(Category_main cate : category) {
			categoryData.append("{\"serial\":"+"\""+cate.getSerial()+"\"");
			categoryData.append(",\"name\":"+"\""+cate.getName()+"\"");
			categoryData.append("}");
		}
		//categoryData.append("{}]");
		return categoryData.toString();
	}
}