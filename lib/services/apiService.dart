import 'package:http/http.dart' as http;

class ApiService {
  Future<bool> authenticate(String phone) async {
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://dev.carclenx.com/api/V2/customers/get-otp?phone=$phone'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  Future<bool> verifyUser(String phone, String otp) async {
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://dev.carclenx.com/api/V2/customers/validate-otp?phone=$phone&otp=$otp'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
