package com.icss.core;

import com.icss.http.HttpRequest;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.concurrent.*;

/**
 * @author a8480
 */
public class WebServer {
    private final ServerSocket serverSocket;
    private  final ThreadPoolExecutor threadPool;
    public WebServer() {
        try {
            this.serverSocket=new ServerSocket(8080);
            // 创建一个固定大小的线程池
            this.threadPool = new ThreadPoolExecutor(3,
                    10,10,
                    TimeUnit.SECONDS, new ArrayBlockingQueue<>(3),
                    new ThreadPoolExecutor.AbortPolicy()) ;
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    public  void  start(){
        while (true){
            try {
                System.out.println("等待客户端连接...");
                Socket socket = serverSocket.accept();
                System.out.println("客户端已连接");
                //给客户端分配线程
                // 使用线程池运行ClientThread
                threadPool.execute(new ClientThread(socket));
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
    private class ClientThread implements Runnable{
        private final Socket socket;

        public ClientThread(Socket socket) {
            this.socket=socket;
        }

        @Override
        public void run() {
            try {
                InputStream inputStream=socket.getInputStream();
                HttpRequest httpRequest=new HttpRequest(inputStream);
                System.out.println("请求方法："+httpRequest.getMethod());
                System.out.println("请求地址："+httpRequest.getUrl());
                System.out.println("请求协议："+httpRequest.getProtocol());
                //响应画面客户端
                OutputStream outputStream=socket.getOutputStream();
                outputStream.write("HTTP/1.1 200 OK\r\n".getBytes());
                outputStream.write("Content-Type:text/html;charset=utf-8\r\n".getBytes());
                File file=new File("Exercises/WebServer/webapps"+httpRequest.getUrl());
                outputStream.write(("Content-Length:"+file.length()+"\r\n").getBytes());
                //空行
                outputStream.write("\r\n".getBytes());
                //响应文件
                if (file.exists()){
                    byte[] bytes=new byte[(int)file.length()];
                    FileInputStream fileInputStream=new FileInputStream(file);
                    fileInputStream.read(bytes);
                    //写到客户端
                    outputStream.write(bytes);
                }else {
                    System.out.println("文件不存在");
                }
                inputStream.close();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public static void main(String[] args) {
        new WebServer().start();
    }
}
