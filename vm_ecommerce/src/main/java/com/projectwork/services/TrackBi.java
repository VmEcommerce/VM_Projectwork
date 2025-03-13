package com.projectwork.services;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.bson.Document;

import com.google.gson.Gson;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.result.InsertOneResult;
import com.projectwork.entities.Track;

public class TrackBi {

    public List<Track> tracks = new ArrayList<Track>();

    public List<Track> loadtrack(){

        if(tracks.isEmpty()){

            this.resetCache();

        }

        return tracks;

    } 

    public Track save(Track track)
    {
        
        MongoCollection<Document> document = this.getCollection();
        Gson gson = new Gson();

        try
        {   
            track.setId(UUID.randomUUID().toString());
            InsertOneResult resp = document.insertOne(Document.parse(gson.toJson(track)));
            if(track.getId() != resp.getInsertedId().toString())
            {
                return null;
            }

        }catch(Exception e)
        {
            return null;
        }

        this.resetCache();

        return track;
    }


    public MongoCollection<Document> getCollection(){

        MongoDBConnector mongodb = new MongoDBConnector();
        
        mongodb.setConnection();
        mongodb.setDatabase("track");

        MongoCollection<Document> document = mongodb.load("track");

        return document;
    }

    private void resetCache(){

        tracks = new ArrayList<Track>();

        MongoCollection<Document> document = this.getCollection();

        for (Document d : document.find()) {
            Gson gson = new Gson();
            Track track = gson.fromJson(d.toJson(), Track.class);
            System.out.println(tracks.toString());
            tracks.add(track);
        }
    }
}
