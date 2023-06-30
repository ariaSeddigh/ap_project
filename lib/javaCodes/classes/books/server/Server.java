package javaCodes.classes.books.server;

import java.net.ServerSocket;
import java.net.Socket;

public class Server {

    public void start() throws Exception {

            ServerSocket serverSocket = new ServerSocket(8000);
            while(true){
                Socket socket = serverSocket.accept();
                new ClientHandler(socket).start();
            }
        }
    }
