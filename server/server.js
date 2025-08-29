const express = require('express');
const path = require('path');

const app = express();
const port = process.env.PORT || 5000;

// An api endpoint that returns a short list of items
app.get('/api/getList', (req,res) => {
    var list = ["item1", "item2", "item3"];
    res.json(list);
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
