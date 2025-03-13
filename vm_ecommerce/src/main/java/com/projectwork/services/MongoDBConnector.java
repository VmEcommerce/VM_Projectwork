package com.projectwork.services;

import org.bson.Document;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class MongoDBConnector {

    private MongoClient connection;
    private MongoDatabase database;

 
    public void setConnection(){
        if (connection == null) {

            try {
            
                connection = MongoClients.create("mongodb://localhost:27017" );
                System.out.println("Connessione riuscita");

            }
            catch(Exception e){
                System.err.println("Connessione non riuscita" + e.getMessage());
            }
        }else{
            connection.startSession();

        }
    }

    public void closeConnection(){

        try{
            connection.close();
        }
        catch(Exception e){
            System.err.println("Connessione non riuscita" + e.getMessage());
        }

    }

    public void setDatabase(String nomeDB){

        
        if(connection == null)
        {   
            this.setConnection();
        }
            try
            {
                database = connection.getDatabase(nomeDB);
            }
            catch(Exception e)
            {
                System.err.println("Connessione non riuscita" + e.getMessage());
            }

    }


    public MongoCollection<Document> load(String nomeCollection){

        return database.getCollection(nomeCollection);
        
    }

}
