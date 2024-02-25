const insertModel = require("../model/insertModel")

const deleteDataController = async(req,res)=>{
   try {
     const response = await insertModel.deleteMany({})

     if(!response){
       return res.status(404).send({
          success:false,
          message:"Data not found"
       })
     }

     res.status(200).send({
        success:true,
        message:"Data Deleted Successfull"
     })
        
   } catch (error) {
        res.status(400).send({
                success:false,
                message:"Data Deleted Unsuccessfull"
             })
   }
}

module.exports = {deleteDataController}