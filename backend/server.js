const express = require('express');
const pool = require('./db'); // Import the database connection pool

const app = express();
app.use(express.json()); // Parse incoming JSON data

// Create (POST) endpoint
app.post('/items', async (req, res) => {
  try {
    const { name, description } = req.body;
    const [rows] = await pool.query('INSERT INTO items (name, description) VALUES (?, ?)', [name, description]);
    res.status(201).json({ message: `Item created with ID: ${rows.insertId}` });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Error creating item' });
  }
});

// Read All (GET) endpoint
app.get('/items', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM items');
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Error fetching items' });
  }
});

// Read One (GET by ID) endpoint
app.get('/items/:id', async (req, res) => {
  try {
    const id = parseInt(req.params.id); // Ensure ID is an integer
    const [rows] = await pool.query('SELECT * FROM items WHERE id = ?', [id]);
    if (rows.length === 0) {
      return res.status(404).json({ message: 'Item not found' });
    }
    res.json(rows[0]); // Return the first item (assuming unique ID)
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Error fetching item' });
  }
});

// Update (PUT) endpoint
app.put('/items/:id', async (req, res) => {
  try {
    const id = parseInt(req.params.id);
    const { name, description } = req.body;
    const [rows] = await pool.query('UPDATE items SET name = ?, description = ? WHERE id = ?', [name, description, id]);
    if (rows.affectedRows === 0) {
      return res.status(404).json({ message: 'Item not found' });
    }
    res.json({ message: `Item updated with ID: ${id}` });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Error updating item' });
  }
});

// Delete (DELETE) endpoint
app.delete('/items/:id', async (req, res) => {
  try {
    const id = parseInt(req.params.id);
    const [rows] = await pool.query('DELETE FROM items WHERE id = ?', [id]);
    if (rows.affectedRows === 0) {
      return res.status(404).json({ message: 'Item not found' });
    }
    res.json({ message: `Item deleted with ID: ${id}` });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Error deleting item' });
  }
});


app.post('/villagers', async (req, res) => {
  try {
    const { name, address, gender, dob, land_holding, family_id, income } = req.body;
    const [rows] = await pool.query('INSERT INTO villager (name, address, gender, dob, land_holding, family_id, income) VALUES (?, ?, ?, ?, ?, ?, ?)', 
    [name, address, gender, dob, land_holding, family_id, income]);
    res.status(201).json({ message: `Villager created with ID: ${rows.insertId}` });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Error creating villager' });
  }
});

// Read All (GET) endpoint
app.get('/villagers', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM villager');
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Error fetching villagers' });
  }
});

// Read One (GET by ID) endpoint
app.get('/villagers/:id', async (req, res) => {
  try {
    const id = parseInt(req.params.id); // Ensure ID is an integer
    const [rows] = await pool.query('SELECT * FROM villager WHERE id = ?', [id]);
    if (rows.length === 0) {
      return res.status(404).json({ message: 'Villager not found' });
    }
    res.json(rows[0]); // Return the first villager (assuming unique ID)
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Error fetching villager' });
  }
});

// Update (PUT) endpoint
app.put('/villagers/:id', async (req, res) => {
  try {
    const id = parseInt(req.params.id);
    const { name, address, gender, dob, land_holding, family_id, income } = req.body;
    const [rows] = await pool.query('UPDATE villager SET name = ?, address = ?, gender = ?, dob = ?, land_holding = ?, family_id = ?, income = ? WHERE id = ?', 
    [name, address, gender, dob, land_holding, family_id, income, id]);
    if (rows.affectedRows === 0) {
      return res.status(404).json({ message: 'Villager not found' });
    }
    res.json({ message: `Villager updated with ID: ${id}` });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Error updating villager' });
  }
});

// Delete (DELETE) endpoint
app.delete('/villagers/:id', async (req, res) => {
  try {
    const id = parseInt(req.params.id);
    const [rows] = await pool.query('DELETE FROM villager WHERE id = ?', [id]);
    if (rows.affectedRows === 0) {
      return res.status(404).json({ message: 'Villager not found' });
    }
    res.json({ message: `Villager deleted with ID: ${id}` });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Error deleting villager' });
  }
});

// Start the server
const port = process.env.PORT || 3001; // Use environment variable for port or default to 3001
app.listen(port, () => console.log(`Server listening on port ${port}`));
