const mysql = require("mysql2/promise");
const csv = require("csvtojson");
const fs = require("fs");
const conn = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "",
  database: "ipl",
});
async function insertValue(item) {
  let array = Object.entries(item).reduce((acc, pass) => {
    acc.push(pass[1]);
    return acc;
  }, []);

  await conn.query(
    `INSERT INTO \`delivery\` VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);`,
    array,
    (err, res, field) => {
      if (err) {
        console.log(err);
      } else {
        console.log(res);
      }
    }
  );
}
function main() {
  csv()
    .fromFile("/home/saikrishna/Documents/SQLIPL/deliveries.csv")
    .then((data) => {
      for (const item of data) {
        insertValue(item);
      }
    });
}
main();
