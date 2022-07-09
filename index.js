const express=require('express')
const path= require('path')


const app=express()

const port=process.env.PORT || 3000


const publicDirectorypath=path.join(__dirname,'/public')
app.use(express.static(publicDirectorypath))
app.get('/', (req, res) => {
    res.send();
});

app.listen(port,()=>{
    console.log('Listening at port ', port)
})