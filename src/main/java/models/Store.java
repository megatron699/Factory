package models;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "store")
@DiscriminatorValue(value = "Склад")
public class Store extends PlaceOfWork{
    @Column(name = "type_of_stored")
    private String typeOfStored;
    @Column(name = "amount_of_stored")
    private int amountOfStored;

    public String getTypeOfStored() {
        return typeOfStored;
    }

    public void setTypeOfStored(String typeOfStored) {
        this.typeOfStored = typeOfStored;
    }

    public int getAmountOfStored() {
        return amountOfStored;
    }

    public void setAmountOfStored(int amountOfStored) {
        this.amountOfStored = amountOfStored;
    }
}
