const contatoRepository = require('../repositories/contatoRepository');

function validarContato(body) {
  const nome = String(body.nome || '').trim();
  const telefone = String(body.telefone || '').trim();
  const email = String(body.email || '').trim();

  if (!nome || !telefone || !email) {
    return {
      erro: 'Nome, telefone e email sao obrigatorios.',
    };
  }

  return {
    contato: { nome, telefone, email },
  };
}

async function listar(req, res, next) {
  try {
    const contatos = await contatoRepository.listar();
    res.json(contatos);
  } catch (error) {
    next(error);
  }
}

async function buscarPorId(req, res, next) {
  try {
    const contato = await contatoRepository.buscarPorId(req.params.id);

    if (!contato) {
      return res.status(404).json({ erro: 'Contato nao encontrado.' });
    }

    return res.json(contato);
  } catch (error) {
    return next(error);
  }
}

async function cadastrar(req, res, next) {
  try {
    const { contato, erro } = validarContato(req.body);

    if (erro) {
      return res.status(400).json({ erro });
    }

    const contatoCriado = await contatoRepository.cadastrar(contato);
    return res.status(201).json(contatoCriado);
  } catch (error) {
    return next(error);
  }
}

async function atualizar(req, res, next) {
  try {
    const { contato, erro } = validarContato(req.body);

    if (erro) {
      return res.status(400).json({ erro });
    }

    const contatoAtualizado = await contatoRepository.atualizar(
      req.params.id,
      contato
    );

    if (!contatoAtualizado) {
      return res.status(404).json({ erro: 'Contato nao encontrado.' });
    }

    return res.json(contatoAtualizado);
  } catch (error) {
    return next(error);
  }
}

async function deletar(req, res, next) {
  try {
    const deletado = await contatoRepository.deletar(req.params.id);

    if (!deletado) {
      return res.status(404).json({ erro: 'Contato nao encontrado.' });
    }

    return res.status(204).send();
  } catch (error) {
    return next(error);
  }
}

module.exports = {
  listar,
  buscarPorId,
  cadastrar,
  atualizar,
  deletar,
};
