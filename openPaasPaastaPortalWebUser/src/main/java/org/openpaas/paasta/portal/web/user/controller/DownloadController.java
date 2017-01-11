package org.openpaas.paasta.portal.web.user.controller;

import org.openpaas.paasta.portal.web.user.common.Common;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

/**
 * 다운로드 컨트롤러 - 다운로드 팝업을 호출한다.
 *
 * @author 조민구
 * @version 1.0
 * @since 2016 -09-06
 */
@Controller
public class DownloadController extends Common {

    /**
     * Download.
     *
     * @param url              the url
     * @param originalFileName the original file name
     * @param response         the response
     * @throws Exception the exception
     */
    @RequestMapping(value = {"/download/url"}, method = RequestMethod.GET)
    public void download(@PathParam("url") String url,
                         @PathParam("originalFileName") String originalFileName,
            HttpServletResponse response) throws Exception {

        // MIME Type 을 application/octet-stream 타입으로 변경
        // 무조건 팝업(다운로드창)이 뜨게 된다.
        response.setContentType("application/octet-stream");

        // 브라우저는 ISO-8859-1을 인식하기 때문에
        // UTF-8 -> ISO-8859-1로 디코딩, 인코딩 한다.
        String fileNameForBrowser = new String(originalFileName.getBytes("UTF-8"), "iso-8859-1");

        // 파일명 지정
        response.setHeader("Content-Disposition", "attachment; filename=\""+fileNameForBrowser+"\"");

        OutputStream os = response.getOutputStream();
        InputStream is = new URL(url).openStream();

        int n = 0;
        byte[] b = new byte[512];
        while((n = is.read(b)) != -1 ) {
            os.write(b, 0, n);
        }
        is.close();
        os.close();
    }

    /**
     * 내부망에 있는 이미지 자원에 접근할수 있도록 컨트롤러를 통해 우회한다.
     *
     * @param imgPath  the img path
     * @param response the response
     * @throws IOException the io exception
     * @author 김도준
     * @since 2017 -01-04
     */
    @RequestMapping(value = {"/download/getImage"}, method = RequestMethod.GET)
    public void getImage(@RequestParam String imgPath, HttpServletResponse response) throws IOException {

        String urlPath = "/file/getImage";

        Map<String, String> body = new HashMap<>();
        body.put("imgPath", imgPath);

        ResponseEntity rssResponse = commonService.procRestTemplate(urlPath, HttpMethod.POST, body, getToken(), byte[].class);

        byte [] imgByte =(byte [])rssResponse.getBody();

        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        //파일 확장자에 따라 컨텐트 타입 변경
        int index = imgPath.lastIndexOf(".");
        String ext ="";
        if (index != -1) {
            ext  = imgPath.substring(index + 1);
        }

        switch (ext) {
            case "png" : response.setContentType("image/png"); break;
            case "svg" : response.setContentType("image/svg+xml"); break;
            default : response.setContentType("image/jpeg");break;
        }

        ServletOutputStream responseOutputStream = response.getOutputStream();
        responseOutputStream.write(imgByte);
        responseOutputStream.flush();
        responseOutputStream.close();
    }
}
