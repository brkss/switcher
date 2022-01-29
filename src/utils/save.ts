import { exec } from "child_process";
import fs from "fs";
import db from "./db.json";
import path from "path";

interface IDatabase {
  name: string;
  file: string;
  in_use: boolean;
}

const dockerSaveDb = (path: string) => {
  return `docker exec server_db_1 /usr/bin/mysqldump -u root --password=123 opium > ${path}`;
};

export const save = async () => {
  /*
  const ls = spawn("ls", ["-lh", "/databases"]);
  ls.stdout.on("data", (data) => {
    console.log("ls data -> ", data);
  });
  ls.stderr.on("data", (e) => {
    console.log("err => ", e);
  });
  */

  const data: IDatabase[] = db;
  fs.readdir(path.join(__dirname, "databases"), (err, files) => {
    console.log("error listing files => ", err);
    console.log("list dir data => ", files);
    data.map((database) => {
      if (database.in_use) {
        exec(
          dockerSaveDb(path.join(__dirname, `databases/${database.file}`)),
          (err) => {
            if (err) console.log("SOMETHING WENT WRONG => ", err);
          }
        );
      }
    });
  });
  console.log("dbs => ", db);
};
