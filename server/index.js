console.log("Hello world");
const express=require('express');
const PORT=3000;
const app=express();
// C R E A T I N G     A N    A P I

app.get("/hello-world",(req,res)=>{
    res.json({hi:"nashva"});
});

app.listen(PORT,()=>{console.log(`connected at port ${PORT} `);});