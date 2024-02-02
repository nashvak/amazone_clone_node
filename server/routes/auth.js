const express=require("express");
const User=require('../user_model/user');
const authRouter=express.Router();
authRouter.post('/api/signup',async (req,res)=>{
    
    try{
        //get the data from client
    const{name,email,password}=req.body;
    //post that data in database
    const existinUser=await User.findOne({email});
    if(existinUser){
        return res.status(400).json({msg:"User with some email already exists!"});
    }
    let user=new User({
        email,password,name,
    })
    user=await user.save();
    //return that data to the user
    res.json(user);
    }
    catch(e){
        res.status(500).json({error:e.message});

    }
})
module.exports=authRouter;