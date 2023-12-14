package demo1201.com.icss.core;

import java.io.IOException;
import java.io.InputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class WebServer {
    private ServerSocket serverSocket;

    public WebServer() {
        try {
            this.serverSocket = new ServerSocket(8080);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void start() {
        try {
            System.out.println("等待客户端请求。。。。。。");
            Socket socket = serverSocket.accept();
            System.out.println("接收客户端的一个请求。");
            //给客户端分配线程
            new Thread(new ClientThread(socket)).start();

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private class ClientThread implements Runnable {
        private Socket socket;
        public ClientThread(Socket socket) {
            this.socket=socket;
        }

        @Override
        public void run() {
            try {
                InputStream inputStream=socket.getInputStream();

            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
