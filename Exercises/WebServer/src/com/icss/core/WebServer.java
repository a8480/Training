package com.icss.core;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
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
               int d=0;
               while ((d=inputStream.read())!=-1){
                   System.out.print((char)d);
               }
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public static void main(String[] args) {
        new WebServer().start();
    }
}
