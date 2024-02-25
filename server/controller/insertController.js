const insertModel = require("../model/insertModel");

const insertController = async(req,res)=>{
  const {text} = req.body;
  try {
    console.log(text);
   const data = new insertModel({text});

   await data.save(); //save data in database

   res.status(200).send({
    success:true,
    message:"Data inserted successfully",
    data
   })

  } catch (error) {
    res.status(400).send({
      success:false,
      message:"Data inserted Unsuccessfully",
      error
     })
  }
}

module.exports = {insertController};