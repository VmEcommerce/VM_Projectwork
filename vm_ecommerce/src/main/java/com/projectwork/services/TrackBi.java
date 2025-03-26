package com.projectwork.services;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;

import com.google.gson.Gson;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.result.InsertOneResult;
import com.projectwork.entities.Track;

public class TrackBi {

    private List<Track> tracks = new ArrayList<Track>();

    public List<Track> loadTrack() {
        if (tracks.isEmpty()) {
            resetCache();
        }
        return new ArrayList<Track>(tracks);
    }

   
        public Track save(Track track) {
            MongoCollection<Document> collection = this.getCollection();
            Gson gson = new Gson();
    
            try {
                Document doc = Document.parse(gson.toJson(track));
    
                // Se l'ID è nullo o vuoto, rimuovilo così MongoDB genera un nuovo _id automaticamente
                if (track.get_id() == null || track.get_id().isEmpty()) {
                    doc.remove("_id");
                } else {
                    // Se l'ID esiste, assicurati che sia una stringa
                    doc.put("_id", track.get_id());
                }
    
                InsertOneResult resp = collection.insertOne(doc);
    
                if (resp.getInsertedId() != null) {
                    // Converte correttamente l'ID in stringa
                    String insertedId = resp.getInsertedId().asObjectId().getValue().toString();
                    track.set_id(insertedId); 
    
                    tracks.add(track); // Aggiungi il track alla cache
                    return track;
                } else {
                    throw new Exception("Inserimento fallito");
                }
    
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
    
        public MongoCollection<Document> getCollection() {
            MongoDBConnector mongodb = new MongoDBConnector();
            mongodb.setConnection();
            mongodb.setDatabase("VM");
            return mongodb.load("track"); // Nome corretto della collezione
        }
    
        private void resetCache() {
            this.tracks.clear(); 
            MongoCollection<Document> collection = this.getCollection();
            System.out.println("Numero di documenti trovati: " + collection.countDocuments());
    
            for (Document d : collection.find()) {
                Gson gson = new Gson();
                Track track = gson.fromJson(d.toJson(), Track.class);
                this.tracks.add(track);
            }
        }
    }

    

    



