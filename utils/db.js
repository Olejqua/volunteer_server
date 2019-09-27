const Knex = require('knex');
const config = require('../config.json');

const knex = Knex({
  client: config.client,
  connection: config.connection,
});

module.exports = knex;
