import 'dart:convert';
import 'dart:io';

import 'package:imc_dart/classes/pessoa.dart';
import 'package:imc_dart/exceptions/invalid_name_exception.dart';
import 'package:imc_dart/exceptions/invalid_value_exception.dart';

void execute() {
  print("Calculadora de IMC");

  String nome = "";
  print("Digite o nome da pessoa:");
  do {
    try {
      nome = lerString();
    } on InvalidNameException {
      nome = "";
      print("Digite o nome da pessoa:");
    }
  } while (nome == "");

  double peso = 0.0;
  print("Digite o peso da pessoa:");
  do {
    try {
      peso = lerDouble();
    } on InvalidValueException {
      peso = 0.0;
      print("Digite o peso da pessoa:");
    }
  } while (peso == 0.0);

  double altura = 0.0;
  print("Digite a altura da pessoa:");
  do {
    try {
      altura = lerDouble();
    } on InvalidValueException {
      altura = 0.0;
      print("Digite a altura da pessoa:");
    }
  } while (altura == 0.0);

  var pessoa = Pessoa(nome, peso, altura);
  var imc = calculateIMC(pessoa);

  print("");
  print("A Pessoa com: $pessoa");
  print("IMC: $imc");
  print("Está (com): ${getClassification(imc)}");
}

double calculateIMC(Pessoa pessoa) {
  return pessoa.getPeso() / (pessoa.getAltura() * pessoa.getAltura());
}

String getClassification(double imc) {
  if (imc < 16) {
    return "Magreza grave";
  } else if (imc < 17) {
    return "Magreza moderada";
  } else if (imc < 18.5) {
    return "Magreza leve";
  } else if (imc < 25) {
    return "Saudável";
  } else if (imc < 30) {
    return "Sobrepeso";
  } else if (imc < 35) {
    return "Obesidade Grau I";
  } else if (imc < 40) {
    return "Obesidade Grau II (severa)";
  } else {
    return "Obesidade Grau III (mórbida)";
  }
}

String lerString() {
  var line = stdin.readLineSync(encoding: utf8);
  if (line == null || line == "") {
    throw InvalidNameException();
  }
  return line;
}

double lerDouble() {
  try {
    var numberString = lerString();
    var number = double.parse(numberString);
    if (number == 0) {
      throw InvalidValueException();
    }
    return number;
  } on InvalidNameException {
    throw InvalidValueException();
  } catch (e) {
    throw InvalidValueException();
  }
}
