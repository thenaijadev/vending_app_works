import '../constants/constants.dart';
import 'package:flutter/material.dart';
import '../../utilities/services/string_extension.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();

  final formfieldkey_3 = GlobalKey<FormFieldState>();
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Email",
              textAlign: TextAlign.start,
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
              "Password",
              style: kformInputLabels,
            ),
            TextFormField(
              key: formfieldkey_2,
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
                formfieldkey_2.currentState!.validate();
              },
              validator: (val) {
                if (!val!.isValidPassword) return 'Enter valid password';
                return null;
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/passwordrecovery");
              },
              child: const Text(
                "Forgot Password",
                style: TextStyle(color: ktextGrey),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/home");
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: kaccentGold,
              minWidth: 350,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Log In",
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Login with Google",
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
                  "Don't have an account?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Register",
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
