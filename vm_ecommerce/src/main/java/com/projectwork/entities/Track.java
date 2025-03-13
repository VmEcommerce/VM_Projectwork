package com.projectwork.entities;

public class Track {

    private String artistName;
    private String trackName;
    private String durata;
    private String genre;
    private String date;
    private String etichetta;
    private String size;
    private Object Id;

    
    public Track(String artistName, String trackName, String durata, String genre, String date, String etichetta,
            String size) {

        this.artistName = artistName;
        this.trackName = trackName;
        this.durata = durata;
        this.genre = genre;
        this.date = date;
        this.etichetta = etichetta;
        this.size = size;
        
    }

  
    public String getArtistName() {
        return artistName;
    }
    public void setArtistName(String artistName) {
        this.artistName = artistName;
    }
    public String getTrackName() {
        return trackName;
    }
    public void setTrackName(String trackName) {
        this.trackName = trackName;
    }
    public String getDurata() {
        return durata;
    }
    public void setDurata(String durata) {
        this.durata = durata;
    }
    public String getGenre() {
        return genre;
    }
    public void setGenre(String genre) {
        this.genre = genre;
    }
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
    public String getEtichetta() {
        return etichetta;
    }
    public void setEtichetta(String etichetta) {
        this.etichetta = etichetta;
    }
    public String getSize() {
        return size;
    }
    public void setSize(String size) {
        this.size = size;
    }


    public Object getId() {
        return Id;
    }


    public void setId(Object id) {
        Id = id;
    }

    

}
