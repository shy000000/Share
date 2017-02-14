package com.apache.model;

import javax.persistence.*;

/**
 * Created by shy on 2016/3/24.
 */
@Entity
@Table(name = "ad", schema = "", catalog = "share")
public class AdEntity {
    private int id;
    private String word;
    private String picture1;
    private String picture2;
    private String turn1;
    private String turn2;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "word", nullable = true, insertable = true, updatable = true, length = 255)
    public String getWord() {
        return word;
    }

    public void setWord(String word) {
        this.word = word;
    }

    @Basic
    @Column(name = "picture1", nullable = true, insertable = true, updatable = true, length = 255)
    public String getPicture1() {
        return picture1;
    }

    public void setPicture1(String picture1) {
        this.picture1 = picture1;
    }

    @Basic
    @Column(name = "picture2", nullable = true, insertable = true, updatable = true, length = 255)
    public String getPicture2() {
        return picture2;
    }

    public void setPicture2(String picture2) {
        this.picture2 = picture2;
    }

    @Basic
    @Column(name = "turn1", nullable = true, insertable = true, updatable = true, length = 255)
    public String getTurn1() {
        return turn1;
    }

    public void setTurn1(String turn1) {
        this.turn1 = turn1;
    }

    @Basic
    @Column(name = "turn2", nullable = true, insertable = true, updatable = true, length = 255)
    public String getTurn2() {
        return turn2;
    }

    public void setTurn2(String turn2) {
        this.turn2 = turn2;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AdEntity adEntity = (AdEntity) o;

        if (id != adEntity.id) return false;
        if (picture1 != null ? !picture1.equals(adEntity.picture1) : adEntity.picture1 != null) return false;
        if (picture2 != null ? !picture2.equals(adEntity.picture2) : adEntity.picture2 != null) return false;
        if (turn1 != null ? !turn1.equals(adEntity.turn1) : adEntity.turn1 != null) return false;
        if (turn2 != null ? !turn2.equals(adEntity.turn2) : adEntity.turn2 != null) return false;
        if (word != null ? !word.equals(adEntity.word) : adEntity.word != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (word != null ? word.hashCode() : 0);
        result = 31 * result + (picture1 != null ? picture1.hashCode() : 0);
        result = 31 * result + (picture2 != null ? picture2.hashCode() : 0);
        result = 31 * result + (turn1 != null ? turn1.hashCode() : 0);
        result = 31 * result + (turn2 != null ? turn2.hashCode() : 0);
        return result;
    }
}
