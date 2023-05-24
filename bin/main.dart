import 'dart:io';

import 'package:walletika_data_builder/constants.dart';
import 'package:walletika_data_builder/utils.dart' as builder;

void main(List<String> arguments) async {
  final String encryptionKey;
  final Map<String, dynamic> data;

  try {
    encryptionKey = arguments.first;
  } catch (_) {
    print("[ - ] Enter the encryption key");
    return;
  }

  try {
    data = await builder.load();
  } on PathNotFoundException {
    print("[ - ] ${Locations.dataFile} not found");
    return;
  }

  await builder.dump(
    await builder.encrypt(encryptionKey, data),
  );

  print(
    "[ + ] Completed successfully, The output file in ${Locations.outputFile}",
  );
}
