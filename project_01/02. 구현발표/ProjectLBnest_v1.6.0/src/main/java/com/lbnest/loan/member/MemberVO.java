package com.lbnest.loan.member;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private String m_id;
	private String m_pwd;
	private String m_pwdck;
	private String m_name;
	private String m_phone;
	private String m_email;
	private String m_counselor_code;
	private String m_c_visible;
	private String m_business_registration;
	private String m_brokerage_license;
	private String m_zip_code;
	private String m_addr1;
	private String m_addr2;
	private int m_grade;
	private Date m_regdate;
	/** id 저장 여부 */
    private String id_save = "";
    private MultipartFile m_uploadFile1;
    private MultipartFile m_uploadFile2;
    private String m_file1;
    private String m_file2;
    /** 시작 rownum */
    private int start_num;    
    /** 종료 rownum */
    private int end_num;    
    /** 현재 페이지 */
    private int now_page=1;

	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public String getM_pwdck() {
		return m_pwdck;
	}
	public void setM_pwdck(String m_pwdck) {
		this.m_pwdck = m_pwdck;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_counselor_code() {
		return m_counselor_code;
	}
	public void setM_counselor_code(String m_counselor_code) {
		this.m_counselor_code = m_counselor_code;
	}
	public String getM_business_registration() {
		return m_business_registration;
	}
	public void setM_business_registration(String m_business_registration) {
		this.m_business_registration = m_business_registration;
	}
	public String getM_brokerage_license() {
		return m_brokerage_license;
	}
	public void setM_brokerage_license(String m_brokerage_license) {
		this.m_brokerage_license = m_brokerage_license;
	}
	public String getM_zip_code() {
		return m_zip_code;
	}
	public void setM_zip_code(String m_zip_code) {
		this.m_zip_code = m_zip_code;
	}
	public String getM_addr1() {
		return m_addr1;
	}
	public void setM_addr1(String m_addr1) {
		this.m_addr1 = m_addr1;
	}
	public String getM_addr2() {
		return m_addr2;
	}
	public void setM_addr2(String m_addr2) {
		this.m_addr2 = m_addr2;
	}
	public int getM_grade() {
		return m_grade;
	}
	public void setM_grade(int m_grade) {
		this.m_grade = m_grade;
	}
	public Date getM_regdate() {
		return m_regdate;
	}
	public void setM_regdate(Date m_regdate) {
		this.m_regdate = m_regdate;
	}
	public String getM_c_visible() {
		return m_c_visible;
	}
	public void setM_c_visible(String m_c_visible) {
		this.m_c_visible = m_c_visible;
	}
	public String getId_save() {
		return id_save;
	}
	public void setId_save(String id_save) {
		this.id_save = id_save;
	}
	public MultipartFile getM_uploadFile1() {
		return m_uploadFile1;
	}
	public void setM_uploadFile1(MultipartFile m_uploadFile1) {
		this.m_uploadFile1 = m_uploadFile1;
	}
	public MultipartFile getM_uploadFile2() {
		return m_uploadFile2;
	}
	public void setM_uploadFile2(MultipartFile m_uploadFile2) {
		this.m_uploadFile2 = m_uploadFile2;
	}
	public String getM_file1() {
		return m_file1;
	}
	public void setM_file1(String m_file1) {
		this.m_file1 = m_file1;
	}
	public String getM_file2() {
		return m_file2;
	}
	public void setM_file2(String m_file2) {
		this.m_file2 = m_file2;
	}
	public int getStart_num() {
		return start_num;
	}
	public void setStart_num(int start_num) {
		this.start_num = start_num;
	}
	public int getEnd_num() {
		return end_num;
	}
	public void setEnd_num(int end_num) {
		this.end_num = end_num;
	}
	public int getNow_page() {
		return now_page;
	}
	public void setNow_page(int now_page) {
		this.now_page = now_page;
	}
	
	
}
