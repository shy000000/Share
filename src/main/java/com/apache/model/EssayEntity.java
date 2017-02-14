package com.apache.model;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by shy on 2016/3/24.
 */
@Entity
@Table(name = "essay", schema = "", catalog = "share")
public class EssayEntity {
    private int id;
    private int uid;
    private String src;
    private String title;
    private int lookcount;
    private Timestamp sharetime;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "uid", nullable = false, insertable = true, updatable = true)
    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    @Basic
    @Column(name = "src", nullable = false, insertable = true, updatable = true, length = 255)
    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    @Basic
    @Column(name = "title", nullable = false, insertable = true, updatable = true, length = 255)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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
    @Column(name = "sharetime", nullable = false, insertable = true, updatable = true)
    public Timestamp getSharetime() {
        return sharetime;
    }

    public void setSharetime(Timestamp sharetime) {
        this.sharetime = sharetime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EssayEntity that = (EssayEntity) o;

        if (id != that.id) return false;
        if (lookcount != that.lookcount) return false;
        if (uid != that.uid) return false;
        if (sharetime != null ? !sharetime.equals(that.sharetime) : that.sharetime != null) return false;
        if (src != null ? !src.equals(that.src) : that.src != null) return false;
        if (title != null ? !title.equals(that.title) : that.title != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + uid;
        result = 31 * result + (src != null ? src.hashCode() : 0);
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + lookcount;
        result = 31 * result + (sharetime != null ? sharetime.hashCode() : 0);
        return result;
    }
}
