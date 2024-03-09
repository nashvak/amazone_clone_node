const express=require('express');
const admin = require('../middlewares/admin');
const adminRouter=express.Router();
const Product=require("../user_model/product")
//creating admin middleware
adminRouter.post('/admin/add-product',admin,async(req,res)=>{
    try{
        const {name,description,images,quantity,price,category}=req.body;
        let product=new Product({name,description,images,price,quantity,category});
        product=await product.save();
        res.json(product);
    }catch(e){
        res.status(500).json({error:e.message});
    }
});

// get all products
adminRouter.get('/admin/get-product',admin,async(req,res)=>{
    try{
const products=await Product.find({});
res.json(products); // return the products 

    }catch(e){
res.status(500).json({error:e.message});
    }
});

//deleting the product
adminRouter.get("/admin/delete-product",admin,async (req,res)=>{
try {
    const {id}=req.body;
    let product=await Product.findByIdAndDelete(id);
    res.json(product);
} catch (e) {
    res.status(500).json({error:e.message});
    
}
})
module.exports=adminRouter;