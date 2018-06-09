package util.qrcode;

public class QREncoderTestor {

    public static void main(String[] args) {
        String content = "http://www.baidu.com";
        String path = "d:";
        String qrcode = "AHSTU.jpg";
        QRTool.url2qrcode(content, path,qrcode);
    }


}