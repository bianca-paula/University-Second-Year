package View;
import Controller.*;
import Exceptions.CustomException;
import Repository.*;
import Model.*;
import java.util.Scanner;

public class ApplicationView {
    public static void main(String[] args){
        IRepository repository = new Repository(15);
        Controller controller = new Controller(repository);
        Scanner scanner = new Scanner(System.in);

        String OptionsMenu = """
       
                Choose an option:
                0.  Exit
                1.  Display all the animals
                2.  Display all the animals which are older than 1 year
                Enter: """;


        Fish f1 = new Fish ("Nemo", 1);
        Fish f2 = new Fish ("Bubbles", 4);
        Fish f3 = new Fish ("Dory", 0.2);
        Fish f4 = new Fish ("Goldie", 0.1);
        Fish f5 = new Fish ("Zippy", 7);
        Turtle t1 = new Turtle("Timi", 2);
        Turtle t2 = new Turtle("Donatello",100);
        Turtle t3 = new Turtle("Shelly", 0.7);
        Turtle t4 = new Turtle("Tammy", 0.3);
        Turtle t5 = new Turtle("Ivy", 2);
        try{
            controller.addElement(t1);
            controller.addElement(f1);
            controller.addElement(t2);
            controller.addElement(f2);
            controller.addElement(t3);
            controller.addElement(f3);
            controller.addElement(t4);
            controller.addElement(f4);
            controller.addElement(t5);
            controller.addElement(f5);

        } catch (CustomException exception){
            System.out.println(exception);
        }

        while (true)
        {
            try{
                System.out.println(OptionsMenu);
                int inputCommand = scanner.nextInt();

                if(inputCommand == 0)
                    break;

                else if (inputCommand == 1){
                    IEntity[] array = controller.getAllElements();
                    for (IEntity el : array) {
                        if (el != null)
                            System.out.println(el);
                    }
                }

                else if (inputCommand == 2) {
                    String[] array = controller.filterItems(1);
                    for (String el : array)
                        System.out.println(el);
                    }

                else{
                    throw new Exception("Invalid command! \n");
                }


                }
            catch (Exception exception)
            {
                System.out.println(exception.getMessage());
            }
        }
    }
}

