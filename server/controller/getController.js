const insertModel = require("../model/insertModel");

const getController = async(req,res)=>{
   try {
      const data = await insertModel.find();

      res.status(200).send({
        success:true,
        message:"Data fetched successfully",
        data
      })
        
   } catch (error) {
        res.status(400).send({
                success:false,
                message:"Data fetched Unsuccessfully",
                error
              })
   }
}


module.exports = {getController};