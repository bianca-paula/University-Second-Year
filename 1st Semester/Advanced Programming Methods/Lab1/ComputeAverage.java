import java.util.Scanner;

public class ComputeAverage {
    public static void main(String[] args) {
        //Please write a Java program that computes the average of all integer numbers given as command-line parameters
        double averageOfNumbers = 0.0;
        int sum=0;
        Scanner input = new Scanner(System.in);
        System.out.println("Enter the numbers: ");
        String[] tokens = input.nextLine().split(", ");
        int[] readNumbers = new int[tokens.length];
        for (int i = 0; i < tokens.length; i++) {
            readNumbers[i] = Integer.parseInt(tokens[i]);
            sum += readNumbers[i];
        }

        averageOfNumbers = (double)sum / tokens.length;
        System.out.println("The average of the input numbers is: " + String.valueOf(averageOfNumbers));
    }
}
