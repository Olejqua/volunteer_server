const express = require('express');

const router = express.Router();

/* GET account info. */
router.get('/', (req, res) => {
  res.send('respond with a resource');
});

module.exports = router;
