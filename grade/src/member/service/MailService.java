package member.service;

import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

@Component
public class MailService extends Authenticator {
	class MyAuthentication extends Authenticator {
		PasswordAuthentication pa;

		public MyAuthentication() {
			pa = new PasswordAuthentication("no-reply@mygrade.co.kr", "grade2016@"); //ex) ID:cafe24@cafe24.com PASSWD:1234
//			pa = new PasswordAuthentication("admin@gogosky.co.kr", "mrrgo2016@"); //ex) ID:cafe24@cafe24.com PASSWD:1234
		}

		public PasswordAuthentication getPasswordAuthentication() {
			return pa;
		}
	}
	
	public int mailSend(String id, String name, String email, String uuid){
		String host = "smtp.cafe24.com"; //smtp mail server      
		String from = email; //sender email address
		
		Properties props = new Properties();
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		
		Authenticator auth = new MyAuthentication();
		Session sess = Session.getInstance(props, auth);
		
		try {
			Message msg = new MimeMessage(sess);
			msg.setFrom(new InternetAddress(from));
//			InternetAddress[] address = { new InternetAddress("contact@bt2.co.kr") };
			InternetAddress[] address = { new InternetAddress(email) };
			msg.setRecipients(Message.RecipientType.TO, address);
			msg.setSubject("�͸�� �ӽ� ��й�ȣ �ȳ������Դϴ�.");
			msg.setSentDate(new Date());
			String text = "<img src='http://mygrade.co.kr/img/logo.png'/>\n\n";
			text += id+"("+name+")���� �ӽ� ��й�ȣ��\n";
			text += "<span style='font-size: 18px; font-weight: bold; '>"+uuid+"</span>\n";
			text += "�Դϴ�.\n";
			text += "(�ӽ� ��й�ȣ�� �α��� �� �� ��й�ȣ�� �������ּ���!)\n\n";
			text += "<a href='http://mygrade.co.kr/member/login'>�α��� �Ϸ�����</a>";
			msg.setText(text);
			
			Transport.send(msg);
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		}
	}
}
