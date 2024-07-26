package com.lbnest.loan.product;

public class ProductVO {
	private int pseq;
	private String pname;			// 상품이름
	private String classification;	// 상품분류
	private String feature;			// 상품특징
	private String qualification;	// 대출신청자격
	private String loanAmount;		// 대출금액
	private String payback;			// 대출기간 및 상환방법
	private String target;			// 대출대상주택
	private String applyFor;		// 대출신청시기
	private String autoLoan;		// 통장자동대출
	private String paybackMethod;	// 원리금상환방법
	private String cashback;		// KB국민카드 캐시백
	private String pagelink;		// 자세히보기 링크
	
	// 검색 조건과 검색어
    private String searchCondition;
    private String searchKeyword;

    
    public int getPseq() {
		return pseq;
	}

	public void setPseq(int pseq) {
		this.pseq = pseq;
	}

	// 각 필드에 대한 getter와 setter 메소드
    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getClassification() {
        return classification;
    }

    public void setClassification(String classification) {
        this.classification = classification;
    }

    public String getFeature() {
        return feature;
    }

    public void setFeature(String feature) {
        this.feature = feature;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getLoanAmount() {
        return loanAmount;
    }

    public void setLoanAmount(String loanAmount) {
        this.loanAmount = loanAmount;
    }

    public String getPayback() {
        return payback;
    }

    public void setPayback(String payback) {
        this.payback = payback;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public String getApplyFor() {
        return applyFor;
    }

    public void setApplyFor(String applyFor) {
        this.applyFor = applyFor;
    }

    public String getAutoLoan() {
        return autoLoan;
    }

    public void setAutoLoan(String autoLoan) {
        this.autoLoan = autoLoan;
    }

    public String getPaybackMethod() {
        return paybackMethod;
    }

    public void setPaybackMethod(String paybackMethod) {
        this.paybackMethod = paybackMethod;
    }

    public String getCashback() {
        return cashback;
    }

    public void setCashback(String cashback) {
        this.cashback = cashback;
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
    

	public String getPagelink() {
		return pagelink;
	}

	public void setPagelink(String pagelink) {
		this.pagelink = pagelink;
	}

	
	@Override
	public String toString() {
		return "ProductVO [pseq=" + pseq + ", pname=" + pname + ", classification=" + classification + ", feature="
				+ feature + ", qualification=" + qualification + ", loanAmount=" + loanAmount + ", payback=" + payback
				+ ", target=" + target + ", applyFor=" + applyFor + ", autoLoan=" + autoLoan + ", paybackMethod="
				+ paybackMethod + ", cashback=" + cashback + ", pagelink=" + pagelink + ", searchCondition="
				+ searchCondition + ", searchKeyword=" + searchKeyword + "]";
	}
	
}


