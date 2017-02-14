package com.apache.model;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by shy on 2016/3/24.
 */
@Entity
@Table(name = "user", schema = "", catalog = "share")
public class UserEntity {
    private int id;
    private String name;
    private Timestamp cometime;
    private int essaycount;
    private String phone;
    private String address;
    private Timestamp deadline;
    private int lookcount;
    private int state;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name", nullable = false, insertable = true, updatable = true, length = 20)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "cometime", nullable = false, insertable = true, updatable = true)
    public Timestamp getCometime() {
        return cometime;
    }

    public void setCometime(Timestamp cometime) {
        this.cometime = cometime;
    }

    @Basic
    @Column(name = "essaycount", nullable = false, insertable = true, updatable = true)
    public int getEssaycount() {
        return essaycount;
    }

    public void setEssaycount(int essaycount) {
        this.essaycount = essaycount;
    }

    @Basic
    @Column(name = "phone", nullable = false, insertable = true, updatable = true, length = 15)
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "address", nullable = true, insertable = true, updatable = true, length = 50)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "deadline", nullable = true, insertable = true, updatable = true)
    public Timestamp getDeadline() {
        return deadline;
    }

    public void setDeadline(Timestamp deadline) {
        this.deadline = deadline;
    }

    @Basic
    @Column(name = "lookcount", nullable = false, insertable = true, updatable = true)
    public int getLookcount() {
        return lookcount;
    }

    public void setLookcount(int lookcount) {
        this.lookcount = lookcount;
    }

    @Basic
    @Column(name = "state", nullable = false, insertable = true, updatable = true)
    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserEntity that = (UserEntity) o;

        if (essaycount != that.essaycount) return false;
        if (id != that.id) return false;
        if (lookcount != that.lookcount) return false;
        if (state != that.state) return false;
        if (address != null ? !address.equals(that.address) : that.address != null) return false;
        if (cometime != null ? !cometime.equals(that.cometime) : that.cometime != null) return false;
        if (deadline != null ? !deadline.equals(that.deadline) : that.deadline != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (phone != null ? !phone.equals(that.phone) : that.phone != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (cometime != null ? cometime.hashCode() : 0);
        result = 31 * result + essaycount;
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (deadline != null ? deadline.hashCode() : 0);
        result = 31 * result + lookcount;
        result = 31 * result + state;
        return result;
    }
}
