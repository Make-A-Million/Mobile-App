import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import '../Controller/AuthValidator.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
                key: _formKey,
                child: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: mediaQuery.width * .05),
                  height: mediaQuery.height * .4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          return AuthValidators.emailValidator(value!);
                        },
                        style: GoogleFonts.nunitoSans(),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            contentPadding:
                            const EdgeInsets.symmetric(vertical: 15),
                            prefixIcon:  Icon(
                              Ionicons.mail_outline,
                              color: Theme.of(context).primaryColor,
                            ),
                            hintText: "Email",
                            hintStyle: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.w600,
                                color: Colors.black38),
                            fillColor: Colors.black12,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none)),
                      ),
                      TextFormField(
                        controller: _passwordController,
                        style: GoogleFonts.nunitoSans(),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          return AuthValidators.confirmPasswordValidator(
                              value!.trim(),
                              _confirmPasswordController.text.trim());
                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 5),
                            prefixIcon:  Icon(
                              Ionicons.lock_closed_outline,
                              color: Theme.of(context).primaryColor,
                            ),
                            hintText: "Password",
                            hintStyle: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.w600,
                                color: Colors.black38),
                            fillColor: Colors.black12,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none)),
                      ),
                      TextFormField(
                        controller: _confirmPasswordController,
                        style: GoogleFonts.nunitoSans(),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          return AuthValidators.confirmPasswordValidator(
                              _passwordController.text.trim(), value!.trim());
                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 5),
                            prefixIcon:  Icon(
                              Ionicons.lock_closed_outline,
                              color: Theme.of(context).primaryColor,
                            ),
                            hintText: "Confirm Password",
                            hintStyle: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.w600,
                                color: Colors.black38),
                            fillColor: Colors.black12,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none)),
                      ),
                      ElevatedButton(
                          onPressed: () async {


                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      horizontal: mediaQuery.width * .11,
                                      vertical: mediaQuery.height * .015)),
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).primaryColor)),
                          child: isLoading?const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                              :Text(
                            "Create Account",
                            style: GoogleFonts.nunitoSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: mediaQuery.width * .04),
                          ))
                    ],
                  ),
                )),

          ],
        ),
      )
      ,
    );
  }
}
