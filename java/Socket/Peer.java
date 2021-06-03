import java.io.*;
import java.net.*;
import java.util.Scanner;
//
public class Peer {
	public void respond(int pnumber, String msg) {
		try {
			Socket s = new Socket("localhost",pnumber);
			DataOutputStream dos = new DataOutputStream(s.getOutputStream());
			dos.writeUTF(msg);
			dos.flush();
			dos.close();
			s.close();
		} catch (Exception e){System.out.println("[CLIENT] " + e);}
	}
	public void listen(int pnumber) {
		try {
			FileWriter fw = new FileWriter("open-ports.log", true);
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(pnumber+"\n");
			bw.flush();
			bw.close();
			fw.close();
		} catch (IOException e){System.out.println("[SERVER] " + e);}
		while (true) {
			try {
				ServerSocket port = new ServerSocket(pnumber);
				Socket s = port.accept();
				DataInputStream dis = new DataInputStream(s.getInputStream());
				String str = (String)dis.readUTF();
				System.out.println("message = " + str);
				port.close();
				if (str.equals("exit_game")) {
					removeRoom(pnumber);
					break;
				}
			} catch (Exception e){System.out.println("[SERVER] " + e);}
		}
	}
	public void removeRoom(int port) {
		try {
			File filename = new File("open-ports.log");
			File filetemp = new File("open-ports.log.tmp");
			FileReader fr = new FileReader(filename);
			BufferedReader br = new BufferedReader(fr); String line;
			FileWriter fw = new FileWriter(filetemp);
			BufferedWriter bw = new BufferedWriter(fw);
			while ((line = br.readLine()) != null) {
				if (!line.equals(port+"")) {
					bw.write(line+"\n");
					bw.flush();
				}
			}
			bw.close();
			br.close();
			filename.delete();
			filetemp.renameTo(filename);
		} catch (Exception e){System.out.println("[SERVER] " + e);}
	}
	public void showLobby() {
		try {
			FileReader fr = new FileReader("open-ports.log");
			BufferedReader br = new BufferedReader(fr); String line;
			while ((line = br.readLine()) != null) {System.out.println(line);}
		} catch (IOException e){System.out.println("[SERVER] " + e);}
	}
	public static void main(String[] args) {
		Peer obj = new Peer();
		Scanner read = new Scanner(System.in);
		System.out.print("1. create game\n2. join game\n---\n>> "); char opt = read.next().charAt(0);
		switch(opt) {
			case '1':
				System.out.print("create port : "); int createport = read.nextInt(); System.out.println("---");
				obj.listen(createport);
				break;
			case '2':
				System.out.println("---"); obj.showLobby();
				System.out.println("---");
				System.out.print("join port : "); int joinport = read.nextInt();
				System.out.print("send text : "); String msg = read.next();
				obj.respond(joinport, msg);
				break;
		}
	}
}
