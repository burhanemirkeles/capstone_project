const express = require('express');
const app = express();
const mongoose = require('mongoose');
const bodyParser = require("body-parser")
require('dotenv/config')

app.use(bodyParser.json());

const registerRoute = require('./routes/register');

app.use('/register',registerRoute)
//ROUTES
app.get('/',(req,res)=>{
    res.send('We are on home')
})
app.get('/register',(req,res)=>{
  
})


//CONNECT TO DB
mongoose.connect(process.env.DB_CONNECTION,()=> console.log('connected to DB'))

app.listen(3000);
