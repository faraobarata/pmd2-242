import 'dart:async';
import 'dart:isolate';

void main() async {
  print('Pedro de Almeida'); // Print da string adicionada

  // Criando um isolate para executar uma operação assíncrona
  final receivePort = ReceivePort();
  await Isolate.spawn(doAsyncOperation, receivePort.sendPort);

  // Executando outras tarefas enquanto aguarda a conclusão da operação assíncrona
  print('Iniciando outras tarefas...');
  await Future.delayed(Duration(seconds: 1));
  print('Continuando outras tarefas...');

  // Recebendo o resultado da operação assíncrona
  final result = await receivePort.first;
  print('Resultado: $result');
}

void doAsyncOperation(SendPort sendPort) async {
  // Substitui a leitura de um arquivo por uma string fixa
  final result = 'Pedro de Almeida';
  sendPort.send(result);
}
