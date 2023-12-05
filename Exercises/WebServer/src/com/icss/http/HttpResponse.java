package com.icss.http;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

/**
 * 2）定义变量：
 * 		OutputStream out;
 * 		File entity;
 * 		定义setEntity（）和getEntity()方法。
 * 	3）定义构造方法：HttpResponse(OutputStream out)
 * 		功能：初始化out成员变量
 * 	4）定义方法: println(String line) :void
 * 		public void println(String line){
 * 			out.write(line.getBytes("ISO8859-1"));
 * 			out.write(13);
 * 			out.write(10);
 *                }
 */
public class HttpResponse {
    private OutputStream out;
    private File entity;
    public HttpResponse(OutputStream out){
        this.out = out;
    }

    public File getEntity() {
        return entity;
    }

    public void setEntity(File entity) {
        this.entity = entity;
    }
    //工具方法
    public void println(String line) throws Exception {
  			out.write(line.getBytes());
 			out.write(13);
 			out.write(10);
    }
    //响应行
    public void setStatusLine() throws Exception {
        this.println("HTTP/1.1 200 OK");
    }
    //相应头信息
    public void sendHeaders() throws Exception {
        this.println("Content-Type:text/html");
        this.println("Content-Length:"+entity.length());
        this.println("");
    }
    //响应到客户端的文件
    public void sendContent() throws Exception {
        byte[] buffer = new byte[(int)entity.length()];
        FileInputStream fileInputStream = new FileInputStream(entity);
        fileInputStream.read(buffer);
        //写数据到客户端
        out.write(buffer);

    }
    public void flush(){
        try {
            this.setStatusLine();
            this.sendHeaders();
            this.sendContent();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void sendRedirect(String fileName){

        File file = new File("webapps"+fileName);
        this.setEntity(file);
        this.flush();
    }

    public OutputStream getOut() {
        return out;
    }
}
