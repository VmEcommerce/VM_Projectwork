package com.projectwork.entities;

public class Carrello {
    
    
        private String trackId;
        private String trackName;
        private String artistName;
        private String genre;
        private String duration;
        private String price;

        public Carrello(String trackId, String trackName, String artistName, String genre, String duration,
                String price) {
            this.trackId = trackId;
            this.trackName = trackName;
            this.artistName = artistName;
            this.genre = genre;
            this.duration = duration;
            this.price = price;
        }

        public String getTrackId() {
            return trackId;
        }

        public void setTrackId(String trackId) {
            this.trackId = trackId;
        }

        public String getTrackName() {
            return trackName;
        }

        public void setTrackName(String trackName) {
            this.trackName = trackName;
        }

        public String getArtistName() {
            return artistName;
        }

        public void setArtistName(String artistName) {
            this.artistName = artistName;
        }

        public String getGenre() {
            return genre;
        }

        public void setGenre(String genre) {
            this.genre = genre;
        }

        public String getDuration() {
            return duration;
        }

        public void setDuration(String duration) {
            this.duration = duration;
        }

        public String getPrice() {
            return price;
        }

        public void setPrice(String price) {
            this.price = price;
        }

        


    
    
    
        // Getters e setters per ogni campo
    }
    
