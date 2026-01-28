const express = require('express');
const app = express();
app.use(express.json());

let db = {
  id: 0,
  status: null,
  version: 0,
  history: []
};

app.post('/setStatus', (req, res) => {
  const { status, version } = req.body;
  if (!status || !version || isNaN(version)) {
      return res.status(400).json({ error: 'Invalid or missing parameters!' });
  }

  db.id = Date.now();
  db.status = status;
  db.version = Math.abs(
      parseFloat(
          String(version).trim().replace(/^["']|["']$/g, '')
      )
  );

  db.history.push({
    id: db.id,
    status: db.status,
    version: db.version
  });

  res.json({
    message: 'Status CREATED!',
    data: db
  });
});

app.patch('/updateStatus', (req, res) => {
  const { id, version } = req.body;
  if (!id || isNaN(id) || !version || isNaN(version)) {
      return res.status(400).json({ error: 'Invalid or missing parameters!' });
  }

  const idStatus = Math.abs(
      parseFloat(
          String(id).trim().replace(/^["']|["']$/g, '')
      )
  );
  if (idStatus !== db.id) {
      return res.status(404).json({ error: 'Resource with this id NOT FOUND!' });
  }

  db.version = parseFloat(
      String(version).trim().replace(/^["']|["']$/g, '')
  );

  db.history.push({
    id: db.id,
    status: db.status,
    version: db.version
  });

  res.json({
    message: 'Version UPGRADED!',
    data: db
  });
});

app.put('/rewriteStatus', (req, res) => {
  const { id, status, version } = req.body;
  if (!id || isNaN(id) || !status || !version || isNaN(version)) {
      return res.status(400).json({ error: 'Invalid or missing parameters!' });
  }

  const idStatus = Math.abs(
      parseFloat(
          String(id).trim().replace(/^["']|["']$/g, '')
      )
  );
  if (idStatus !== db.id) {
      return res.status(404).json({ error: 'Resource with this id NOT FOUND!' });
  }

  db.status = status;
  db.version = version;

  db.history.push({
    id: db.id,
    status: db.status,
    version: db.version
  });

  res.json({
    message: 'Status REWRITED!',
    data: db
  });
});

app.post('/rollbackStatusVersion', (req, res) => {
  const { id } = req.body;
  if (!id || isNaN(id)) {
      return res.status(400).json({ error: 'Invalid or missing id!' });
  }

  const idStatus = Math.abs(
      parseFloat(
          String(id).trim().replace(/^["']|["']$/g, '')
      )
  );
  if (idStatus !== db.id) {
      return res.status(404).json({ error: 'Resource with this id NOT FOUND!' });
  }

  if (!db.history.length) {
      return res.status(409).json({ error: 'No history to rollback!' });
  }

  const found = db.history[0];
  db.status = found.status;
  db.version = found.version;

  db.history.push({
    id: db.id,
    status: db.status,
    version: db.version
  });

  res.json({
    message: 'RolledBack to FIRST status SUCCESSFULLY!',
    data: db
  });
});

app.delete('/removeStatus', (req, res) => {
  const { id } = req.body;
  if (!id || isNaN(id)) {
      return res.status(400).json({ error: 'Invalid or missing id!' });
  }

  const idStatus = Math.abs(
      parseFloat(
          String(id).trim().replace(/^["']|["']$/g, '')
      )
  );
  if (idStatus !== db.id) {
      return res.status(404).json({ error: 'Resource with this id NOT FOUND!' });
  }

  db = {
    status: null,
    version: 0,
    history: []
  };

  res.json({
    message: 'Status REMOVED!'
  });
});

app.get('/status', (req, res) => {
  if (!db.id) {
      return res.status(404).json({ error: 'No Status' });
  }

  res.json({
    message: 'Status FOUND!',
    data: db
  });
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});