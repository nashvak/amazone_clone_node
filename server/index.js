//  IMPORT FROM PACKAGES
const express=require('express');

const mongoose=require('mongoose')
//change password here

const db='mongodb+srv://nashvakizhakkayil:monsterasif@cluster0.demz3g6.mongodb.net/?retryWrites=true&w=majority';

//IMPORTS FROM OTHER FILES
const authRouter=require('./routes/auth.js');

//  INITIALIZATION
const PORT=3000;
const app=express();
//  MIDDLEWARE
app.use(express.json())
app.use(authRouter);
//connections

mongoose.connect(db).then(()=>{
console.log("connection succesfull");
}).catch((e)=>console.log(e));

app.listen(PORT,"0.0.0.0",()=>{console.log(`connected at port ${PORT} `);});