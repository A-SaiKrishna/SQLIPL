const mysql = require("mysql2");
const conn = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "",
  database: "ipl",
});

function selctingMatch() {
  conn.query(`select * from \`match\``, (err, res, fields) => {
    if (err) {
      console.log(err);
    } else {
      console.log(res);
      console.log(res.length);
    }
  });
}
selctingMatch();
