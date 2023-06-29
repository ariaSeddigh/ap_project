package javaCodes.classes.books;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

public class eBook implements book {
    static String eBooksPath = "lib/dataBase/books/eBooks/";

    public static void addNewBook() {
        String bookName = "test3";
        int price = 10;
        String description = "this is the book's description!";
        String author = "author";
        //pdf file
        String sourcePDF = "lib/dataBase/tempFiles/samplePDF.pdf";
        Path _sourcePDFPath = Path.of(sourcePDF);
        Path destinationPDFPath = Path.of(eBooksPath + bookName+"/"+bookName+".pdf");

        //cover photo file
        String sourceCoverPhoto = "lib/dataBase/tempFiles/sampleCoverPhoto.jpg";
        Path _sourceCoverPhotoPath = Path.of(sourceCoverPhoto);
        Path destinationCoverPhotoPath = Path.of(eBooksPath + bookName+"/"+bookName+".jpg");


        //creates a new folder for new book
        File bookFolder = new File(eBooksPath + bookName);
        boolean folderCreated = bookFolder.mkdir();

        System.out.println(folderCreated ? "folder as been created!" : "failed to create new folder!!!(already exists)");

        //creates a new TEXT file to storage book information (name,price,description and ...)
        try {
            FileWriter fileWriter = new FileWriter(eBooksPath + bookName + "/bookName.txt");
            fileWriter.write(bookName);
            fileWriter.flush();

            fileWriter = new FileWriter(eBooksPath + bookName + "/author.txt");
            fileWriter.write(author);
            fileWriter.flush();

            fileWriter = new FileWriter(eBooksPath + bookName + "/price.txt");
            fileWriter.write(String.valueOf(price));
            fileWriter.flush();

            fileWriter = new FileWriter(eBooksPath + bookName + "/description.txt");
            fileWriter.write(description);
            fileWriter.flush();

            fileWriter = new FileWriter(eBooksPath + bookName + "/ratings.txt");

            Files.copy(_sourcePDFPath,destinationPDFPath, StandardCopyOption.REPLACE_EXISTING);
            Files.copy(_sourceCoverPhotoPath,destinationCoverPhotoPath, StandardCopyOption.REPLACE_EXISTING);

        } catch (IOException e) {
            System.out.println("failed to add new book! :(");
            System.out.println(e.getStackTrace());
        }


    }

    public static void main(String[] args) {
        eBook.addNewBook();
    }

}
