const express = require('express');
const app = express();
const port = process.env.PORT || 3082;

// Middleware to serve static files
app.use(express.static('public'));

// Basic route
app.get('/', (req, res) => {
  res.send('Hello, world!');
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
