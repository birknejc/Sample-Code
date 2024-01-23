package com.example.comicfinal;

import java.text.NumberFormat;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;

/**
 * The Comic class represents a comic book.
 * It encapsulates various properties of a comic, such as its publisher, series, volume, issue, price, grade, rarity, and first appearance status.
 */

@Entity
public class Comic {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int comicId;

    @NotEmpty(message = "Publisher is required")
    private String Publisher;

    @NotEmpty(message = "Series is required")
    private String Series;

    @Positive(message = "Volume must be a positive number")
    private int Volume;

    @Positive(message = "Issue must be a positive number")
    private int Issue;

    @PositiveOrZero(message = "Price must be a positive or zero number")
    private double Price;
    @DecimalMin(value = "0.0", message = "Grade must be greater than or equal to 0")
    @DecimalMax(value = "10.0", message = "Grade must be less than or equal to 10")
    private double Grade;
    @DecimalMin(value = "0.0", message = "Rarity must be greater than or equal to 0")
    @DecimalMax(value = "10.0", message = "Rarity must be less than or equal to 10")
    private double Rarity;
    private boolean FirstAppearance;

    /**
     * Constructs a Comic object with the specified properties.
     *
     * @param Publisher        the publisher of the comic
     * @param Series           the series of the comic
     * @param Volume           the volume of the comic
     * @param Issue            the issue number of the comic
     * @param Price            the price of the comic
     * @param Grade            the grade of the comic
     * @param Rarity           the rarity of the comic
     * @param FirstAppearance  the first appearance status of the comic
     */
    public Comic(int comicId, String Publisher, String Series, int Volume, int Issue, double Price,
                 double Grade, double Rarity, boolean FirstAppearance) {
        this.Publisher = Publisher;
        this.Series = Series;
        this.Volume = Volume;
        this.Issue = Issue;
        this.Price = Price;
        this.Grade = Grade;
        this.Rarity = Rarity;
        this.FirstAppearance = FirstAppearance;
    }

    public Comic() {
    }

    public int getComicId() {
        return comicId;
    }

    public void setComicId(int comicId) {
        this.comicId = comicId;
    }

    /**
     * Gets the publisher of the comic.
     *
     * @return the publisher of the comic
     */
    public String getPublisher() {
        return Publisher;
    }

    /**
     * Sets the publisher of the comic.
     *
     * @param publisher the publisher of the comic
     */
    public void setPublisher(String publisher) {
        Publisher = publisher;
    }

    /**
     * Gets the series of the comic.
     *
     * @return the series of the comic
     */
    public String getSeries() {
        return Series;
    }

    /**
     * Sets the series of the comic.
     *
     * @param series the series of the comic
     */
    public void setSeries(String series) {
        Series = series;
    }

    /**
     * Gets the volume of the comic.
     *
     * @return the volume of the comic
     */
    public int getVolume() {
        return Volume;
    }

    /**
     * Sets the volume of the comic.
     *
     * @param volume the volume of the comic
     */
    public void setVolume(int volume) {
        Volume = volume;
    }

    /**
     * Gets the issue number of the comic.
     *
     * @return the issue number of the comic
     */
    public int getIssue() {
        return Issue;
    }

    /**
     * Sets the issue number of the comic.
     *
     * @param issue the issue number of the comic
     */
    public void setIssue(int issue) {
        Issue = issue;
    }

    /**
     * Gets the price of the comic.
     *
     * @return the price of the comic
     */
    public double getPrice() {
        return Price;
    }

    /**
     * Sets the price of the comic.
     *
     * @param price the price of the comic
     */
    public void setPrice(double price) {
        Price = price;
    }

    /**
     * Gets the grade of the comic.
     *
     * @return the grade of the comic
     */
    public double getGrade() {
        return Grade;
    }

    /**
     * Sets the grade of the comic.
     *
     * @param grade the grade of the comic
     */
    public void setGrade(double grade) {
        Grade = grade;
    }

    /**
     * Gets the rarity of the comic.
     *
     * @return the rarity of the comic
     */
    public double getRarity() {
        return Rarity;
    }

    /**
     * Sets the rarity of the comic.
     *
     * @param rarity the rarity of the comic
     */
    public void setRarity(double rarity) {
        Rarity = rarity;
    }

    /**
     * Checks if the comic is a first appearance.
     *
     * @return true if the comic is a first appearance, false otherwise
     */
    public boolean isFirstAppearance() {
        return FirstAppearance;
    }

    /**
     * Sets the first appearance status of the comic.
     *
     * @param firstAppearance the first appearance status of the comic
     */
    public void setFirstAppearance(boolean firstAppearance) {
        FirstAppearance = firstAppearance;
    }

    /**
     * Calculates the value of the comic based on its rarity, grade, and first appearance status.
     *
     * @return the calculated value of the comic
     */
    public double calcValue() {
        double rarityWeight;
        double gradeWeight;

        if (Rarity < 3) {
            rarityWeight = 10;
        } else if (Rarity >= 3 && Rarity <= 7) {
            rarityWeight = 15;
        } else {
            rarityWeight = 30;
        }

        if (Grade < 8.0) {
            gradeWeight = 2.2;
        } else {
            gradeWeight = 4.66;
        }

        if (FirstAppearance) {
            return (Price * (rarityWeight + gradeWeight) * 75);
        } else {
            return (Price * (rarityWeight + gradeWeight)) * 10;
        }
    }

    /**
     * Returns a string representation of the comic.
     *
     * @return a string representation of the comic
     */
    @Override
    public String toString() {
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance();
        String formattedValue = currencyFormatter.format(calcValue());
        return "Comic: " +
                "publisher='" + Publisher +
                ", series='" + Series +
                ", volume=" + Volume +
                ", issue=" + Issue +
                ", price=" + Price +
                ", grade=" + Grade +
                ", rarity=" + Rarity +
                ", firstAppearance=" + FirstAppearance +
                ", value=" + formattedValue +
                "\n";
    }
}
