package javaCodes;

import org.junit.*;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;


public class eBook implements book{

    @Test
    public void test(){
        try {
            System.out.printf("test");
        }catch (Exception e){}
    }



    BufferedImage image;

    public eBook(int width,int height){
        File imageFile = new File(imagesDirectory+"eBookImages/"+"image.jpg"); //TODO movaghat
        image = readFromFile(width,height,image,imageFile);

        //TODO testing
        File outPut = new File("D:/out.jpg");


    }

    private BufferedImage readFromFile(int width,int height,BufferedImage image,File imageFile) {
        try{
            image = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
            image = ImageIO.read(imageFile);
        }catch (Exception e){}
        return image;
    }



}
