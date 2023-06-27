package javaCodes.classes.books.server;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.net.Socket;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.security.spec.ECField;
import java.text.Format;
import java.util.Formatter;
import java.util.Scanner;

public class Controller {

    private static String usersFolderPath = "lib\\dataBase\\users\\";
    public static void handle(String request) {
        Scanner sc = new Scanner(request);
        String command = sc.nextLine();
        System.out.println("handling req: " + request);

        switch (command) {
            case "signup":
                System.out.println((sign_up(request)));
                break;
            case "login":
                System.out.println((log_in(request)));
                break;
            case "buyBook":
                System.out.println((buyBook(request)));
                break;
            case "likeBook":
                System.out.println((likeBook(request)));
                break;
            case "logOut":
                System.out.println((log_out(request)));
                break;
        }
    }

    private static String log_out(String request) {
        try {
            File directory = new File("lib\\dataBase\\currentUser");
            File[] files = directory.listFiles();

            for (File file : files) {
                    file.delete();
            }
        }catch (Exception e){
            return "error while logging out";
        }
        return "logged out";
    }

    private static String log_in(String request) {
        Scanner sc = new Scanner(request);
        sc.nextLine();
        String userName = sc.nextLine();
        String password = sc.nextLine();

        File file = new File(usersFolderPath + userName + "\\loginInfo.txt");

        if (!file.exists()) {
            return "username does not exist!";}

        try {
            RandomAccessFile randomAccessFile = new RandomAccessFile(file,"rw");
            randomAccessFile.readLine();
            randomAccessFile.readLine();

            if(!password.equals(randomAccessFile.readLine())){
                return "wrong password";
            }
        }catch (Exception e){}
        String sourceDirectoryPath = usersFolderPath + userName;
        String destinationDirectoryPath = "lib\\dataBase\\currentUser";


        File sourceDirectory = new File(sourceDirectoryPath);
        File destinationDirectory = new File(destinationDirectoryPath);

        File[] files = sourceDirectory.listFiles();

        for (File subFile : files) {
            try {
                Files.copy(subFile.toPath(), new File(destinationDirectory, subFile.getName()).toPath(),
                        StandardCopyOption.REPLACE_EXISTING);
            } catch (IOException e) {
                System.out.println("Failed to copy the file: " + subFile.getName() + " - " + e.getMessage());
            }
        }

        return "successfully logged in!";
    }

    public static String sign_up(String request) {
        Scanner sc = new Scanner(request);
        sc.nextLine();
        String userName = sc.nextLine();
        try {/*
            Socket socket = new Socket("127.0.0.1", 8000);
            DataOutputStream dos = new DataOutputStream(socket.getOutputStream());
            DataInputStream dis = new DataInputStream(socket.getInputStream());*/

            String email = sc.nextLine();
            String password = sc.nextLine();
            File directory = new File(usersFolderPath+userName);

            if (!directory.exists()) {
                if (directory.mkdir()) {
                    System.out.println("new user created successfully.");
                } else {
                    return "Failed to create the user.";
                }
            } else {
                return"user already exists.";
            }


            FileWriter fileWriter = new FileWriter(directory + "\\"+ "loginInfo.txt", true);
            fileWriter.write(userName + "\n");
            fileWriter.flush();
            fileWriter.write(email + "\n");
            fileWriter.flush();
            fileWriter.write(password + "\n");
            fileWriter.flush();

            fileWriter = new FileWriter(directory + "\\"+ "bookList.txt");
            fileWriter = new FileWriter(directory + "\\"+ "likedList.txt");
            fileWriter.close();
        } catch (Exception e) {
            e.printStackTrace();
        }


        return "new user successfully signed up!";
    }

    public static String buyBook(String request) {
        Scanner sc = new Scanner(request);
        String userName = sc.nextLine();
        String bookName = sc.nextLine();

        File directory = new File(usersFolderPath+userName);
        try {
            FileWriter fileWriter = new FileWriter(directory + "\\"+ "bookList.txt", true);

        }catch (Exception e){}
        return "book added to user's list";
    }
    public static String likeBook(String request) {
        Scanner sc = new Scanner(request);
        String userName = sc.nextLine();
        String bookName = sc.nextLine();

        File directory = new File(usersFolderPath+userName);
        try {
            FileWriter fileWriter = new FileWriter(directory + "\\"+ "likedList.txt", true);

        }catch (Exception e){}
        return "book added to user's liked list";
    }
    public static String unLikeBook(String request) {
        Scanner sc = new Scanner(request);
        String userName = sc.nextLine();
        String bookName = sc.nextLine();

        File directory = new File(usersFolderPath+userName);
        try {
//            FileWriter fileWriter = new FileWriter(directory + "\\"+ "likedList.txt", true);
            RandomAccessFile randomAccessFile = new RandomAccessFile(directory + "\\"+ "likedList.txt","rw");
            String newList = "";
            String line = "" ;
            while ((line = randomAccessFile.readLine()) != null){
                if (line!=bookName)
                    newList +=line;

            }
            randomAccessFile.writeBytes(newList);

        }catch (Exception e){}
        return "book added to user's liked list";
    }
}
