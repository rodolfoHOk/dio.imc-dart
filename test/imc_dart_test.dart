import 'package:imc_dart/classes/pessoa.dart';
import 'package:imc_dart/imc_dart.dart' as imc;
import 'package:test/test.dart';

void main() {
  group('calculate imc', () {
    var valuesToTest = {
      {'nome': 'Test 1', 'peso': 37, 'altura': 1.55}: 15,
      {'nome': 'Test 2', 'peso': 37, 'altura': 1.50}: 16,
      {'nome': 'Test 3', 'peso': 42, 'altura': 1.50}: 18,
      {'nome': 'Test 4', 'peso': 65, 'altura': 1.70}: 22,
      {'nome': 'Test 5', 'peso': 80, 'altura': 1.70}: 27,
      {'nome': 'Test 6', 'peso': 95, 'altura': 1.70}: 32,
      {'nome': 'Test 7', 'peso': 110, 'altura': 1.70}: 38,
      {'nome': 'Test 8', 'peso': 130, 'altura': 1.70}: 44,
    };

    valuesToTest.forEach((values, expected) {
      test('Name: ${values['nome']} Esperado: $expected', () {
        Pessoa pessoa = Pessoa(
            values['nome'].toString(),
            double.parse(values['peso'].toString()),
            double.parse(values['altura'].toString()));
        expect(imc.calculateIMC(pessoa).floor(), equals(expected));
      });
    });
  });

  group('calculate imc', () {
    var valuesToTest = {
      15: 'Magreza grave',
      16: 'Magreza moderada',
      18: 'Magreza leve',
      22: 'Saudável',
      27: 'Sobrepeso',
      32: 'Obesidade Grau I',
      38: 'Obesidade Grau II (severa)',
      44: 'Obesidade Grau III (mórbida)',
    };

    valuesToTest.forEach((value, expected) {
      test('Esperado: $expected', () {
        expect(imc.getClassification(double.parse(value.toString())),
            equals(expected.toString()));
      });
    });
  });
}
