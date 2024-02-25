const mongoose = require('mongoose');

const insertSchema = new mongoose.Schema({
      text:{
        type:String,
        required:true
      }  
})

const insertModel = mongoose.model("insert",insertSchema)

module.exports = insertModel;