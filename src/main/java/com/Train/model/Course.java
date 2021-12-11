package com.Train.model;
import java.util.List;
public class Course {
    private Integer cid;

    private Integer uid;
    
    private String cname;

    private String cdescription;

    private String cteacher;
    
    private String cpath;
    
    private String score;
    
    private List<UserCourse> usercourse; 

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }
    
    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname == null ? null : cname.trim();
    }

    public String getCdescription() {
        return cdescription;
    }

    public void setCdescription(String cdescription) {
        this.cdescription = cdescription == null ? null : cdescription.trim();
    }

    public String getCteacher() {
        return cteacher;
    }

    public void setCteacher(String cteacher) {
        this.cteacher = cteacher == null ? null : cteacher.trim();
    }
    
    public String getCpath() {
        return cpath;
    }

    public void setCpath(String cpath) {
        this.cpath = cpath;
    }
    
    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score == null ? null : score.trim();
    }
    
    public List<UserCourse> getUserCourse() {  
        return usercourse;  
    }  
  
    public void setUserCourse(List<UserCourse> usercourse) {  
        this.usercourse = usercourse;  
    }  
}