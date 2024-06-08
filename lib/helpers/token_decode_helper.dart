import 'dart:convert';

class TokenDecodeHelper {
  static Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception(
        'Tekrar giriş yapmayı deneyin -> Token kısa',
      );
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception(
        'Tekrar giriş yapmayı deneyin -> Token parçalanamadı',
      );
    }

    return payloadMap;
  }

  static String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');
    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception(
          'Tekrar giriş yapmayı deneyin -> Base64 hatası',
        );
    }

    return utf8.decode(base64Url.decode(output));
  }
}
