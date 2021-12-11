package com.Train.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.Train.model.Mail;



public class MailSender {
	
	private static Properties props = null;
	
	/**
	 * 发送邮件
	 */
	public static void sendMail(Mail mail){
		InputStream in =MailSender.class.getClassLoader()
				.getResourceAsStream("mail.properties");
		props = new Properties();
		try {
			props.load(in);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		Properties mailProps = new Properties();
		mailProps.put("mail.smtp.user", props.getProperty("mailSender"));
		mailProps.setProperty("mail.host", props.getProperty("host"));
		mailProps.setProperty("mail.smtp.auth",props.getProperty("auth"));
		mailProps.setProperty("mail.smtp.port",props.getProperty("port"));
		mailProps.put("mail.smtp.starttls.enable", "true");
		
		Authenticator auth = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(props.getProperty("username"),
						props.getProperty("password"));
			}
		};
		Session session = Session.getInstance(mailProps, auth);
		
		/*
		 * 2. 创建MimeMessage
		 */
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setFrom(new InternetAddress(props.getProperty("mailSender")));//设置发件人
			msg.setRecipients(RecipientType.TO,mail.getToMail());//设置收件人
			msg.setSubject(mail.getMailTitle());
			msg.setText(mail.getMailContent());
			/*
			 * 设置多人抄送
			 */
			String[]ccs=mail.getCCs();
			if(ccs!=null&&!ccs.equals("")&&ccs.length>0){
				Address[]ccAddress=new InternetAddress[ccs.length];
				for(int i=0;i<ccs.length;i++){
					ccAddress[i]=new InternetAddress(ccs[i]);
				}
				msg.setRecipients(RecipientType.CC,ccAddress);
			}
//			msg.setRecipients(RecipientType.BCC, "itcast_cxf@sina.com");//设置暗送
			
			/*
			 * 3. 发
			 */
			Transport.send(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
