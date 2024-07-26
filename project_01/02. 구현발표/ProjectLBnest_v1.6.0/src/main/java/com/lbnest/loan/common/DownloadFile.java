package com.lbnest.loan.common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

public class DownloadFile extends AbstractView{

    private String fileName;

    public DownloadFile(String fileName) {
        this.fileName = fileName;
    }

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("applicaton/octet-stream");
		response.addHeader("Content-Disposition", "attachment;fileName=\""+ fileName +"\"");
		//String path = request.getSession().getServletContext().getRealPath("/WEB-INF/files/AOP.txt");
	    //String path = "C:/Users/cassi/OneDrive/바탕 화면?핵심역량프로젝트/구현/pdf/download/" + fileName;
		String path = "C:/1kosmosc/sts/work-space/Test_LBnest03/src/main/webapp/resources/files/" + fileName;
//		//이제 읽어낸다 (서버가 읽어낸다)		
//		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(path));//서버가 path에 있는 것을 읽어내고	
//		//읽어낸 것을 내보낸다.
//		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream()); 
//		//내보내는 위치		
//		int data;				
//		while((data=bis.read())!=-1) {						
//			bos.write(data);
//			}
//		bis.close();
//		bos.close();
//		
//	}
    try (BufferedInputStream bis = new BufferedInputStream(new FileInputStream(path));
            BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream())) {

           int data;
           while ((data = bis.read()) != -1) {
               bos.write(data);
           }
       } catch (Exception e) {
           e.printStackTrace();
       }
   }
	

}
