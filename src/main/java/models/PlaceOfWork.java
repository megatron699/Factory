package models;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "place_of_work")
@Inheritance(strategy = InheritanceType.JOINED)
@DiscriminatorColumn(name = "place_of_work_type")
public class PlaceOfWork {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_place_of_work")
    private long idPlaceOfWork;
    @Column(name = "place_of_work_name")
    private String placeOfWorkName;
    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "placeOfWork")
    private List<Worker> workers;

    public long getIdPlaceOfWork() {
        return idPlaceOfWork;
    }

    public void setIdPlaceOfWork(long idPlaceOfWork) {
        this.idPlaceOfWork = idPlaceOfWork;
    }

    public String getPlaceOfWorkName() {
        return placeOfWorkName;
    }

    public void setPlaceOfWorkName(String placeOfWorkName) {
        this.placeOfWorkName = placeOfWorkName;
    }

    public List<Worker> getWorkers() {
        return workers;
    }

    public void setWorkers(List<Worker> worker) {
        this.workers = worker;
    }

}
