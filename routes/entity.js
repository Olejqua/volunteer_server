// routes/index.js
const express = require ('express');
const db = require('../utils/db');

const router = express.Router();
/* GET home page. */
router.get('/', (req, res) => {
  db('events')
    .select('id', 'entity', 'action', 'date_start', 'date_end', 'place', 'img')
    .then((res2) => {
      res.send({ entitys: res2 });
    });
});

router.get('/:id', function (req, res, next) {
  db('events')
  .select('entity', 'action', 'date_start', 'date_end', 'place', 'img')
  .where('id', req.params.id)
  .then((res2) => {
    res.send({ entity: res2[0] });
  });
});
module.exports = router;
