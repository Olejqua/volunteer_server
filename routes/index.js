// routes/index.js
const express = require ('express');
const db = require('../utils/db');

const router = express.Router();
/* GET home page. */
router.get('/', (req, res) => {
  db('events')
    .select('entity', 'action')
    .then((res2) => {
      res.send({ entity: res2 });
    });
});

module.exports = router;
