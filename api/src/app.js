const cors = require('cors');
const express = require('express');
const contatoRoutes = require('./routes/contatoRoutes');

const app = express();

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
  res.json({
    mensagem: 'API de contatos online',
    rotas: ['/contatos'],
  });
});

app.get('/health', (req, res) => {
  res.json({ status: 'ok' });
});

app.use('/contatos', contatoRoutes);

app.use((req, res) => {
  res.status(404).json({ erro: 'Rota nao encontrada.' });
});

app.use((error, req, res, next) => {
  console.error(error);
  res.status(500).json({ erro: 'Erro interno no servidor.' });
});

module.exports = app;
