package Model;

public class Fish implements IEntity {
    String name;
    double age;

    public Fish(String name, double age){
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
        return "Fish named " + this.name+" is "+this.age+" years old";
    }
}
