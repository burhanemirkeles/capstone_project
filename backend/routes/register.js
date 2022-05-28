const express = require('express');
const router = express.Router();
const Register = require('../models/Register')

router.get('/', async (req,res)=> {
    try {
        const register = await Register.find();
        res.json(register)
    } catch (error) {
        res.json({message:err})
    }
});

router.post('/', async (req,res)=> {
    const register = new Register({
        name: req.body.name,
        mail_adress: req.body.mail_adress,
        password: req.body.password
    });
    try {
        const registeredUser = await register.save();
        res.json(registeredUser)   
    } catch (err) {
        res.json({message: err})
    }
  
});

module.exports = router;
