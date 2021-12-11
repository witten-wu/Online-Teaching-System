package com.Train.model;

public class Question {
    private Integer questionid;

    private String question;

    private String answer;

    private Integer stuid;

    private Integer tecid;

    public Integer getQuestionid() {
        return questionid;
    }

    public void setQuestionid(Integer questionid) {
        this.questionid = questionid;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question == null ? null : question.trim();
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer == null ? null : answer.trim();
    }

    public Integer getStuid() {
        return stuid;
    }

    public void setStuid(Integer stuid) {
        this.stuid = stuid;
    }

    public Integer getTecid() {
        return tecid;
    }

    public void setTecid(Integer tecid) {
        this.tecid = tecid;
    }
}