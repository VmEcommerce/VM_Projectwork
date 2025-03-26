package com.projectwork.entities;

public class Track {

    private String artistName;
    private String trackName;
    private String Durata;
    private String Genere_musicale;
    private String Data_pubblicazione;
    private String Etichetta;
    private String Peso_MB;
    private String _id;  // Corretta la dichiarazione dell'ID
    private String prezzo;
    private int qta; 
    private String FOTO;

    public Track() {
    }

    
    
    public Track(String artistName, String trackName, String durata, String genere_Musicale, String data_pubblicazione,
            String etichetta, String peso_MB, String _id, String prezzo, int qta, String foto) {
        this.artistName = artistName;
        this.trackName = trackName;
        this.Durata = durata;
        this.Genere_musicale = genere_Musicale;
        this.Data_pubblicazione = data_pubblicazione;
        this.Etichetta = etichetta;
        this.Peso_MB = peso_MB;
        this._id = _id;
        this.prezzo = prezzo;
        this.qta = qta;
        this.FOTO = foto;
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
        return Durata;
    }



    public void setDurata(String durata) {
        Durata = durata;
    }



    public String getGenere_Musicale() {
        return Genere_musicale;
    }



    public void setGenere_Musicale(String genere_Musicale) {
        Genere_musicale = genere_Musicale;
    }



    public String getData_pubblicazione() {
        return Data_pubblicazione;
    }



    public void setData_pubblicazione(String data_pubblicazione) {
        Data_pubblicazione = data_pubblicazione;
    }



    public String getEtichetta() {
        return Etichetta;
    }



    public void setEtichetta(String etichetta) {
        Etichetta = etichetta;
    }



    public String getPeso_MB() {
        return Peso_MB;
    }



    public void setPeso_MB(String peso_MB) {
        Peso_MB = peso_MB;
    }



    public String get_id() {
        return _id;
    }



    public void set_id(String _id) {
        this._id = _id;
    }



    public String getPrezzo() {
        return prezzo;
    }



    public void setPrezzo(String prezzo) {
        this.prezzo = prezzo;
    }



    public int getQta() {
        return qta;
    }



    public void setQta(int qta) {
        this.qta = qta;
    }



    public String getFOTO() {
        return FOTO;
    }



    public void setFOTO(String foto) {
        FOTO = foto;
    }



    @Override
    public String toString() {
        return "Track{" +
                "artistName='" + artistName + '\'' +
                ", trackName='" + trackName + '\'' +
                ", durata='" + Durata + '\'' +
                ", genereMusicale='" + Genere_musicale + '\'' +
                ", dataPubblicazione='" + Data_pubblicazione + '\'' +
                ", etichetta='" + Etichetta + '\'' +
                ", pesoMB='" + Peso_MB + '\'' +
                ", id='" + _id + '\'' +
                ", prezzo='" + prezzo + '\'' +
                ", qta=" + qta + '\'' + ", foto='" + FOTO + '\'' +
                '}';
    }

}
