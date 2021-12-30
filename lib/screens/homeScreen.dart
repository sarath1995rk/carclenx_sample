import 'package:carclenx_sample/screens/mainDashboard.dart';
import 'package:carclenx_sample/services/apiService.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  String? phone;
  String? otp;
  bool _loading = false;
  bool _otpSend = false;
  bool _otpLoading = false;

  ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Please enter your phone number'),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    suffix: _loading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator())
                        : const SizedBox(),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.greenAccent, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 1.0)),
                    hintText: 'Mobile Number',
                  ),
                  validator: (val) {
                    if (val!.length != 10) {
                      return 'Enter a valid mobile number';
                    }
                    phone = val;
                    return null;
                  },
                  onFieldSubmitted: (_) => _saveForm(),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (_otpSend)
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffix: _otpLoading
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator())
                          : const SizedBox(),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0)),
                      hintText: 'Otp',
                    ),
                    onSubmitted: (val) {
                      if (val.length != 6) {
                        showSnackBar('Enter a valid otp');
                      } else {
                        otp = val;
                        _verify();
                      }
                    },
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveForm() async {
    final _valid = _formKey.currentState!.validate();
    if (!_valid) {
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _loading = true;
    });
    try {
      final response = await _apiService.authenticate(phone!);

      if (response) {
        setState(() {
          _loading = false;
          _otpSend = true;
        });
        showSnackBar('otp has send to $phone');
      } else {
        setState(() {
          _loading = false;
          _otpSend = false;
        });
        showSnackBar('something went wrong');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _verify() async {
    setState(() {
      _otpLoading = true;
    });
    try {
      final response = await _apiService.verifyUser(phone!, otp!);

      if (response) {
        showSnackBar('successful');
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => MainDashBoard()));
      } else {
        setState(() {
          _otpLoading = false;
        });
        showSnackBar('something went wrong');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.blueAccent,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
