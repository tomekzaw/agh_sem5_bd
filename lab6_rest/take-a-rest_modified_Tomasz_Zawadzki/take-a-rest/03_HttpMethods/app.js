// File 03_HttpMethods/app.js
// 
const express = require("express");
const app = express();

function printReqSummary(request) {
  console.log(`Handling ${request.method} ${request.originalUrl}`);
}

/* Store items collection in this array */
let items = [];

/* GET / -- Show main page */
app.get("/", function(request, response) {
  printReqSummary(request);
  response.send(
    `<h1>HTTP Methods</h1><ul>
      <li>Show items (GET /item)</li>
      <li>Add an item (PUT /item/:name)</li>
      <li>Remove an item (DELETE /item/:name)</li></ul>`
  );
});

/* GET /item -- Show all items from the collection */
app.get("/item", function(request, response) {
  printReqSummary(request);
  response.send(`<p>Available items: ${items.toString()}</p>`);
});

/* POST /item/:name -- add (put) new item to the collection */
app.post("/item/:name", function(request, response) {
  printReqSummary(request);
  const itemName = request.params.name;
  /* Is the item in collection? */
  if (items.includes(itemName)) {
    response.send(`<p>Item "${itemName}" already in collection</p>`);
  } else {
    items.push(itemName);
    response.send(`<p>Item "${itemName}" added successfully</p>`);
  }
});

/* PUT /item/:oldName?newName=abc -- rename item existing in the collection */
app.put("/item/:oldName", function(request, response) {
  printReqSummary(request);
  const oldItemName = request.params.oldName;
  const newItemName = request.query.newName;

  if (newItemName === undefined) {
    response.status(400);
    response.send(`<p>New item name not specified</p>`);
    return;
  }

  if (!items.includes(oldItemName)) {
    response.status(404);
    response.send(`<p>Item "${oldItemName}" doesn't exists</p>`);
  }

  items[items.indexOf(oldItemName)] = newItemName;
  response.send(`<p>Item "${oldItemName}" successfully renamed to "${newItemName}"</p>`);
});


/* DELETE /item/:name -- remove a given item from the collection */
app.delete("/item/:name", function(request, response) {
  printReqSummary(request);
  const itemName = request.params.name;
  /* Is the item in collection? */
  if (items.includes(itemName)) {
    items = items.filter(item => item !== itemName);
    response.send(`<p>Item "${itemName}" removed successfully</p>`);
  } else {
    response.send(`<p>Item "${itemName}" doesn't exists</p>`);
  }
});

app.listen(3000);
