package info.service;

import java.io.*;
import java.net.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.util.*;
import org.springframework.web.servlet.view.*;

@Component
public class InfoFileDown extends AbstractView {
	@Autowired
	SqlSessionFactory fac;
	@Autowired
	ServletContext application;

	@Override
	protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
		SqlSession ss = fac.openSession();
		HashMap map2 = ss.selectOne("info.infoOne2", map.get("uuid").toString());
		String fileName = map2.get("fileName").toString();

		String browser = req.getHeader("User-Agent"); // 파일 인코딩
		if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
			fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
		} else {
			fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
		}

		resp.setHeader("Content-Disposition", "attachment; fileName=\"" + fileName + "\"");
		resp.setHeader("Content-Transfer-Encoding", "binary");	

		File f = new File(application.getRealPath("/file/info"), map.get("uuid").toString());
//		File temp = change(f, map.get("uuid").toString()+"_", application);
		FileInputStream fis = new FileInputStream(f);
		FileCopyUtils.copy(fis, resp.getOutputStream());
//		temp.delete();
		ss.close();
	}

	private File change(File f, String uuid2, ServletContext application) throws Exception {
		File temp = new File(application.getRealPath("/file/info"), uuid2);
		FileInputStream fis = new FileInputStream(f);
		FileOutputStream fos = new FileOutputStream(temp);
		while (true) {
			int n = fis.read();
			if (n < 0) {
				break;
			}
			fos.write(n);
		}
		return temp;
	}
}
