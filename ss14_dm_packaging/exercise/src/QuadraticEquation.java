import java.util.Scanner;

public class QuadraticEquation {
    private double a;
    private double b;
    private double c;

    public QuadraticEquation(double a, double b, double c) {
        this.a = a;
        this.b = b;
        this.c = c;
    }

    public double getA() {
        return this.a;
    }

    public double getB() {
        return this.b;
    }

    public double getC() {
        return this.c;
    }

    public String display() {
        return "Bạn đã nhập: {" + "a = " + a + ", b = " + b + " c = " + c + "}";
    }
    public double getDiscriminant() {
        return (this.b * this.b) - 4 * this.a * this.c;
    }
    public double getRoot1() {
        double delta = getDiscriminant();
        return (-this.b + Math.sqrt(delta)) / (2 * this.a);
    }

    public double getRoot2() {
        double delta = getDiscriminant();
        return (-this.b - Math.sqrt(delta)) / (2 * this.a);
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhập a: ");
        double a = scanner.nextDouble();
        System.out.println("Nhập b: ");
        double b = scanner.nextDouble();
        System.out.println("Nhập c: ");
        double c = scanner.nextDouble();
        QuadraticEquation quadraticEquation = new QuadraticEquation(a, b, c);
        System.out.println("Tham số bạn nhập: " + quadraticEquation.display());

        if (quadraticEquation.getDiscriminant() > 0) {
            System.out.println("Delta = " + quadraticEquation.getDiscriminant() + " > 0");
            System.out.println("Phương trình có 2 nghiệm: " + "\n" + "x1 = " + quadraticEquation.getRoot1() + "\n" + "x2 = " + quadraticEquation.getRoot2());

        } else if (quadraticEquation.getDiscriminant() == 0) {
            System.out.println("Delta = " + quadraticEquation.getDiscriminant());
            System.out.println("Phương trình có 1 nghiệm kép:" + "\n" + "x1 = x2 = " + quadraticEquation.getRoot1());

        } else if (quadraticEquation.getDiscriminant() < 0) {
            System.out.println("Delta = " + quadraticEquation.getDiscriminant() + " < 0");
            System.out.println("Phương trình vô nghiệm.");
        }
    }
}