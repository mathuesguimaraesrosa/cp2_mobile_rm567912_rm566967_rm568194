class pet {
  String nome;
  String especie;
  int idade;
  double peso;

  pet(this.nome, this.especie, this.idade, this.peso);

  void exibirFicha() {
    print(
      '${this.nome} (${this.especie}) - $idade anos - $peso kg - ${(this.idade <= 1)
          ? "Filhote"
          : (this.idade <= 7)
          ? "Adulto"
          : "Idoso"}',
    );
  }

  void fazerAniversario() {
    this.idade += 1;
    print("Feliz aniversário, $nome! Agora com $idade anos");
  }
}

void main() {
  List<pet> pets = [
    pet("Thor", "cachorro", 3, 28.5),
    pet("Mia", "gato", 1, 4.2),
    pet("Bob", "cachorro", 9, 1.8),
    pet("Nina", "coelho", 2, 1.8)
  ];

  for (pet i in pets) {
    i.exibirFicha();
  }

  pets[1].fazerAniversario();
  pets[1].exibirFicha();

  int numeroPetMaiorPeso = -1;
  for (int i = 0; i < pets.length; i++) {
    double maiorPeso = 0;
    if (pets[i].peso > maiorPeso) {
      maiorPeso = pets[i].peso;
      numeroPetMaiorPeso = i;
    }
  }

  pets[numeroPetMaiorPeso].exibirFicha();
  print("Pet mais pesado: ${pets[numeroPetMaiorPeso].nome} (${pets[numeroPetMaiorPeso].peso})");
}
