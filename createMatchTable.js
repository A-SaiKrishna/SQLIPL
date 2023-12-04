const mysql = require("mysql2");

// Create the connection pool. The pool-specific settings are the defaults
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

pool.execute(
  `
      CREATE TABLE IF NOT EXISTS \`match\` (
        id INT PRIMARY KEY,
        season INT,
        city VARCHAR(255),
        date DATE,
        team1 VARCHAR(255),
        team2 VARCHAR(255),
        toss_winner VARCHAR(255),
        toss_decision VARCHAR(50),
        result VARCHAR(50),
        dl_applied INT,
        winner VARCHAR(255),
        win_by_runs INT,
        win_by_wickets INT,
        player_of_match VARCHAR(255),
        venue VARCHAR(255),
        umpire1 VARCHAR(255),
        umpire2 VARCHAR(255),
        umpire3 VARCHAR(255)
      );
    `,
  function (err, results, fields) {
    console.log(results);
    console.log(fields);
    console.log(err);
  }
);
