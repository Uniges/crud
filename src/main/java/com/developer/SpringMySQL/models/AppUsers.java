package com.developer.SpringMySQL.models;

import javax.persistence.*;

@Entity
@Table(name = "book")
public class AppUsers {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int id;
    @Column(name = "title")
    public String title;
    @Column(name = "description")
    public String description;
    @Column(name = "author")
    public String author;
    @Column(name = "isbn")
    public String isbn;
    @Column(name = "printyear")
    public int printYear;
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "readalready")
//    @Type(type = "org.hibernate.type.NumericBooleanType")
    public boolean readAlready;

    public AppUsers() {
    }

    public AppUsers(String title, String description, String author, String isbn, int printYear/*, boolean readAlready*/) {
        this.title = title;
        this.description = description;
        this.author = author;
        this.isbn = isbn;
        this.printYear = printYear;
//        this.readAlready = readAlready;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public int getPrintYear() {
        return printYear;
    }

    public void setPrintYear(int printYear) {
        this.printYear = printYear;
    }

    public Boolean getReadAlready() {
        return readAlready;
    }

    public void setReadAlready(Boolean readAlready) {
        this.readAlready = readAlready;
    }

    @Override
    public String toString() {
        return "AppUsers{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", author='" + author + '\'' +
                ", isbn='" + isbn + '\'' +
                ", printYear=" + printYear +
                ", readAlready=" + readAlready +
                '}';
    }
}
