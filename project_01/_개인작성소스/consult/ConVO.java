package com.lbnest.loan.consult;

public class ConVO {
	
	private int r_seq;
	private String r_name;
	private String r_phone;
	private String r_check;
	private String r_date;
	private String r_category;
	private String r_memo;
	
	
	public int getR_seq() {
		return r_seq;
	}
	public void setR_seq(int r_seq) {
		this.r_seq = r_seq;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_phone() {
		return r_phone;
	}
	public void setR_phone(String r_phone) {
		this.r_phone = r_phone;
	}
	public String getR_check() {
		return r_check;
	}
	public void setR_check(String r_check) {
		this.r_check = r_check;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public String getR_category() {
		return r_category;
	}
	public void setR_category(String r_category) {
		this.r_category = r_category;
	}
	public String getR_memo() {
		return r_memo;
	}
	public void setR_memo(String r_memo) {
		this.r_memo = r_memo;
	}
	
	@Override
	public String toString() {
		return "ConVO [r_seq=" + r_seq + ", r_name=" + r_name + ", r_phone=" + r_phone + ", r_check=" + r_check
				+ ", r_date=" + r_date + ", r_category=" + r_category + ", r_memo=" + r_memo + "]";
	}

	
}
