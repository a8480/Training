package com.icss.core;

import com.icss.http.HttpRequest;
import com.icss.http.HttpResponse;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;

/**
 * 服务端
 *
 * @author a8480*/
public class WebServer {
    private final ServerSocket serverSocket;

    public WebServer() {
        try {
            this.serverSocket = new ServerSocket(8080);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void start() {
        while (true) {
            try {
                System.out.println("等待客户端连接");
                Socket socket = serverSocket.accept();
                System.out.println("客户端连接成功");
                new Thread(new ClientThread(socket)).start();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public class ClientThread implements Runnable {
        private final Socket socket;

        public ClientThread(Socket socket) {
            this.socket = socket;
        }

        @Override
        public void run() {
            try {
                //获取一个输入流，可以用于读取客户端发送的数据。
                InputStream inputStream = null;
                try {
                    inputStream = socket.getInputStream();
                    HttpRequest httpRequest = new HttpRequest(inputStream);
                    System.out.println(httpRequest.getMethod());
                    System.out.println(httpRequest.getUrl());
                    System.out.println(httpRequest.getProtocol());
                    OutputStream outputStream = socket.getOutputStream();
                    HttpResponse httpResponse = new HttpResponse(outputStream);
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            } catch (RuntimeException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public static void main(String[] args) {
        new WebServer().start();
    }
}
