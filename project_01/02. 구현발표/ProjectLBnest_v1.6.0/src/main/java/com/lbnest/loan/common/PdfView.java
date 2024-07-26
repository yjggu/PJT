package com.lbnest.loan.common;

import java.io.FileInputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Document;
import com.lowagie.text.pdf.*;
import com.lowagie.text.Element;

public class PdfView extends AbstractPdfView {

    private String fileName;

    public PdfView(String fileName) {
        this.fileName = fileName;
    }
	@Override
	protected void buildPdfDocument(Map<String, Object> model, 
									Document document, PdfWriter writer,
									HttpServletRequest request, 
									HttpServletResponse response) throws Exception {

		/*
		 * Chapter chapter = new Chapter(new Paragraph("Spring Message"),1);
		 * chapter.add(new Paragraph((String)model.get("message")));
		 * 
		 * document.add(chapter);
		 */
	    String filePath = "C:/1kosmosc/sts/work-space/ProjectLBnest_v2/src/main/webapp/resources/files/" + fileName;
//	    PdfReader reader = new PdfReader(new FileInputStream(filePath));
//        PdfStamper stamper = new PdfStamper(reader, response.getOutputStream());
//
//        // ���댁� ��留��� 諛�蹂듯��硫댁�� PDF ���댁�瑜� 異�媛�
//        for (int i = 1; i <= reader.getNumberOfPages(); i++) {
//            stamper.insertPage(i, reader.getPageSizeWithRotation(i));
//            stamper.getOverContent(i).addTemplate(writer.getImportedPage(reader, i), 0, 0);
//        }
//        stamper.close();
//        reader.close();
//    }
        PdfReader reader = null;
        PdfStamper stamper = null;
        try {
            reader = new PdfReader(new FileInputStream(filePath));
            stamper = new PdfStamper(reader, response.getOutputStream());

            // Manipulate the PDF if necessary
            // Example: adding a watermark
            PdfContentByte content = stamper.getOverContent(1);
            content.beginText();
            content.setFontAndSize(BaseFont.createFont(), 50);
//            content.showTextAligned(Element.ALIGN_CENTER,"LBnest", 300, 400, 45,false);
            content.endText();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources in finally block to ensure they are always closed
            if (stamper != null) {
                try {
                    stamper.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (reader != null) {
                try {
                    reader.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}