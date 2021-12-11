package com.Train.model;

public class UserCourse {
    private Integer ucid;

    private Integer uid;

    private Integer cid;
    
    private String score;

    public Integer getUcid() {
        return ucid;
    }

    public void setUcid(Integer ucid) {
        this.ucid = ucid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }
    
    public String getScore() {
        return score;
    }

    public void setScore(String score) {
    	this.score = score == null ? null : score.trim();
    }
}