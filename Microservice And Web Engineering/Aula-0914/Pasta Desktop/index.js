//Executar no CMD/powershell os comandos:
//criar o arquivo index.js
//npm init
//npm i express redis

const express = require("express");
const redis = require("redis");

const app = express();
const port = 3000;

let redisClient;

(async () => {
  redisClient = redis.createClient();

  redisClient.on("error", (error) => console.error(`Error : ${error}`));

  await redisClient.connect();
})();

app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);

app.get("/", (req, res) => {
  res.json({ message: "ok" });
});


async function getProducts(req, res){
    const productId = req.params.id;
    const cacheResults = await redisClient.get(`fotos:produtos:${productId}`);
    res.json({ dados: cacheResults });
}

app.get("/produto/:id", getProducts);

async function getUsers(req, res){
    const userId = req.params.id;
    const cacheResults = await redisClient.get(`usuarios:${userId}`);
    res.json({ dados: cacheResults });
}

app.get("/usuario/:id", getUsers);
  

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});

//alterar o arquivo docker-compose.yaml
//add na linha 7
/*
    ports:
    - "6379:6379"

*/