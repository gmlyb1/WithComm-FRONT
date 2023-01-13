package com.with.community.vo;

import java.util.Date;

public class GoodsVO {

	private int goods_no;
	private String goods_name;
	private String cate_Code;
	private int goods_price;
	private int goods_stock;
	private String goods_des;
	private String goods_image;
	private Date goods_date;
	
	public int getGoods_no() {
		return goods_no;
	}
	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getCate_Code() {
		return cate_Code;
	}
	public void setCate_Code(String cate_Code) {
		this.cate_Code = cate_Code;
	}
	public int getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}
	public int getGoods_stock() {
		return goods_stock;
	}
	public void setGoods_stock(int goods_stock) {
		this.goods_stock = goods_stock;
	}
	public String getGoods_des() {
		return goods_des;
	}
	public void setGoods_des(String goods_des) {
		this.goods_des = goods_des;
	}
	public String getGoods_image() {
		return goods_image;
	}
	public void setGoods_image(String goods_image) {
		this.goods_image = goods_image;
	}
	public Date getGoods_date() {
		return goods_date;
	}
	public void setGoods_date(Date goods_date) {
		this.goods_date = goods_date;
	}
	
	@Override
	public String toString() {
		return "GoodsVO [goods_no=" + goods_no + ", goods_name=" + goods_name + ", cate_Code=" + cate_Code
				+ ", goods_price=" + goods_price + ", goods_stock=" + goods_stock + ", goods_des=" + goods_des
				+ ", goods_image=" + goods_image + ", goods_date=" + goods_date + "]";
	}
	
	
}
