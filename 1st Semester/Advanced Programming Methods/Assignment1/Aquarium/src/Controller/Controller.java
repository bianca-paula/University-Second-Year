package Controller;
import Exceptions.CustomException;
import Model.IEntity;
import Repository.*;

public class Controller {
    IRepository repository;
    public Controller(IRepository repository){
        this.repository=repository;
    }

    public void addElement(IEntity element) throws CustomException{
        this.repository.addElement(element);
    }

    public void deleteElement(IEntity element) throws CustomException{
        this.repository.deleteElement(element);
    }


    public IEntity[] getAllElements()
    {
        return repository.getElements();
    }

    public String[] filterItems(double minimumAge) {
        String[] s = new String[this.repository.getElements().length];
        int size = 0;
        for (IEntity item : this.repository.getElements()) {
            if (item == null)
                break;
            if (item.getAge() >= minimumAge)
                s[size++] = item.toString();
        }
        String[] newArray = new String[size];
        System.arraycopy(s, 0, newArray, 0, size);
        return newArray;
    }

}
