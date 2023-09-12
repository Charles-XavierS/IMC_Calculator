import 'dart:io';

class Pessoa {
  String nome;
  double peso;
  double altura;

  Pessoa(this.nome, this.peso, this.altura);
}

double calcularIMC(Pessoa pessoa) {
  return pessoa.peso / (pessoa.altura * pessoa.altura);
}

String interpretarIMC(double imc) {
  final imcResultados = {
    "Magreza grave": (imc) => imc < 16,
    "Magreza moderada": (imc) => imc >= 16 && imc < 17,
    "Magreza leve": (imc) => imc >= 17 && imc < 18.5,
    "Saudável": (imc) => imc >= 18.5 && imc < 25,
    "Sobrepeso": (imc) => imc >= 25 && imc < 30,
    "Obesidade Grau I": (imc) => imc >= 30 && imc < 35,
    "Obesidade Grau II (severa)": (imc) => imc >= 35 && imc < 40,
    "Obesidade Grau III (mórbida)": (imc) => imc >= 40,
  };

  for (var resultado in imcResultados.keys) {
    if (imcResultados[resultado]!(imc)) {
      return resultado;
    }
  }

  return "Valor de IMC não reconhecido";
}

void main() {
  print("Calculadora de IMC");

  try {
    stdout.write("Digite seu nome: ");
    String nome = stdin.readLineSync()!;

    stdout.write("Digite seu peso em quilogramas (exemplo: 75.3): ");
    double peso = double.parse(stdin.readLineSync()!);

    stdout.write("Digite sua altura em metros (exemplo: 1.75): ");
    double altura = double.parse(stdin.readLineSync()!);

    Pessoa pessoa = Pessoa(nome, peso, altura);
    double imc = calcularIMC(pessoa);

    // Formatando o resultado para duas casas decimais
    String resultadoFormatado = imc.toStringAsFixed(2);

    String resultado = interpretarIMC(imc);

    print("$nome, seu IMC é: $resultadoFormatado");
    print("Resultado: $resultado");
  } catch (e) {
    print(
        "Ocorreu um erro ao ler os dados. Certifique-se de fornecer valores válidos.");
  }
}
