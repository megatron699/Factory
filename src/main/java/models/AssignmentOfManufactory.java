package models;


import org.hibernate.mapping.Join;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "assignment_of_manufactory")
public class AssignmentOfManufactory {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_assignment_of_manufactory", updatable = false)
    private long idAssignmentOfManufactory;
    private String assign;
   // @JoinColumn(name = "assignmentOfManufactory", referencedColumnName = "assignmentOfManufactory")
    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "assignmentOfManufactory")
    private List<Manufactory> manufactories;

    public long getIdAssignmentOfManufactory() {
        return idAssignmentOfManufactory;
    }

    public void setIdAssignmentOfManufactory(long idAssignmentOfManufactory) {
        this.idAssignmentOfManufactory = idAssignmentOfManufactory;
    }

    public String getAssign() {
        return assign;
    }

    public void setAssign(String assign) {
        this.assign = assign;
    }

    public List<Manufactory> getManufactories() {
        return manufactories;
    }

    public void setManufactories(List<Manufactory> manufactories) {
        this.manufactories = manufactories;
    }
}
