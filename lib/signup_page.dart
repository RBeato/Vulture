import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tweether_2/eth/alternative2_ethereum_utils.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _firstNameKey = GlobalKey<FormState>();
  final _lastNameKey = GlobalKey<FormState>();
  final _desiredUserNameKey = GlobalKey<FormState>();
  final _gravatarEmailKey = GlobalKey<FormState>();
  final _bioKey = GlobalKey<FormState>();

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/purple_background.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Sign Up Page",
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        "Create your account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20.0),
                      signUpTextForm(
                          formKey: _firstNameKey,
                          label: "FIRST NAME",
                          controller: controller),
                      signUpTextForm(
                          formKey: _lastNameKey,
                          label: "LAST NAME",
                          controller: controller),
                      signUpTextForm(
                          formKey: _desiredUserNameKey,
                          label: "DESIRED USERNAME",
                          controller: controller),
                      signUpTextForm(
                          formKey: _gravatarEmailKey,
                          label: "GRAVATAR EMAIL",
                          controller: controller),
                      signUpTextForm(
                          formKey: _bioKey,
                          label: "BIO",
                          controller: controller),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            child: const Text("Create",
                                style: TextStyle(color: Colors.black54)),
                            onPressed: () async {
                              //Test code
                              EthereumUtils.initiate('UserStorage');
                              EthereumUtils.sendInformationToContract(
                                  env['INFURA_API_KEY'].toString(),
                                  'createUser', []);
                              //**********
                              if (_firstNameKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')));
                              }
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Form signUpTextForm({
  required GlobalKey<FormState> formKey,
  required String label,
  required TextEditingController controller,
}) {
  print("FormKey: $formKey");
  Function Validation = getValidationFunction();
  return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: label),
            //the validator receives the text that the user has entered.autocorrect:
            validator: (value) {
              //!Validation Function
              //
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          )
        ],
      ));
}

Function getValidationFunction() {
  //select appropriate function
  return () {};
}
