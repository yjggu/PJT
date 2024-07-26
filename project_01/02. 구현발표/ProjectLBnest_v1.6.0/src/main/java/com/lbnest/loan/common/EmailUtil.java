package com.lbnest.loan.common;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public final class EmailUtil {

    private final static String host = "smtp.gmail.com";     // Gmail SMTP ��踰�紐�
    private final static String user = "lbnest786@gmail.com";   // 諛������� Gmail 怨���
    private final static String password = "logw wjyu nphq krhm"; // 諛������� Gmail 鍮�諛�踰���
    

    
    public static String sendEmail(String to, String tempPwd) throws MessagingException {
        String authenCode = null;

        /* Property 媛�泥댁�� SMTP ��踰� ��蹂� �ㅼ�� */
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "465");        // Gmail SMTP �ы��: 465 (SSL)
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");

        /* SMTP ��踰� ��蹂댁�� �ъ�⑹�� ��蹂대�� 湲곕��쇰� Session �대���ㅼ�� �몄�ㅽ�댁�ㅻ�� ����*/
        Session session = Session.getDefaultInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        /* Message 媛�泥댁�� �������� �댁��, ��紐⑹�� 硫���吏�瑜� ���� */
        try {
            // �몄�踰��� ����
            //authenCode = makeAuthenticationCode();

            Message message = new MimeMessage(session);

            // 諛����� �ㅼ��
            message.setFrom(new InternetAddress(user, "LBnest"));

            // ������ 硫��쇱＜�� �ㅼ��
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // 硫��쇱��紐� �ㅼ��
            message.setSubject("LBnest 임시 비밀번호 메일입니다.");

            // 硫��� �댁�� �ㅼ��
            message.setText("임시 비밀번호는 [ "+tempPwd+ " ] 입니다. 로그인 후 회원정보 수정에서 비밀번호를 변경하시기 바랍니다.");

            // Send the message
            Transport.send(message);

            System.out.println(" GMailSend : Email sent successfully.");
        } catch (MessagingException e) {
            e.printStackTrace();
            throw e; // ���� �ㅼ�� ��吏�湲�
        } catch (Exception e) {
            e.printStackTrace();
            throw new MessagingException("인증번호 생성 중 오류 발생");
        }

        System.out.println(" GMailSend : sendEmail() 종료");
        return authenCode;
    }

    /** �몄�肄��� ���� 硫����� */
    public static String makeAuthenticationCode() {
        int pwdLength = 8;
        final char[] pwdTable = {
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L',
                'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
                'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
                'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
                'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^', '&', '*',
                '(', ')', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' };

        Random ran = new Random(System.currentTimeMillis());

        StringBuffer bf = new StringBuffer();
        for(int i=0; i<pwdLength; i++) {
            bf.append(pwdTable[ran.nextInt(pwdTable.length)]);
        }

        return bf.toString();
    }
}
