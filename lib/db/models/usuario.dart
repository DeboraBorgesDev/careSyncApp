class User {
  String id;
  String nome;
  String email;
  String senha;
  String token;

  User({
    required this.id,
    required this.nome,
    required this.email,
    required this.senha,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      senha: json['senha'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'senha': senha,
      'token': token,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, nome: $nome, email: $email, senha: $senha, token: $token}';
  }
}
