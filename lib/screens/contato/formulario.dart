import 'package:flutter/material.dart';
import '../../components/editor.dart';
import '../../models/contato.dart';

class FormularioContato extends StatefulWidget {
  final TextEditingController _controladorCampoNome =
      TextEditingController();
  final TextEditingController _controladorCampoTelefone =
      TextEditingController();
  final TextEditingController _controladorCampoEmail =
      TextEditingController();

  @override
  State<StatefulWidget> createState() {
    return FormularioContatoState();
  }
}

class FormularioContatoState extends State<FormularioContato> {
  static const _tituloAppBar = 'Adicionar Contato';
  static const _rotuloNome = 'Nome';
  static const _dicaNome = 'Ex: João Silva';
  static const _rotuloTelefone = 'Telefone';
  static const _dicaTelefone = '(11) 99999-9999';
  static const _rotuloEmail = 'Email';
  static const _dicaEmail = 'exemplo@email.com';
  static const _textBotaoConfirmar = 'Salvar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: widget._controladorCampoNome,
              rotulo: _rotuloNome,
              dica: _dicaNome,
              icone: Icons.person,
            ),
            Editor(
              controlador: widget._controladorCampoTelefone,
              rotulo: _rotuloTelefone,
              dica: _dicaTelefone,
              icone: Icons.phone,
              tipoTeclado: TextInputType.phone,
            ),
            Editor(
              controlador: widget._controladorCampoEmail,
              rotulo: _rotuloEmail,
              dica: _dicaEmail,
              icone: Icons.email,
              tipoTeclado: TextInputType.emailAddress,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                child: Text(_textBotaoConfirmar),
                onPressed: () {
                  _criaContato(
                    context,
                    widget._controladorCampoNome,
                    widget._controladorCampoTelefone,
                    widget._controladorCampoEmail,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _criaContato(
  BuildContext context,
  TextEditingController controladorCampoNome,
  TextEditingController controladorCampoTelefone,
  TextEditingController controladorCampoEmail,
) {
  final String nome = controladorCampoNome.text;
  final String telefone = controladorCampoTelefone.text;
  final String email = controladorCampoEmail.text;

  if (nome.isNotEmpty && telefone.isNotEmpty && email.isNotEmpty) {
    final contatoCriado = Contato(nome, telefone, email);
    debugPrint("Criando Contato...");
    debugPrint("$contatoCriado");
    Navigator.pop(context, contatoCriado);
  }
}
