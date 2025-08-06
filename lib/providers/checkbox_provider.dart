import 'package:e_ui_comm_kit/providers/checkbox_provider_class.dart';
import 'package:e_ui_comm_kit/screens/forgotpassword.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckBoxProviderScreen extends StatelessWidget {
  const CheckBoxProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("hollouh");
    return Consumer<CheckboxProvider>(
      builder: (context, checkboxProvider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                children: [
                  Checkbox(
                    activeColor: Colors.deepOrangeAccent,
                    value: checkboxProvider.isChecked,
                    onChanged: (newValue) {
                      checkboxProvider.turnChecked(newValue!);
                    },
                  ),
                  SizedBox(width: 3.0,),
                  Text("Remember me ")
                ],
              ),
            ),
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword(),));
                  },
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ),

                Container(
                  height: 0.8,
                  width: 110, // or use `double.infinity` or wrap with `IntrinsicWidth`
                  color: Colors.black,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
