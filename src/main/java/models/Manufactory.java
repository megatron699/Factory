package models;


import javax.persistence.*;

@Entity
@Table(name = "manufactory")
@DiscriminatorValue(value = "Цех")
public class Manufactory extends PlaceOfWork{
    @Column(name = "amount_currently")
    private int amountCurrently;
    @Column(name = "amount_per_month")
    private int amountPerMonth;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_assignment_of_manufactory", referencedColumnName = "id_assignment_of_manufactory")
    private AssignmentOfManufactory assignmentOfManufactory;

    public Manufactory(){

    }

    public int getAmountCurrently() {
        return amountCurrently;
    }

    public void setAmountCurrently(int amountCurrently) {
        this.amountCurrently = amountCurrently;
    }

    public int getAmountPerMonth() {
        return amountPerMonth;
    }

    public void setAmountPerMonth(int amountPerMonth) {
        this.amountPerMonth = amountPerMonth;
    }

    public AssignmentOfManufactory getAssignmentOfManufactory() {
        return assignmentOfManufactory;
    }

    public void setAssignmentOfManufactory(AssignmentOfManufactory assignmentOfManufactory) {
        this.assignmentOfManufactory = assignmentOfManufactory;
    }
}
