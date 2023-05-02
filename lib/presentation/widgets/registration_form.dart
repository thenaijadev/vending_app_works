import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../../utilities/services/string_extension.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey_1 = GlobalKey<FormState>();
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();

  final formfieldkey_3 = GlobalKey<FormFieldState>();

  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey_1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Email",
              style: kformInputLabels,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "   johndoe@gmail.com",
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                prefixIconConstraints: BoxConstraints(minWidth: 10),
              ),
              keyboardType: TextInputType.emailAddress,
              key: formfieldkey_1,
              onChanged: (val) {
                formfieldkey_1.currentState!.validate();
              },
              validator: (val) {
                if (!val!.isValidEmail) {
                  return 'Enter valid email';
                }

                return null;
              },
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Username",
              textAlign: TextAlign.start,
              style: kformInputLabels,
            ),
            TextFormField(
              key: formfieldkey_2,
              onChanged: (value) {
                formfieldkey_2.currentState?.validate();
              },
              decoration: const InputDecoration(
                hintText: "   John Doe",
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                prefixIconConstraints: BoxConstraints(minWidth: 10),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Password",
              style: kformInputLabels,
            ),
            TextFormField(
              key: formfieldkey_3,
              obscureText: hidePassword,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
                suffixIcon: GestureDetector(
                    onTap: () {
                      hidePassword = !hidePassword;
                      setState(() {});
                    },
                    child: Icon(hidePassword
                        ? Icons.remove_red_eye_outlined
                        : Icons.visibility_off_outlined)),
                prefixIconConstraints: const BoxConstraints(minWidth: 10),
              ),
              onChanged: (value) {
                formfieldkey_3.currentState!.validate();
              },
              validator: (val) {
                if (!val!.isValidPassword) return 'Enter valid password';
                return null;
              },
            ),
            const SizedBox(
              height: 50,
            ),
            MaterialButton(
              onPressed: () {
                _formKey_1.currentState?.validate();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: kaccentGold,
              minWidth: 350,
              height: 60,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "SIGN UP",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.keyboard_double_arrow_right_outlined,
                    color: Colors.white,
                    size: 20,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: ktextGrey,
            ),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: const Color.fromARGB(255, 0, 0, 0),
              minWidth: 350,
              height: 60,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Sign up with Google",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                        color: kaccentGold, fontWeight: FontWeight.w900),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
