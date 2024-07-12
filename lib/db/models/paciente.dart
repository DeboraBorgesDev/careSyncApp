class Paciente {
  final String id;
  final String nome;
  final String cpf;
  final String dataNascimento;

  Paciente({
    required this.id,
    required this.nome,
    required this.cpf,
    required this.dataNascimento,
  });

  factory Paciente.fromJson(Map<String, dynamic> json) {
    return Paciente(
      id: json['id'],
      nome: json['nome'],
      cpf: json['cpf'],
      dataNascimento: json['dataNascimento'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'cpf': cpf,
      'dataNascimento': dataNascimento,
    };
  }

    factory Paciente.fromMap(Map<String, dynamic> map) {
    return Paciente(
      id: map['id'],
      nome: map['nome'],
      cpf: map['cpf'],
      dataNascimento:  map['dataNascimento']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'cpf': cpf,
      'dataNascimento': dataNascimento
    };
  }

  
}

