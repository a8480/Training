package com.icss.http;

import java.io.IOException;
import java.io.InputStream;

public class HttpRequest {
    private String method;
    private  String url;
    private  String protocol;

    public HttpRequest(InputStream inputStream) {
        parseRquestLine(inputStream);
    }
    public void parseRquestLine(InputStream in){
        StringBuffer stringBuffer=new StringBuffer();
        int delimiter=0;
        char a=0,b=0;
        while (true){
            b=(char)delimiter;
            try {
                if (!((delimiter=in.read())!=-1)) break;
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            if (a==13&&b==10){
                break;
            }
            stringBuffer.append(b);
            a=b;
        }
        System.out.println(stringBuffer.toString().trim());
        String[] data =stringBuffer.toString().trim().split(" ");
        this.method=data[0];
        this.url=data[1];
        this.protocol=data[2];
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
