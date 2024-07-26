package com.lbnest.loan.notice;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {

	private int n_seq; //번호(프라이머리키)
	private String n_writer; //작성자(DB연동을 통해 로그인하여 m_name이 대신 들어감)
	private String n_title; // 공지사항 제목
	private String n_content; // 공지사항 내용
	private Date n_regDate; // 공지사항 날짜 기록
	private int n_count; // 공지사항 게시글 조회수
	private MultipartFile n_upload; // 공지사항 파일(사진, PDF)
	private String filename; // 공지사항 파일 이름(DB에는 파일 이름만 저장)
	private String searchCondition;  //검색조건 저장 제목 또는 내용
	private String searchKeyword; // 검색어
    private int start;               // 페이징을 위한 시작 인덱스
    private int size;                // 페이지당 표시할 항목 수
	
	
	public int getN_seq() {
		return n_seq;
	}
	public void setN_seq(int n_seq) {
		this.n_seq = n_seq;
	}
	
	public String getN_writer() {
		return n_writer;
	}
	public void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}
	
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public Date getN_regDate() {
		return n_regDate;
	}
	public void setN_regDate(Date n_regDate) {
		this.n_regDate = n_regDate;
	}

	public int getN_count() {
		return n_count;
	}
	public void setN_count(int n_count) {
		this.n_count = n_count;
	}
	public MultipartFile getN_upload() {
		return n_upload;
	}
	public void setN_upload(MultipartFile n_upload) {
		this.n_upload = n_upload;
	}

	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	
	
	@Override
	public String toString() {
		return "noticeVO [seq="+n_seq+", writer="+n_writer+", title="+n_title+", content="+n_content+", regDate="+n_regDate+", count="+n_count+", upload="+n_upload+"]";
	}

}
