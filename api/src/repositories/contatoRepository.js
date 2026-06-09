const { pool } = require('../db');

async function listar() {
  const result = await pool.query(
    'SELECT id, nome, telefone, email FROM contatos ORDER BY nome ASC'
  );
  return result.rows;
}

async function buscarPorId(id) {
  const result = await pool.query(
    'SELECT id, nome, telefone, email FROM contatos WHERE id = $1',
    [id]
  );
  return result.rows[0] || null;
}

async function cadastrar(contato) {
  const result = await pool.query(
    `INSERT INTO contatos (nome, telefone, email)
     VALUES ($1, $2, $3)
     RETURNING id, nome, telefone, email`,
    [contato.nome, contato.telefone, contato.email]
  );
  return result.rows[0];
}

async function atualizar(id, contato) {
  const result = await pool.query(
    `UPDATE contatos
     SET nome = $1,
         telefone = $2,
         email = $3,
         atualizado_em = CURRENT_TIMESTAMP
     WHERE id = $4
     RETURNING id, nome, telefone, email`,
    [contato.nome, contato.telefone, contato.email, id]
  );
  return result.rows[0] || null;
}

async function deletar(id) {
  const result = await pool.query(
    'DELETE FROM contatos WHERE id = $1 RETURNING id',
    [id]
  );
  return result.rowCount > 0;
}

module.exports = {
  listar,
  buscarPorId,
  cadastrar,
  atualizar,
  deletar,
};
