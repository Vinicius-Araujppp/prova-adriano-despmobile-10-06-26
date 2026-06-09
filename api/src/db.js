const { Pool } = require('pg');

const connectionString = process.env.DATABASE_URL;

if (!connectionString) {
  throw new Error('Defina a variavel DATABASE_URL para conectar no PostgreSQL.');
}

const pool = new Pool({
  connectionString,
  ssl: process.env.NODE_ENV === 'production'
    ? { rejectUnauthorized: false }
    : false,
});

async function criarTabelaContatos() {
  await pool.query(`
    CREATE TABLE IF NOT EXISTS contatos (
      id SERIAL PRIMARY KEY,
      nome VARCHAR(120) NOT NULL,
      telefone VARCHAR(30) NOT NULL,
      email VARCHAR(160) NOT NULL,
      criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
      atualizado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
  `);
}

module.exports = {
  pool,
  criarTabelaContatos,
};
