import 'package:flutter/material.dart';
import 'formulario.dart';
import '../../models/contato.dart';

class ListaContatos extends StatefulWidget {
  final List<Contato> _contatos = [];
  @override
  State<StatefulWidget> createState() {
    return ListaContatosState();
  }
}

class ListaContatosState extends State<ListaContatos> {
  static const _tituloAppBar = 'Meus Contatos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: widget._contatos.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.contacts_outlined,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Nenhum contato adicionado',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: widget._contatos.length,
              itemBuilder: (context, indice) {
                final contato = widget._contatos[indice];
                return ItemContato(contato);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioContato();
              },
            ),
          ).then((contatoRecebido) => _atualiza(contatoRecebido));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _atualiza(Contato? contatoRecebido) {
    if (contatoRecebido != null) {
      setState(() {
        widget._contatos.add(contatoRecebido);
      });
    }
  }
}

class ItemContato extends StatelessWidget {
  final Contato _contato;

  ItemContato(this._contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(_contato.nome),
        subtitle: Text(_contato.telefone),
        trailing: Text(
          _contato.email,
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
