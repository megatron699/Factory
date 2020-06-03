package models;


import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "attendance")
public class Attendance {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "report_seq")
    @SequenceGenerator(name = "report_seq", sequenceName = "SEQ_REPORT")
    @Column(name = "id_report", updatable = false)
    private long idReport;
    @Column(name = "date_in_work")
    private Date dateInWork;
    @Column(name = "date_out_work")
    private Date dateOutWork;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_worker")
    private Worker worker;

    public long getIdReport() {
        return idReport;
    }

    public void setIdReport(long idReport) {
        this.idReport = idReport;
    }

    public Date getDateInWork() {
        return dateInWork;
    }

    public void setDateInWork(Date dateInWork) {
        this.dateInWork = dateInWork;
    }

    public Date getDateOutWork() {
        return dateOutWork;
    }

    public void setDateOutWork(Date dateOutWork) {
        this.dateOutWork = dateOutWork;
    }

    public Worker getWorker() {
        return worker;
    }

    public void setWorker(Worker worker) {
        this.worker = worker;
    }
}
