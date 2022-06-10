'use strict';
 /*
  * This code runs on Node v12.22.                                             *
  */

const http = require('http');
const { Client } = require('pg');

async function get_body() {
  const client = new Client({
    'host': process.env.IMMO_DB_HOST,
    'user': process.env.IMMO_DB_USER,
    'password': process.env.IMMO_DB_PASSWORD,
    'database': process.env.IMMO_DB,
    'port': 5432,
    'max': 3,
    'idleTimeoutMillis': 30000,
    'connectionTimeoutMillis': 2000,
  });

  await client.connect();
  const result = await client.query('select * from t_property order by address');
  await client.end();

  const body = result
    .rows
    .map((property) => `${property.id}: ${property.address}`)
    .join('\n');

  return body;
}

const port = 3000;
http.createServer(async (req, res) => {
  res.writeHead(200, {'Content-Type': 'text/plain'});

  let body;
  try {
    body = await get_body()

  } catch (error) {
    console.error(error);
    body = error;
  }

  res.end(`${body}\n`);

}).listen(port, () => {
  console.log(`Start listening on ${port}...`)
});
