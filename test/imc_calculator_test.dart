import 'package:imc_calculator/imc_calculator.dart';
import 'package:test/test.dart';

void main() {
  test('Teste do cálculo de IMC', () {
    // Preparar
    final pessoa = Pessoa("João", 70, 1.75);

    // Executar
    final imc = calcularIMC(pessoa);

    // Verificar
    expect(imc, closeTo(22.86, 0.01)); // Valor esperado e margem de erro
  });

  test('Teste da interpretação do IMC', () {
    // Verificar a interpretação de diferentes valores de IMC
    expect(interpretarIMC(14), "Magreza grave");
    expect(interpretarIMC(16.7), "Magreza moderada");
    expect(interpretarIMC(17.7), "Magreza leve");
    expect(interpretarIMC(22), "Saudável");
    expect(interpretarIMC(27), "Sobrepeso");
    expect(interpretarIMC(31), "Obesidade Grau I");
    expect(interpretarIMC(37), "Obesidade Grau II (severa)");
    expect(interpretarIMC(55), "Obesidade Grau III (mórbida)");
  });
}
