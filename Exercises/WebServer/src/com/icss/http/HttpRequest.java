package com.icss.http;

import java.io.IOException;
import java.io.InputStream;

/**
 * @author a8480
 */
public class HttpRequest {
    private  String method;
    private  String url;
    private  String protocol;

    public HttpRequest(InputStream inputStream) {
        parseRequestLine(inputStream);
    }

    private void parseRequestLine(InputStream inputStream) {
         int d;
               char a=0,b;
               StringBuffer stringBuffer=new StringBuffer();
               while (true){
                   try {
                       if (!((d=inputStream.read())!=-1)) break;
                   } catch (IOException e) {
                       throw new RuntimeException(e);
                   }
                   System.out.print((char)d);
                   b=(char)d;
                   if (a=='\r'&&b=='\n'){
                       break;
                   }
                   stringBuffer.append(b);
                   a=b;
               }
                System.out.println("请求行："+stringBuffer.toString().trim());
               String[] data=stringBuffer.toString().split(" ");
                this.protocol=data[2];
                this.method=data[0];
                this.url=data[1];
    }

    public String getMethod() {
        return method;
    }

    public String getUrl() {
        return url;
    }

    public String getProtocol() {
        return protocol;
    }
}
