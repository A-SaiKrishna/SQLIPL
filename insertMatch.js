const mysql = require("mysql2");
const csv = require("csvtojson");
const fs = require("fs");
const pool = mysql.createPool({
  host: "localhost",
  user: "root",
  //password: "99592",
  password: "",
  database: "ipl",
  waitForConnections: true,
  connectionLimit: 10,
  maxIdle: 10,
  idleTimeout: 60000,
  queueLimit: 0,
  enableKeepAlive: true,
  keepAliveInitialDelay: 0,
});

function insertData(dataObj) {
  let dataArray = Object.entries(dataObj).reduce((acc, pass) => {
    acc.push(pass[1]);
    return acc;
  }, []);
  pool.execute(
    `INSERT INTO \`match\` VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);`,
    dataArray,
    (err, results, fields) => {
      if (err) {
        console.log(err);
      } else {
        console.log(results);
      }
    }
  );
}

async function main() {
  const data = await csv().fromFile(
    "/home/saikrishna/Documents/SQLIPL/matches.csv"
  );

  for (const item of data) {
    await insertData(item);
  }
}
main();
