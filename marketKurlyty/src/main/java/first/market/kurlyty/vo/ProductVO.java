package first.market.kurlyty.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	private String category_main_serial;
	private String category_sub_serial;
	private int category_goods_serial;
	private String category_goods_name;
	private String category_goods_name_subtext;
	private String category_goods_unit;
	private String category_goods_weight;
	private String category_goods_origin;
	private String category_goods_packaging_type;
	private String category_goods_delivery_type;
	private Date category_goods_exp_date;
	private String category_goods_info;
	private String category_goods_ref;
	private String category_goods_image_main;
	private String category_goods_image_thumb;
	private String category_goods_image_contents_detail;
}
