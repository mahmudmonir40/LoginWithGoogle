
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Provider/GoogleSignInProvider.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser;

    return Container(
     alignment: Alignment.center,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Logged In User Data"),
          SizedBox(
            height: 30,
          ),

          CircleAvatar(
            maxRadius: 80,
            backgroundImage: NetworkImage(user!.photoURL!),
          ),

          SizedBox(
            height: 15,
          ),
          Text("User Name:" + user.displayName!),
          Text("User Email:" + user.email!),

          SizedBox(
            height: 15,
          ),

          ElevatedButton(onPressed: (){

            final provider = Provider.of<GoogleSignInProvider>(context,listen: false);

            provider.logOut();


          }, child: Text("Loged Out"),



          ),
        ],
      ),


    );
  }
}
