const express = require('express');
const { insertController } = require('../controller/insertController');

const router = express.Router();

router.post("/insert-data",insertController)


module.exports = router;