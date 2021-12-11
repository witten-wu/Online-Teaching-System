package com.Train.model;


public class Mail {
    private String toMail; //收件人
    private String mailTitle; //邮件标题
    private String mailContent; //邮件内容
    private String[]CCs;//设置抄送人
    
	public Mail(String toMail, String mailTitle, String mailContent, String[] cCs) {
		super();
		this.toMail = toMail;
		this.mailTitle = mailTitle;
		this.mailContent = mailContent;
		CCs = cCs;
	}

	public String getToMail() {
		return toMail;
	}

	public void setToMail(String toMail) {
		this.toMail = toMail;
	}

	public String getMailTitle() {
		return mailTitle;
	}

	public void setMailTitle(String mailTitle) {
		this.mailTitle = mailTitle;
	}

	public String getMailContent() {
		return mailContent;
	}

	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}

	public String[] getCCs() {
		return CCs;
	}

	public void setCCs(String[] cCs) {
		CCs = cCs;
	}
    
}
