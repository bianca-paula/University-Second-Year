package Model;

public class Turtle implements IEntity {
    String name;
    double age;

    public Turtle(String name, double age){
        this.name = name;
        this.age = age;
    }

    @Override
    public double getAge() {return this.age;}

    public String getName() {return this.name;}

    public void setAge(double age){
        this.age=age;
    }

    public void setName(String name){
        this.name=name;
    }

    @Override
    public String toString(){
        return "Turtle named " + this.name+" is "+this.age+" years old";
    }
}
