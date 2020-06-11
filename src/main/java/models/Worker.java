package models;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "worker")
public class Worker {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_worker", updatable = false)
    private long idWorker;
    private String lastname;
    private String firstname;
    private String middlename;
    private String post;
    private boolean vacation;
    @Column(name = "sick_leave")
    private boolean sickLeave;
    @JoinColumn(name = "id_place_of_work", referencedColumnName = "id_place_of_work")
    @ManyToOne(fetch = FetchType.LAZY)
    private PlaceOfWork placeOfWork;
    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "worker")
    private List<Attendance> attendances;
    private boolean presence;
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "worker")
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public boolean isPresence() {
        return presence;
    }

    public void setPresence(boolean presence) {
        this.presence = presence;
    }

    public List<Attendance> getAttendances() {
        return attendances;
    }

    public void setAttendances(List<Attendance> attendances) {
        this.attendances = attendances;
    }

    public boolean isVacation() {
        return vacation;
    }

    public void setVacation(boolean vacation) {
        this.vacation = vacation;
    }

    public boolean isSickLeave() {
        return sickLeave;
    }

    public void setSickLeave(boolean sickLeave) {
        this.sickLeave = sickLeave;
    }

    public long getIdWorker() {
        return idWorker;
    }

    public void setIdWorker(long id) {
        this.idWorker = id;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getMiddlename() {
        return middlename;
    }

    public void setMiddlename(String middlename) {
        this.middlename = middlename;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public PlaceOfWork getPlaceOfWork() {
        return placeOfWork;
    }

    public void setPlaceOfWork(PlaceOfWork placeOfWork) {
        this.placeOfWork = placeOfWork;
    }
}
