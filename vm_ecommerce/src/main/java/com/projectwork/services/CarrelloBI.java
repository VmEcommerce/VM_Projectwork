package com.projectwork.services;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.bson.Document;
import org.bson.conversions.Bson;

import com.google.gson.Gson;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;
import com.mongodb.client.result.InsertOneResult;
import com.mongodb.client.result.UpdateResult;
import com.projectwork.entities.Track;

public class CarrelloBI {

    private List<Track> tracks = new ArrayList<>();
    private final Gson gson = new Gson();

    public List<Track> loadCarrello() {
        if (tracks.isEmpty()) {
            this.resetCache();
        }
        return new ArrayList<>(tracks);
    }

    public Track save(Track track) {
        MongoCollection<Document> document = this.getCollection();

        try {
            track.set_id(UUID.randomUUID().toString());  // Genera un ID unico
            Document doc = Document.parse(gson.toJson(track));
            doc.put("_id", track.get_id()); 

            InsertOneResult resp = document.insertOne(doc);

            if (resp.getInsertedId() != null) {
                tracks.add(track);
                return track;
            } else {
                throw new RuntimeException("Inserimento fallito");
            }

        } catch (Exception e) {
            e.printStackTrace(); 
            return null;
        }
    }

    public Track update(Track track) {
    MongoCollection<Document> documents = this.getCollection();
    try {
        Bson filter = Filters.eq("_id", track.get_id()); // "_id" è la chiave univoca in MongoDB
        Bson update = Updates.inc("qta", track.getQta());
        
        UpdateResult result = documents.updateOne(filter, update); // Dichiarazione esplicita

        if (result.getModifiedCount() == 0) {
            System.out.println("Nessun documento aggiornato. L'ID potrebbe non esistere.");
            return null;
        }

        this.resetCache();
        return track;
    } catch (Exception e) {
        e.printStackTrace();
        return null;
    }
}

    public void resetCache() {
        this.tracks.clear();
        MongoCollection<Document> document = this.getCollection();
        System.out.println("Numero di documenti trovati: " + document.countDocuments());

        for (Document d : document.find()) {
            Track track = gson.fromJson(d.toJson(), Track.class);
            this.tracks.add(track);
        }
        System.out.println("Carrello aggiornato: " + this.tracks);
    }

    private MongoCollection<Document> getCollection() {
        MongoDBConnector mongodb = new MongoDBConnector();
        mongodb.setConnection();
        mongodb.setDatabase("VM");
        return mongodb.load("carrello");
    }
}
