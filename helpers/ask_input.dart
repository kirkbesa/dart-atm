import 'dart:io';

String? AskInput([String? prompt]) {
  // String? input = stdin.readLineSync();

  // if (input == '') {
  //   print('No Input Detected!');
  //   AskInput();
  // }

  // return input;
  if (prompt != null) {
    stdout.write('$prompt: ');
  }
  return stdin.readLineSync();
}