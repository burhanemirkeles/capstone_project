const mongoose = require('mongoose');

const RegisterSchema = mongoose.Schema({
    name:{
        type: String,
        required: true
    },
    mail_adress:{
        type: String,
        required: true,
        
    },
    password:{
        type: String,
        required: true
    },
    register_date: {
        type: Date,
        default: Date.now
    }
    

});

module.exports = mongoose.model('register', RegisterSchema)
