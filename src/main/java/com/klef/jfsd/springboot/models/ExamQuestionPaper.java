package com.klef.jfsd.springboot.models;

import java.sql.Blob;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "papertable")
public class ExamQuestionPaper {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="paper_id")
    private int id;

    @Column(name="subject_name", nullable = false, length = 100)
    private String subjectName;

    @Column(name="course_code", nullable = false, length = 20)
    private String courseCode;

    @Column(name="semester", nullable = false)
    private int semester;

    @Column(name="exam_date", nullable = false, length = 20)
    private String examDate;

    @Column(name="exam_type", nullable = false, length = 40)  // New field for exam type
    private String examType;

    @Column(name="question_paper_pdf", nullable = false)
    private Blob questionPaperPdf; // Blob to store the PDF file

    // Getters and setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }

    public String getExamDate() {
        return examDate;
    }

    public void setExamDate(String examDate) {
        this.examDate = examDate;
    }

    public String getExamType() {
        return examType;
    }

    public void setExamType(String examType) {
        this.examType = examType;
    }

    public Blob getQuestionPaperPdf() {
        return questionPaperPdf;
    }

    public void setQuestionPaperPdf(Blob questionPaperPdf) {
        this.questionPaperPdf = questionPaperPdf;
    }
}
