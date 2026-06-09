require('dotenv').config();

const app = require('./app');
const { criarTabelaContatos } = require('./db');

const port = process.env.PORT || 3000;

async function iniciarServidor() {
  await criarTabelaContatos();

  app.listen(port, () => {
    console.log(`API de contatos rodando na porta ${port}`);
  });
}

iniciarServidor().catch((error) => {
  console.error('Erro ao iniciar API:', error);
  process.exit(1);
});
