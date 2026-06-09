const express = require('express');
const contatoController = require('../controllers/contatoController');

const router = express.Router();

router.get('/', contatoController.listar);
router.get('/:id', contatoController.buscarPorId);
router.post('/', contatoController.cadastrar);
router.put('/:id', contatoController.atualizar);
router.delete('/:id', contatoController.deletar);

module.exports = router;
