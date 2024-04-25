//Enumeração para representar as diferentes faixas de IMC.
enum FaixaIMC {
  AbaixoIdeal,
  PesoIdeal,
  AcimaIdeal,
  ObesidadeI,
  ObesidadeII,
  ObesidadeIII,
}

// Extensão aplicada à enumeração FaixaIMC, para 
// adicionar propriedade de descrição.
extension FaixaIMCExt on FaixaIMC {
  String get descricao {
    switch (this) {
      case FaixaIMC.AbaixoIdeal:
        return 'Abaixo do Peso';
      case FaixaIMC.PesoIdeal:
        return 'Peso Ideal';
      case FaixaIMC.AcimaIdeal:
        return 'Acima do Peso'; 
      case FaixaIMC.ObesidadeI:
        return 'Obesidade Grau I';               
      case FaixaIMC.ObesidadeII:
        return 'Obesidade Grau II';
      case FaixaIMC.ObesidadeIII:
        return 'Obesidade Grau III';      
      default:
        return "";
    }
  }
}

class IMC {
  final double peso;
  final double altura;

  IMC({required this.peso, required this.altura});

  double get imc {
    return peso / (altura * altura);
  }

  FaixaIMC get faixa {
    double valueIMC = this.imc;

    if (valueIMC < 18.6)
      return FaixaIMC.AbaixoIdeal;
    if (valueIMC >= 18.6 && valueIMC < 24.9)
      return FaixaIMC.PesoIdeal;
    if (valueIMC >= 24.9 && valueIMC < 29.9)
      return FaixaIMC.AcimaIdeal;
    if (valueIMC >= 29.9 && valueIMC < 34.9)
      return FaixaIMC.ObesidadeI;
    if (valueIMC >= 34.9 && valueIMC < 39.9)
      return FaixaIMC.ObesidadeII;
    if (valueIMC >= 40) return FaixaIMC.ObesidadeIII;

    return FaixaIMC.AbaixoIdeal; // Necessário fornecer um valor padrão aqui
  }
}