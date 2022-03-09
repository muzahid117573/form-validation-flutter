import 'package:flutter/material.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey=GlobalKey<FormState>();
  String? email="";
  String? password="";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Login Page'),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
            children: [
              emailForm(),
              passwordForm(),
              SizedBox.fromSize(size: Size(1,20),),
              confirmButton(context)

            ],
          ),

          ),
        ),
      ),
    );
  }
  Widget passwordForm(){
    return TextFormField(
      validator: (value){
        if(value!.length< 5){
          return 'Password Should Have More Than 5 Characters';

        }
      },
      onSaved: (value){
        password=value;

      },
      keyboardType: TextInputType.number,
      obscureText: true,
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "******",

          icon: Icon(Icons.password)
      ),
    );
  }

  Widget emailForm(){
    return TextFormField(
      validator: (value){
        if(!value!.contains('@')){
          return 'Invalid Email';

        }
      },
      onSaved: (value){

       email=value;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(

          labelText: "Email Address",
          hintText: "muzahid117573@gmail.com",
          icon: Icon(Icons.email)
      ),
    );


  }
  Widget confirmButton(context){
    return ElevatedButton(onPressed: (){
     if( formKey.currentState!.validate()){
       formKey.currentState!.save();
       print("Email is : $email\n Password is : $password\n Saved Successfully");


     }


    }, child: Text(
        "Confirm Now"
    ),);
  }

}

