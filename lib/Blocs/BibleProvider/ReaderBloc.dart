import 'dart:async';



printFileContent() {
  Future<String> fileContent = downloadFile();
  print("The content of the file is: $fileContent");
}

Future<String> downloadFile() {
  Future<String> result = Future.delayed(Duration(seconds: 1), () {
    return "Hello world";
  });

  return result;
}