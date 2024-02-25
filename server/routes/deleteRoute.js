const express = require('express');
const { deleteDataController } = require('../controller/deleteDataController');

const router = express.Router();

router.delete("/delete-data",deleteDataController)


module.exports = router;