package demo1201.com.icss.Http;


import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

/**
 * @author a8480
 */
public class HttpRequest {
    private String method;
    private String url;
    private String protocal;
    private String requestLine;
    private Map<String, String> map = new HashMap<>();
    private Map<String, String> headers = new HashMap<>();

    public HttpRequest(InputStream in) {
        //第一行的解析
        parseRquestLine(in);
        //请求头的解析
        parseHeaders(in);
        //请求体的解析
        parseContent(in);
    }

    private void parseContent(InputStream in) {
        String contentType = headers.get("Content-Type");
        if (contentType != null & "application/x-www-form-urlencoded".equals(contentType)) {
            String
        }
    }


    /**
     * 解析请求头信息
     *
     * @param in 字符输入流
     */
    private void parseHeaders(InputStream in) {
        while (true) {
            int d = 0;
            char a = 0, b = 0;
            StringBuffer stringBuffer = new StringBuffer();
            while (true) {
                try {
                    while ((d = in.read()) != -1) {
                        b = (char) d;
                        if (a == '\r' && b == '\n') {
                            break;
                        }
                        stringBuffer.append(b);
                        a = b;
                        System.out.println("请求头信息" + stringBuffer.toString().trim());
                        if (stringBuffer.toString().trim().isEmpty()) {
                            break;
                        }
                        String str = stringBuffer.toString().trim();
                        String[] data = str.split(":");
                        String key = data[0].trim();
                        String value = data[1].trim();
                        headers.put(key, value);
                        System.out.println("请求头信息" + headers);
                    }
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
        }
    }

    private void parseRquestLine(InputStream in) {
        int d = 0;
        char a = 0, b = 0;
        StringBuffer stringBuffer = new StringBuffer();
//获取请求行
        while (true) {
            try {
                if ((d = in.read()) != -1) {
                    b = (char) d;
                    if (a == '\r' && b == '\n') {
                        break;
                    }
                    stringBuffer.append(a);
                    a = b;
                }
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        System.out.println("第一行" + stringBuffer.toString().trim());
        String[] data = stringBuffer.toString().trim().split(" ");
        if (data.length == 3) {
            this.method = data[0];
            this.url = data[1];
            this.parseUri();
            this.protocal = data[2];
        }
    }

    /**
     * <a href="http://localhost:8080/myweb/index.html?name=Tom&age=18">...</a>
     */
    private void parseUri() {
        int index = this.url.indexOf("?");
        if (index == -1) {
            this.requestLine = this.url;
        } else {
            // /myweb/index.html
            this.requestLine = this.url.substring(0, index);
            //name=Tom&age=18
            String queryStr = this.url.substring(index + 1);
            String[] data = queryStr.split("&");
            for (String str : data) {
                //解码器
                str = URLDecoder.decode(str, StandardCharsets.UTF_8);
                //{"name","pwd"}
                String[] arr = str.split("=");
                if (data[1] == null) {
                    data[1] = "";
                }
                map.put(data[0], data[1]);
            }
        }
    }

    public String getMethod() {
        return method;
    }

    public String getUrl() {
        return url;
    }

    public String getProtocal() {
        return protocal;
    }
}
