import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:aescrypto/aescrypto.dart';

import 'constants.dart';

Future<Map<String, dynamic>> load() async {
  return jsonDecode(
    await File(Locations.dataFile).readAsString(),
  );
}

Future<Uint8List> encrypt(String key, Map<String, dynamic> data) async {
  final AESCrypto cipher = AESCrypto(key: key);

  return cipher.encryptText(
    plainText: jsonEncode(data),
    hasKey: true,
  );
}

Future<void> dump(Uint8List data) async {
  final File outputFile = File(Locations.outputFile);

  final String result = jsonEncode({"data": data});
  await outputFile.writeAsString(result);
}
