import java.io.*;
import java.net.*;

public class ClientUDP {
    public static void main(String[] args) throws IOException {
        InetAddress addr = InetAddress.getLocalHost();
        System.out.println( "adresse=" +addr.getHostName() );
        String s = "Hello World";
        byte[] data = s.getBytes();
        DatagramPacket packet = new DatagramPacket( data, data.length, addr, 1234 );
        DatagramSocket sock = new DatagramSocket();
        sock.send(packet);

        // Q2.3 : attente de la réponse et affichage
        DatagramPacket resp = new DatagramPacket(new byte[1024], 1024);
        sock.receive(resp);
        System.out.println( "Reçu : " + new String(resp.getData(), 0, resp.getLength()) );

        sock.close();
    }
}
