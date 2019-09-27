const express = require('express');
const db = require('../utils/db').default;

const router = express.Router();

/* GET users listing. */
router.get('/', (req, res) => {
  console.log(db);
  db('test').select('id').then((res2) => {
    res.send({ admin: 'admin', id: res2 });
  });
});
module.exports = router;
