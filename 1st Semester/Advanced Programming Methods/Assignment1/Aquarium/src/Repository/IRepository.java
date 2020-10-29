package Repository;
import Model.*;
import Exceptions.*;

public interface IRepository {
    public void addElement(IEntity elementToAdd) throws CustomException;
    public void deleteElement(IEntity element) throws CustomException;
    public IEntity[] getElements();
    public IEntity getElementFromPosition(int position) throws CustomException;
    public void updateElement(int position, IEntity newElement) throws CustomException;
}
