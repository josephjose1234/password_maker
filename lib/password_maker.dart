import 'dart:math';

String generatePassWord(int length) {
   String password='';
  const String validChars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()';
  Random random = Random();
  for (int i = 0; i < length; i++) {
    int randomIndex = random.nextInt(validChars.length);
    password += validChars[randomIndex];
  }
  return password;
}
