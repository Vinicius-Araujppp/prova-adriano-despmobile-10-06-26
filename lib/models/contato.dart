class Contato {
  final String nome;
  final String telefone;
  final String email;

  Contato(this.nome, this.telefone, this.email);

  @override
  String toString() {
    return "Contato{nome: $nome, telefone: $telefone, email: $email}";
  }
}
