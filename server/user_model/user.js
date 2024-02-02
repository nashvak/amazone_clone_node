const mongoose=require('mongoose');
const userSchema=mongoose.Schema({
    name:{
        required:true,
        type:String,
        trim:true,

    },
    email:{
        required:true,
        type:String,
        trim:true,
        validate:{
            validator:(value)=>{
                const re=/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
                return value.match(re);
        },
        message:'Please enter a vaid email',
        },
        
    },
    password:{
        required:true,
        type:String,
        validate:{
            validator:(value)=>{
                return value.length>8;
            },
            message:"Please enter long password",
        }

    },address:{
        type:String,
        default:"",
    },
    type:{
        type:String,
        default:'user',
    },
});const User=mongoose.model('User',userSchema);
module.exports=User;