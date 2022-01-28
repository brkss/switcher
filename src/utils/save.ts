import { spawn } from "child_process";
import fs from "fs";
import db from "./db.json";
import path from "path";

interface IDatabase {
  name: string;
  file: string;
  in_use: boolean;
}

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
  fs.readdir(path.join(__dirname, "databases"), (err, files) => {
    console.log("error listing files => ", err);
    console.log("list dir data => ", files);
  });
  const data: IDatabase[] = db;
  data.map((database) => {});
  console.log("dbs => ", db);
};
