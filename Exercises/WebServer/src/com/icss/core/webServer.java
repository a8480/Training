package com.icss.core;

import java.io.IOException;
import java.io.InputStream;
import java.net.ServerSocket;
import java.net.Socket;

/**
 * 服务端
 **/
public class webServer {
    private final ServerSocket serverSocket;

    public webServer() {
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
                InputStream inputStream = socket.getInputStream();
                StringBuffer stringBuffer = new StringBuffer();
                int d = 0;
                char a = 0, b = 0;
                while ((d = inputStream.read()) != -1) {
                    b = (char) d;
                    if (a == 13 && b == 10) {
                        break;
                    }
                    stringBuffer.append(b);
                    a = b;
                }
                System.out.println(stringBuffer.toString().trim());
                String[] data = stringBuffer.toString().split(" ");
                inputStream.close();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public static void main(String[] args) {
        new webServer().start();
    }
}
