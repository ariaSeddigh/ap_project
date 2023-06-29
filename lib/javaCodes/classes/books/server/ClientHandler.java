package javaCodes.classes.books.server;

import java.io.DataInputStream;
import java.io.DataOutput;
import java.io.DataOutputStream;
import java.net.Socket;
import java.util.Scanner;

public class ClientHandler extends Thread {
    private Socket socket;

    public ClientHandler(Socket socket) {
        this.socket = socket;
    }

    @Override
    public void run() {
        try {
            System.out.println("ClientHandler is running in new thread");
            DataInputStream dis = new DataInputStream(socket.getInputStream());
            DataOutputStream dos = new DataOutputStream(socket.getOutputStream());

            //String request = dis.readUTF();
            StringBuilder request = new StringBuilder("");
            /*byte[] chars = dis.readAllBytes();
            for (byte character :chars){
                request.append((char) character);
            }*/
            int c = dis.read();
            while (c!=0){
                request.append((char)c);
                c = dis.read();
            }

            String response =  Controller.handle(request.toString());
            dos.writeBytes(response);
            dos.flush();
            dos.close();
            dis.close();
            socket.close();
        } catch (Exception e) {
        }
    }
}
