import { exec } from "child_process";
import fs from "fs";
import db from "./db.json";
import path from "path";

interface IDatabase {
  name: string;
  file: string;
  in_use: boolean;
}

const dockerSaveDB = (path: string) => {
  return `docker exec server_db_1 /usr/bin/mysqldump -u root --password=${process.env.ROOT_PASSWORD} opium > ${path}`;
};

const dockerRestoreDB = (path: string) => {
  return `cat ${path} | docker exec -i server_db_1 /usr/bin/mysql -u root --password=${process.env.ROOT_PASSWORD} DATABASE`;
};

export const save = async () => {
  const data: IDatabase[] = db;
  fs.readdir(path.join(__dirname, "databases"), (err, files) => {
    console.log("error listing files => ", err);
    console.log("list dir data => ", files);
    data.map((database) => {
      if (database.in_use) {
        exec(
          dockerSaveDB(path.join(__dirname, `databases/${database.file}`)),
          (err) => {
            if (err) console.log("SOMETHING WENT WRONG => ", err);
          }
        );
      }
    });
  });
  console.log("dbs => ", db);
};

export const change = async (file: string) => {
  const data: IDatabase[] = db;
  await save();
  for (let d of data) {
    if (d.file == file) {
      exec(
        dockerRestoreDB(path.join(__dirname, `databases/${file}`)),
        (err) => {
          console.log("Error accured while restaurng database => ", err);
        }
      );
    }
  }
};

export const list = () => {
  return db;
};
