public class Z extends X {
    Y y = new Y();
    Z() {System.out.println("Z | 3");}
    public static void main(String[] args) {
        new Z();
    }
}
