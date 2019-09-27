// routes/index.js
const express = require ('express');
const db = require('../utils/db');

const router = express.Router();
/* GET home page. */
router.get('/', (req, res) => {
  db('flats as f')
    .select('f.id', 'f.rooms', 'f.floor', 'f.price', 'f.square', 's.name as street', 'd.name as district', 'p.photo')
    .join('streets as s', 's.id', 'f.street_id')
    .join('districts as d', 'd.id', 'f.district_id')
    .join('photos as p', 'p.object_id', 'f.id')
    .then((res2) => {
      res.send({ flats: res2 });
    });
});

module.exports = router;
