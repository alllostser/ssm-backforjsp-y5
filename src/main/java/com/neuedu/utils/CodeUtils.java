package com.neuedu.utils;


import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

/**
 * 生成验证码
 */
public class CodeUtils {
    //    定义字符库
    private static final String STRS = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM123456789";
    private static final int STR_LENGTH = 4;   //    验证码长度
    private static final int HEIGHT = 40; //画布高度
    private static final int WIDTH = 70;   //    画布宽度
    private static final int FONT_SIZE = 20; // 设置初始字体大小
    private static final int LINE_SIZE = 50;//定义干扰线字体大小
    private static final int HEIGHT_FONT = 30;//字体纵坐标
    private static final int WIDTH_FONT = 10;//字体宽度
    private static final int FONT_SPEACE = 5; //字体间隙
    public static String getStrs(){
        /*定义字符数组*/
        char[] chars = new char[STR_LENGTH];
        Random random = new Random();
        for (int i = 0; i <STR_LENGTH ; i++) {
             chars[i] = STRS.charAt(random.nextInt(STRS.length()));//随机取字符存入字符数组
        }
        String str = new String(chars); //将字符数组转化为字符串
        return str;
    }
    public static BufferedImage getImg(String str){
        BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_3BYTE_BGR);
        Graphics g = image.getGraphics(); //获取画笔
        g.setColor(Color.black);
        g.fillRect(0, 0, WIDTH, HEIGHT);
        g.setColor(Color.red);
        Random random = new Random();
        for (int i = 0; i <str.length() ; i++) {
            g.setColor(new Color(random.nextInt(255),random.nextInt(255),random.nextInt(255)));
            g.setFont(new Font("楷体", 1,LINE_SIZE ));
            g.drawLine(0,random.nextInt(HEIGHT+10),WIDTH,random.nextInt(HEIGHT+10));
            g.setColor(new Color(random.nextInt(255),random.nextInt(255),random.nextInt(255)));
            g.setFont(new Font("微软雅黑", Font.BOLD, FONT_SIZE+random.nextInt(20)));
            g.drawString(String.valueOf(str.charAt(i)),(WIDTH_FONT+FONT_SPEACE)*i,HEIGHT_FONT);

        }
        return image;
    }

    public static void main(String[] args) {
        for (int i = 0; i <1000 ; i++) {
            System.out.print(getStrs());
            System.out.println(" -- "+i);
        }

    }
}
