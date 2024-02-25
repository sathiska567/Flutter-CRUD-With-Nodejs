const express = require('express');
const { getController } = require('../controller/getController');

const router = express.Router();

router.get("/get-data",getController)


module.exports = router;