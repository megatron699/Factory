package models;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "users")
public class User{
    @Id
//    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_worker")
    private long idUser;
    @Column(unique = true)
    private String username;
    private String password;
    @Column(name = "user_role")
    private boolean userRole;
    @MapsId
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_worker")
    private Worker worker;

    public long getIdUser() {
        return idUser;
    }

    public void setIdUser(long idUser) {
        this.idUser = idUser;
    }

    public Worker getWorker() {
        return worker;
    }

    public void setWorker(Worker worker) {
        this.worker = worker;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isUserRole() {
        return userRole;
    }

    public void setUserRole(boolean userRole) {
        this.userRole = userRole;
    }
}
