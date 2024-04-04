import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nps/binding/initialbindings.dart';
import 'package:nps/core/localization/changelocale.dart';
import 'package:nps/core/services/services.dart';
import 'package:nps/routes.dart';
import 'core/localization/translation.dart';

//var token_m="2|NZC2RUDFru9UDQKnw6l0MrA8CcnYnWoD9bdm3xj6";
String link="http://192.168.66.175:8000";
String photo="http://192.168.66.175:8000/uploads";
//192.168.43.117:8000";
class a{}
void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await  initialService();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialBinding: InitialBindings(),
      theme: controller.appTheme,
      getPages: routes,

    );
  }
}
class faildtextpassword{}
//
// void main() => runApp(ProgressiveImageUI());
//
// class ProgressiveImageUI extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark(),
//       home: TextFormFieldExample()
//     );
//   }
// }
// class TextFormFieldExample extends StatefulWidget {
//  // const TextFormFieldExample({Key key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() => _TextFormFieldExampleState();
// }
//
// class _TextFormFieldExampleState extends State<TextFormFieldExample> {
//   final GlobalKey<FormFieldState<String>> _passwordFieldKey =
//   GlobalKey<FormFieldState<String>>();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(child:
//       SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//     child: Column(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     crossAxisAlignment: CrossAxisAlignment.stretch,
//     children: <Widget>[
//
//     SizedBox(height: 24.0),
//     PasswordField(
//     fieldKey: _passwordFieldKey,
//     helperText: 'No more than 8 characters.',
//     labelText: 'Password *',
//     onFieldSubmitted: (String value) {
//       setState(() {
//         this._password = value;
//       });
//     }, hintText: 'password', onSaved: (String? newValue) {  }, validator: (String? value) {  },
//     ),
//
//
//     ],
//     ),
//     ) ,);
//   }
// }
//
// class PasswordField extends StatefulWidget {
//   const PasswordField({
//     required this.fieldKey,
//     required this.hintText,
//     required this.labelText,
//     required  this.helperText,
//     required this.onSaved,
//     required this.validator,
//     required this.onFieldSubmitted,
//   });
//
//   final Key fieldKey;
//   final String hintText;
//   final String labelText;
//   final String helperText;
//   final FormFieldSetter<String> onSaved;
//   final FormFieldValidator<String> validator;
//   final ValueChanged<String> onFieldSubmitted;
//
//   @override
//   _PasswordFieldState createState() => _PasswordFieldState();
// }
//
// class _PasswordFieldState extends State<PasswordField> {
//   bool _obscureText = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       key: widget.fieldKey,
//       obscureText: _obscureText,
//       maxLength: 8,
//       onSaved: widget.onSaved,
//       validator: widget.validator,
//       onFieldSubmitted: widget.onFieldSubmitted,
//       decoration: InputDecoration(
//         border: const UnderlineInputBorder(),
//         filled: true,
//         hintText: widget.hintText,
//         labelText: widget.labelText,
//         helperText: widget.helperText,
//         suffixIcon: GestureDetector(
//           onTap: () {
//             setState(() {
//               _obscureText = !_obscureText;
//             });
//           },
//           child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
//         ),
//       ),
//     );
//   }
// }


class clip{}
//
//
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBar(
//         title: Text("Flutter custom clipper example"),
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(20.0),
//         children: <Widget>[
//
//           SizedBox(height: 10.0,),
//           ClipPath(
//             clipper: RoundedDiagonalPathClipper(),
//             child: Container(
//               height: 320,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(50.0)),
//                 color: Colors.orange,
//               ),
//               child: Center(child: Text("RoundedDiagonalPathClipper()")),
//             ),
//           ),
//
//
//         ],
//       ),
//     );
//   }
// }