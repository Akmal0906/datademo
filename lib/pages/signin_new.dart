import 'package:datademo/pages/signup_new.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/user_model.dart';
import '../service/db_service.dart';


class SignInNew extends StatefulWidget {
  const SignInNew({Key? key}) : super(key: key);
static const String id='signin_new';
  @override
  State<SignInNew> createState() => _SignInNewState();
}

class _SignInNewState extends State<SignInNew> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  _doSignIn(){
    String username=usernameController.text.toString().trim();



    String password=passwordController.text.toString().trim();
    var user=User(password: password, username: username);
    HiveDB().storeUser(user);
    var user2=HiveDB().loadUser();

    print(user2.username);
    print(user2.password);

  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff07807b),
          elevation: 0,
        ),
      backgroundColor: const Color(0xff07807b),
        body: SingleChildScrollView(


            child: Column(

              children: [
                //#image

               Container(
               width: double.infinity,
               color: const Color(0xff07807b),
               child: Column(
                 children: [
                   Container(

                     padding: const EdgeInsets.only(right: 250),
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(50.0),
                       child: const Image(
                         fit: BoxFit.cover,
                         image: AssetImage('assets/images/Richard.jpg'),
                         width: 90.0,
                         height: 80.0,
                       ),
                     ),
                   ),
                   const SizedBox(
                     height: 15,
                   ),
                   const Padding(
                     padding: EdgeInsets.only(right: 200),
                     child: Text(
                       'Welcome Back',
                       style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.bold,
                           fontSize: 23),
                     ),
                   ),
                   const SizedBox(
                     height: 5,
                   ),
                   const Padding(
                     padding: EdgeInsets.only(right: 200),
                     child: Text(
                       'Sign in to continue',
                       style: TextStyle(color: Colors.white, fontSize: 15),
                     ),
                   ),
                   const SizedBox(
                     height: 40,
                   ),
                 ],
               ),
             ),



 Container(
   height: size.height,
  padding:const EdgeInsets.all(30),
  decoration: const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
  ),
  child: Column(
    children: [

      TextField(
        controller: usernameController,
        decoration: const InputDecoration(
            hintText: 'username',
            hintStyle: TextStyle(color: Colors.white),
            icon: Icon(Icons.person)),
      ),
      const SizedBox(
        height: 10,
      ),
      TextField(
        controller: passwordController,
        decoration: const InputDecoration(
            hintText: 'password',
            hintStyle: TextStyle(color: Colors.white),
            icon: Icon(Icons.lock)),
      ),

      const SizedBox(
        height: 40,
      ),
      const Text(
          'Forgot password ?',
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),

      const SizedBox(
        height: 30,
      ),


      GestureDetector(
        onTap: _doSignIn,
        child: Container(
          width: double.infinity,
          height: 40,
          margin:const EdgeInsets.symmetric(horizontal: 40),
          color: const Color(0xff07807b),
          child: const Center(
              child: Text('Sign In',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),)
          ),
        ),
      ),
      Container(
        margin:const EdgeInsets.only(left: 20),
        padding:const EdgeInsets.all(25),
        child:   Row(

          children: [


            const Text(
              "Don,t have an account ?",
              style: TextStyle(color: Colors.grey, fontSize: 17),

            ),
            const SizedBox(width: 10,),
            GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, SignUpNew.id);
                },
                child:const Text(
                  "Sign Up ",
                  style: TextStyle(color: Colors.black87, fontSize: 17),
                )),


          ],

        ),
      ),
      Container(
        width:300,
        height:80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: const <Widget>[

            Icon(FontAwesomeIcons.facebook, color: Colors.blue, size: 25.0),
            Icon(FontAwesomeIcons.instagram, color: Colors.black87, size: 25.0),
            Icon(FontAwesomeIcons.twitter, color: Colors.blue, size: 25.0)
          ],
        ),
      )

    ],
  ),

),
              ],
            ),
          ),
        );
  }
}
