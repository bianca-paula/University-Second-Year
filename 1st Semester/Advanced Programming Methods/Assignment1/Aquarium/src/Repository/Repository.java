package Repository;
import Model.*;
import Exceptions.*;
public class Repository implements IRepository{

    IEntity[] entries;
    int size;
    public Repository(int maxCapacity){
        entries = new IEntity[maxCapacity];
        size = 0;
    }

    @Override
    public void addElement(IEntity elementToAdd) throws CustomException {
        if(size == entries.length)
            throw new CustomException("LIMIT OF ARRAY REACHED");
        entries[size++] = elementToAdd;
    }

    @Override
    public void deleteElement(IEntity element) throws CustomException
    {
        boolean element_found=false;
        for(int i=0;i<this.size;i++)
        {
            if(element.getClass()==entries[i].getClass() && element.getAge()==entries[i].getAge()) {
                entries[i] = entries[size - 1];
                entries[size - 1] = null;
                size--;
                element_found = true;
                break;
            }
        }
        if(!element_found)
        {
            throw new CustomException("\n");
        }
    }

    @Override
    public IEntity[] getElements(){
        return entries;
    }

    @Override
    public IEntity getElementFromPosition(int position) throws CustomException {
        if (position < 0 || position >= size)
            throw new CustomException("Index specified out of range");
        return entries[position];
    }

    @Override
    public void updateElement(int position, IEntity newElement)  throws CustomException {
        if (position < 0 || position >= size)
            throw new CustomException("Specified index does not exist");
        entries[position] = newElement;
    }
}
