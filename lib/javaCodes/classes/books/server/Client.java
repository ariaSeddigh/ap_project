package javaCodes.classes.books.server;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.Socket;

public class Client  {
    public static void main(String[] args) throws Exception {
        Socket socket = new Socket("127.0.0.1",8000);
        //new ClientHandler(socket).start();
        System.out.println("ok");
        DataOutputStream dos = new DataOutputStream(socket.getOutputStream());
        DataInputStream dis = new DataInputStream(socket.getInputStream());
        dos.writeBytes("signup\n123\n142\u0000");
        dos.flush();

        dos.close();
        dis.close();
        socket.close();
    }
}
