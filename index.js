const { Client } = require("pg");
const config = {
  host: "localhost",
  port: 5432,
  user: "postgres",
  password: "postgres",
  database: "fm_pg",
};
const client = new Client(config);
start();
async function start() {
  await client.connect();
  const res = await client.query(``);
  console.log(res);
  await client.end();
}
