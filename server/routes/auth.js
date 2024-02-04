const express=require("express");
const User=require('../user_model/user');
const bcryptjs=require('bcryptjs');
const authRouter=express.Router();
const jwt=require('jsonwebtoken');
//  S I G N  U P     R O U T E
authRouter.post("/api/signup",async (req,res)=>{
    
    try{
        //get the data from client
    const{name,email,password}=req.body;
    //post that data in database
    const existinUser=await User.findOne({email});
    if(existinUser){
        return res.status(400).json({msg:"User with some email already exists!"});
    }
    const hashPassword=await bcryptjs.hash(password,8);
    let user=new User({
        email,
        password:hashPassword,
        name,
    })
    user=await user.save();
    //return that data to the user
    res.json(user);
    }
    catch(e){
        res.status(500).json({error:e.message});

    }
}),

//signin route
//hashing to convert the hashed password to string
authRouter.post("/api/signin",async(req,res)=>{
    try {
        const {email,password}=req.body;
        const user=await User.findOne({email});
    if(!user){
        return res.status(400).json({msg:'User does not exists'});
    }
    const isMatch=await bcryptjs.compare(password,user.password);
    if(!isMatch){
        return res.status(400).json({msg:'Incorrect password!'});
 
    }
    const token=jwt.sign({id:user._id},"passwordKey")
    res.json({token,...user._doc})
    } catch (e) {
        res.status(500).json({error:e.message})
    }
})

module.exports=authRouter;