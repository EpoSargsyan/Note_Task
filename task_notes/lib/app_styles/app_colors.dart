import 'dart:ui';
import 'dart:math';

class AppColors{

  static const white = Color(0xffffffff);
  static const darkGray = Color(0xff3b3b3b);
  static const backgroundColor = Color(0xFF252525);
  static const red = Color(0xFFFF0000);
  static const gray = Color(0xffcccccc);

  static Color getRandomColor() {
    Random random = Random();
    // Generate random RGB values between 0 and 255
    int red = random.nextInt(256);
    int green = random.nextInt(256);
    int blue = random.nextInt(256);
    return Color.fromRGBO(red, green, blue, 1.0);
  }
}