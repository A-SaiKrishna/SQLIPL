const mysql = require("mysql2");
const conn = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "",
  database: "ipl",
});
function main(cb) {
  conn.execute(
    `
        CREATE TABLE IF NOT EXISTS \`delivery\` (
            match_id INT,
            inning INT,
            batting_team VARCHAR(250),
            bowling_team VARCHAR(250),
            \`over\` INT,
            ball INT,
            batsman VARCHAR(250),
            non_striker VARCHAR(250),
            bowler VARCHAR(250),
            is_super_over INT,
            wide_runs INT,
            bye_runs INT,
            legbye_runs INT,
            noball_runs INT,
            penality_runs INT,
            batsman_runs INT,
            extra_runs INT,
            total_runs INT,
            player_dismissed VARCHAR(250),
            dismissal_kind VARCHAR(250),
            fielder VARCHAR(250)
            );
    `,
    (err, results, fields) => {
      if (err) {
        console.log(err);
      } else {
        console.log(results);
        console.log(fields);
      }
    }
  );
}
main();
