const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const insertRoutes = require("./routes/insertRoutes")
const getRoutes = require("./routes/getRoute")
const deleteRoutes = require("./routes/deleteRoute")

const app = express();

require("./db/db")


app.get('/', (req, res) =>{
        res.send('Hello World!');
})

// middleware
app.use(cors());
app.use(bodyParser.json());


app.use("/api/v1/insert",insertRoutes)
app.use("/api/v1/get",getRoutes)
app.use("/api/v1/delete",deleteRoutes)


const PORT = 8080

app.listen(PORT, () => {
        console.log(`Server running on ${PORT}`);
} )