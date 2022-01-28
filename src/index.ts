import express from "express";
import path from "path";
import { save } from "./utils/save";

(async () => {
  console.log("Momentum !");
  const app = express();

  app.get("/", (_, res) => {
    res.sendFile(path.join(__dirname, "/pages/index.html"));
  });

  app.post("/save", async (_, res) => {
    await save();
    res.json({
      status: true,
    });
  });

  app.get("/databases", (_, res) => {
    res.json([
      {
        name: "Bowl",
        in_use: false,
      },
      {
        name: "Los Polos",
        in_use: false,
      },
    ]);
  });

  app.listen(8000, () => {
    console.log("🚀 Server runing on http://localhost:8000");
  });
})();
