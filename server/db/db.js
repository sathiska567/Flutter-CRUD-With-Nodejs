const mongoose = require('mongoose');

const MONGO_URL = "mongodb+srv://sasindusathiska:Pass123@cluster1.q95jomh.mongodb.net/database" 

mongoose.connect(MONGO_URL);

const connection = mongoose.connection;

connection.once("open",()=>{
    console.log("monogdb connected");
})

