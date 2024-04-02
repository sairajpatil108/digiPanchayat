const express = require('express');
const pool = require('./db');

const app = express();
app.use(express.json());


function calculateAge(birthday) {
  const today = new Date();
  const birthDate = new Date(birthday);
  let age = today.getFullYear() - birthDate.getFullYear();
  const monthDiff = today.getMonth() - birthDate.getMonth();
  if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthDate.getDate())) {
    age--;
  }
  return age;
}


// Create (POST) endpoint for events
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

// Read All (GET) endpoint for events
app.get('/items', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM items');
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Error fetching items' });
  }
});

// Read One (GET by ID) endpoint for events
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

// Update (PUT) endpoint for events
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

// Delete (DELETE) endpoint for events
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

// Create (POST) endpoint for villagers
app.post('/villagers', async (req, res) => {
  try {
    const { name, address, gender, dob, phone, email, land_holding, family_id, income } = req.body;
    const [rows] = await pool.query('INSERT INTO villager (name, address, gender, dob, phone, email, land_holding, family_id, income) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [name, address, gender, dob, phone, email, land_holding, family_id, income]);
    res.status(201).json({ message: `Villager created with ID: ${rows.insertId}` });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Error creating villager' });
  }
});

// Read All (GET) endpoint for villagers
app.get('/villagers', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM villager');
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Error fetching villagers' });
  }
});

// Read One (GET by ID) endpoint for villagers
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

// Update (PUT) endpoint for villagers
app.put('/villagers/:id', async (req, res) => {
  try {
    const id = parseInt(req.params.id);
    const { name, address, gender, dob, phone, email, land_holding, family_id, income } = req.body;
    const [rows] = await pool.query('UPDATE villager SET name = ?, address = ?, gender = ?, dob = ?, phone = ?, email = ?, land_holding = ?, family_id = ?, income = ? WHERE id = ?',
      [name, address, gender, dob, phone, email, land_holding, family_id, income, id]);
    if (rows.affectedRows === 0) {
      return res.status(404).json({ message: 'Villager not found' });
    }
    res.json({ message: `Villager updated with ID: ${id}` });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Error updating villager' });
  }
});

// Delete (DELETE) endpoint for villagers
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

// Get statistics endpoint
app.get('/statistics', async (req, res) => {
  try {
    const [totalVillagersRows] = await pool.query('SELECT COUNT(*) AS total_villagers FROM villager');
    const [maleRows] = await pool.query('SELECT COUNT(*) AS male_villagers FROM villager WHERE gender = "Male" OR gender = "M" ');
    const [femaleRows] = await pool.query('SELECT COUNT(*) AS female_villagers FROM villager WHERE gender = "Female" OR gender = "F" ');
    const [totalFamiliesRows] = await pool.query('SELECT COUNT(DISTINCT family_id) AS total_families FROM villager');

    const statistics = {
      total_villagers: totalVillagersRows[0].total_villagers,
      male_villagers: maleRows[0].male_villagers,
      female_villagers: femaleRows[0].female_villagers,
      total_families: totalFamiliesRows[0].total_families
    };

    res.json(statistics);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Error fetching statistics' });
  }
});


// Get statistics endpoint for taxpayers
app.get('/taxpayers/statistics', async (req, res) => {
  try {
    const [totalTaxpayersRows] = await pool.query('SELECT COUNT(*) AS total_taxpayers FROM tax_payer');
    const [pendingWaterTaxRows] = await pool.query('SELECT COUNT(*) AS pending_water_tax FROM tax_payer WHERE water_tax = 0');
    const [pendingPropertyTaxRows] = await pool.query('SELECT COUNT(*) AS pending_property_tax FROM tax_payer WHERE property_tax = 0');
    const [pendingBothTaxesRows] = await pool.query('SELECT COUNT(*) AS pending_both_taxes FROM tax_payer WHERE water_tax = 0 AND property_tax = 0');

    const statistics = {
      total_taxpayers: totalTaxpayersRows[0].total_taxpayers,
      pending_water_tax: pendingWaterTaxRows[0].pending_water_tax,
      pending_property_tax: pendingPropertyTaxRows[0].pending_property_tax,
      pending_both_taxes: pendingBothTaxesRows[0].pending_both_taxes
    };

    res.json(statistics);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Error fetching taxpayer statistics' });
  }
});



// Create (POST) endpoint for taxpayers
app.post('/taxpayers', async (req, res) => {
  try {
    const { name, water_tax, property_tax, house_number } = req.body;
    const [rows] = await pool.query('INSERT INTO tax_payer (name, water_tax, property_tax, house_number) VALUES (?, ?, ?, ?)',
      [name, water_tax, property_tax, house_number]);
    res.status(201).json({ message: `Taxpayer created with ID: ${rows.insertId}` });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Error creating taxpayer' });
  }
});

// Read All (GET) endpoint for taxpayers
app.get('/taxpayers', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM tax_payer');
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Error fetching taxpayers' });
  }
});

// Read One (GET by ID) endpoint for taxpayers
app.get('/taxpayers/:id', async (req, res) => {
  try {
    const id = parseInt(req.params.id);
    const [rows] = await pool.query('SELECT * FROM tax_payer WHERE tax_id = ?', [id]);
    if (rows.length === 0) {
      return res.status(404).json({ message: 'Taxpayer not found' });
    }
    res.json(rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Error fetching taxpayer' });
  }
});

// Update (PUT) endpoint for taxpayers
app.put('/taxpayers/:id', async (req, res) => {
  try {
    const id = parseInt(req.params.id);
    const { name, water_tax, property_tax, house_number } = req.body;
    const [rows] = await pool.query('UPDATE tax_payer SET name = ?, water_tax = ?, property_tax = ?, house_number = ? WHERE tax_id = ?',
      [name, water_tax, property_tax, house_number, id]);
    if (rows.affectedRows === 0) {
      return res.status(404).json({ message: 'Taxpayer not found' });
    }
    res.json({ message: `Taxpayer updated with ID: ${id}` });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Error updating taxpayer' });
  }
});

// Delete (DELETE) endpoint for taxpayers
app.delete('/taxpayers/:id', async (req, res) => {
  try {
    const id = parseInt(req.params.id);
    const [rows] = await pool.query('DELETE FROM tax_payer WHERE tax_id = ?', [id]);
    if (rows.affectedRows === 0) {
      return res.status(404).json({ message: 'Taxpayer not found' });
    }
    res.json({ message: `Taxpayer deleted with ID: ${id}` });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Error deleting taxpayer' });
  }
});

// Start the server
const port = process.env.PORT || 3001; // Use environment variable for port or default to 3001
app.listen(port, () => console.log(`Server listening on port ${port}`));
