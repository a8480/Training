package com.icss.core;

import com.icss.web.LoginServlet;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

public class ServletConfig {
    private  static Map<String,Object> map=new HashMap<>();
    static {
        init();
    }
    //初始化功能的方法
    private static void init() {
        try {
            String path = LoginServlet.class.getResource("/").getPath();
            File file = new File(path);
            test(file);
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void test(File file) {

    }

    private static void  initServletConfig(){
       String path =ServletConfig.class.getResource("/").getPath();
       File file = new File(path);
       File[] files = file.listFiles();
    }
}
