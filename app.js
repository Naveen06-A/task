const express = require('express');
const app = express();
const port = 3000;

// Serve static files (CSS, images)
app.use(express.static('public'));

// Route for the home page
app.get('/', (req, res) => {
    res.sendFile(__dirname + '/views/index.html');
});

// Start the server
app.listen(port, () => {
    console.log(`App running at http://localhost:${port}`);
});