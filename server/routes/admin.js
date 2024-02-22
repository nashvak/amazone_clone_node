const express=require('express');
const admin = require('../middlewares/admin');
const adminRouter=express.Router();
const Product=require("../user_model/product")
//creating admin middleware
adminRouter.post('/admin/add-product',admin,async(req,res)=>{
    try{
        const {name,description,images,quantity,price,category}=req.body;
        let product=new Product({name,description,images,price,quantity,category});
    }catch(e){
        res.status(500).json({error:e.message});
    }
});