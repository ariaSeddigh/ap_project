package javaCodes.classes.books.server;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.security.spec.ECField;
import java.text.Format;
import java.util.Currency;
import java.util.Formatter;
import java.util.Scanner;

public class Controller {

    private static String usersFolderPath = "lib\\dataBase\\users\\";

    public static String handle(String request) {
        Scanner sc = new Scanner(request);
        String command = sc.nextLine();
        System.out.println("handling req: " + request);

        switch (command) {
            case "signup":
//                System.out.println((sign_up(request)));
                return ((sign_up(request)));
            case "login":
                return log_in(request);
            case "buyBook":
//                System.out.println((buyBook(request)));
                return ((buyBook(request)));
            case "likeBook":
//                System.out.println((likeBook(request)));
                return ((likeBook(request)));
            case "logOut":
//                System.out.println((log_out(request)));
                return ((log_out(request)));
            case "credit":
//                System.out.println((credit(request)));
                return ((credit(request)));
            case "addCredit":
//                System.out.println((credit(request)));
                return ((addCredit(request)));
            case "bookDescription":
//                System.out.println((credit(request)));
                return ((book_description(request)));
            case "bookPrice":
//                System.out.println((credit(request)));
                return ((book_price(request)));
            case "newBooks":
//                System.out.println((credit(request)));
                return ((new_books(request)));
            case "userBooks":
//                System.out.println((credit(request)));
                return ((user_books(request)));
            case "premium":
//                System.out.println((credit(request)));
                return ((premuim(request)));
            case "premiumOff":
//                System.out.println((credit(request)));
                return ((premuimOff(request)));
        }
        return "unknown command";
    }

    private static String premuim(String request) {
        Scanner sc = new Scanner(request);
        sc.nextLine();
        String userName = sc.nextLine();
        try {
            FileWriter fileWriter = new FileWriter("lib\\dataBase\\users\\" + userName + "\\premium.txt");
            fileWriter.write("true");
            fileWriter.flush();
        } catch (Exception e) {

        }
        return "failed";
    }
    private static String premuimOff(String request) {
        Scanner sc = new Scanner(request);
        sc.nextLine();
        String userName = sc.nextLine();
        try {
            FileWriter fileWriter = new FileWriter("lib\\dataBase\\users\\" + userName + "\\premium.txt");
            fileWriter.write("false");
            fileWriter.flush();
        } catch (Exception e) {

        }
        return "failed";
    }

    private static String new_books(String request) {
        File file = new File("lib\\dataBase\\books\\eBooks\\newBooks.txt");
        String newBooks = "";
        try {
            FileReader fileReader = new FileReader(file);
            int c = fileReader.read();
            while (c > 0) {
                newBooks += (char) c;
                c = fileReader.read();
            }
            return newBooks;

        } catch (Exception e) {
            return "failed";
        }
    }

    private static String user_books(String request) {
        Scanner sc = new Scanner(request);
        sc.nextLine();
        String userName = sc.nextLine();
        File file = new File("lib\\dataBase\\users\\" + userName + "\\bookList.txt");
        String books = "";
        try {
            FileReader fileReader = new FileReader(file);
            int c = fileReader.read();
            while (c > 0) {
                books += (char) c;
                c = fileReader.read();
            }
            System.out.println("books:" + books);
            return books;

        } catch (Exception e) {
            return "failed";
        }
    }

    private static String book_price(String request) {
        String price = "";
        Scanner sc = new Scanner(request);
        sc.nextLine();
        String bookName = sc.nextLine();
        File file = new File("C:\\Users\\Lenovo\\AndroidStudioProjects\\approject\\lib\\dataBase\\books\\eBooks\\" + bookName + "\\price.txt");
        try {
            FileReader fileReader = new FileReader(file);
            int c = fileReader.read();
            while (c > 0) {
                price += (char) c;
                c = fileReader.read();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return price;
    }

    private static String book_description(String request) {
        String description = "";
        Scanner sc = new Scanner(request);
        sc.nextLine();
        String bookName = sc.nextLine();
        File file = new File("C:\\Users\\Lenovo\\AndroidStudioProjects\\approject\\lib\\dataBase\\books\\eBooks\\" + bookName + "\\description.txt");
        try {
            FileReader fileReader = new FileReader(file);
            int c = fileReader.read();
            while (c > 0) {
                description += (char) c;
                c = fileReader.read();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return description;
    }

    private static String addCredit(String request) {
        Scanner sc = new Scanner(request);
        sc.nextLine();
        String username = sc.nextLine();
        int amount = Integer.parseInt(sc.nextLine());
        String path = "lib\\dataBase\\users\\" + username + "\\credit.txt";
        try {

            FileReader fileReader = new FileReader(path);
            String currentCredit = "";
            int c = fileReader.read();
            while (c > 0) {
                currentCredit += (char) c;
                c = fileReader.read();
            }
            int intNewCredit = Integer.parseInt(currentCredit) + amount;
            String newCredit = String.valueOf(intNewCredit);
            FileWriter fileWriter = new FileWriter(path);
            fileWriter.write(newCredit);
            fileWriter.flush();
            fileWriter.close();

        } catch (Exception e) {
        }
        return "amount= " + amount + " added";
    }

    private static String credit(String request) {
        Scanner sc = new Scanner(request);
        sc.nextLine();
        String username = sc.nextLine();
        try {
            String credit = "";
            File file = new File(usersFolderPath + username + "\\credit.txt");
//            System.out.println(file.isFile());
            FileReader fileReader = new FileReader(file);
            int c = fileReader.read();
//            System.out.println("1:" + c);
            while (c != -1) {
//                System.out.println("2:" + c);
                credit += (char) c;
                c = fileReader.read();
            }


            //System.out.println("credit proccessing" + credit);
            return credit;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "error";
    }

    private static String log_out(String request) {
        try {
            File directory = new File("lib\\dataBase\\currentUser");
            File[] files = directory.listFiles();

            for (File file : files) {
                file.delete();
            }
        } catch (Exception e) {
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
            return "failed";
        }

        try {
            RandomAccessFile randomAccessFile = new RandomAccessFile(file, "rw");
            randomAccessFile.readLine();
            randomAccessFile.readLine();

            if (!password.equals(randomAccessFile.readLine())) {
                return "failed";
            }
        } catch (Exception e) {
        }
        try {
            /*Socket socket = new Socket("127.0.0.1",8000);
            DataOutputStream dos = new DataOutputStream(socket.getOutputStream());
            dos.writeBytes(userName);
            dos.flush();
            dos.close();*/
            return userName;
        } catch (Exception e) {
            e.printStackTrace();
            return "failed";
        }
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
            File directory = new File(usersFolderPath + userName);

            if (!directory.exists()) {
                if (directory.mkdir()) {
                    System.out.println("new user created successfully.");
                } else {
                    return "Failed to create the user.";
                }
            } else {
                return "user already exists.";
            }


            FileWriter fileWriter = new FileWriter(directory + "\\" + "loginInfo.txt", true);
            fileWriter.write(userName + "\n");
            fileWriter.flush();
            fileWriter.write(email + "\n");
            fileWriter.flush();
            fileWriter.write(password + "\n");
            fileWriter.flush();

            fileWriter = new FileWriter(directory + "\\" + "bookList.txt");
            fileWriter = new FileWriter(directory + "\\" + "likedList.txt");
            fileWriter = new FileWriter(directory + "\\" + "premium.txt");
            fileWriter.write("false");
            fileWriter.flush();
            fileWriter = new FileWriter(directory + "\\" + "credit.txt");
            fileWriter.write("1000");
            fileWriter.flush();
            fileWriter.close();
        } catch (Exception e) {
            e.printStackTrace();
        }


        return "new user successfully signed up!";
    }

    public static String buyBook(String request) {
        Scanner sc = new Scanner(request);
        sc.nextLine();
        String userName = sc.nextLine();
        String bookName = sc.nextLine();
        String price = sc.nextLine();
        //System.out.println("buying:"+userName+bookName+price);
        String userBooks = user_books("userBooks\n" + userName + "\n");

        if (userBooks.contains(bookName)) {
            //System.out.println("works fine");
            return "already have this book!";
        }
        boolean Premium = false;
        try {
            FileReader fileReader = new FileReader("lib\\dataBase\\users\\"+userName+"\\premium.txt");
            String isPremium = "";
            int c = fileReader.read();
            while (c>0){
                isPremium += (char)c;
                c = fileReader.read();
            }
            if (isPremium.contains("ue")){
                Premium = true;
            }
        }catch (Exception e){}
        if (Integer.parseInt(price) > Integer.parseInt(credit("credit\n" + userName)) && !Premium) {
            return "not enough credit!";
        }

        File directory = new File(usersFolderPath + userName + "\\bookList.txt");
        try {
            FileWriter fileWriter = new FileWriter(directory, true);
            fileWriter.write(bookName + "\n");
            fileWriter.flush();
            fileWriter.close();
            if (!Premium){
                addCredit("addCredit\n" + userName + "\n-" + price);
            }
        } catch (Exception e) {
        }
        return "book added to user's list";
    }

    public static String likeBook(String request) {
        Scanner sc = new Scanner(request);
        String userName = sc.nextLine();
        String bookName = sc.nextLine();

        File directory = new File(usersFolderPath + userName);
        try {
            FileWriter fileWriter = new FileWriter(directory + "\\" + "likedList.txt", true);

        } catch (Exception e) {
        }
        return "book added to user's liked list";
    }

    public static String unLikeBook(String request) {
        Scanner sc = new Scanner(request);
        String userName = sc.nextLine();
        String bookName = sc.nextLine();

        File directory = new File(usersFolderPath + userName);
        try {
//            FileWriter fileWriter = new FileWriter(directory + "\\"+ "likedList.txt", true);
            RandomAccessFile randomAccessFile = new RandomAccessFile(directory + "\\" + "likedList.txt", "rw");
            String newList = "";
            String line = "";
            while ((line = randomAccessFile.readLine()) != null) {
                if (line != bookName)
                    newList += line;

            }
            randomAccessFile.writeBytes(newList);

        } catch (Exception e) {
        }
        return "book added to user's liked list";
    }
}
