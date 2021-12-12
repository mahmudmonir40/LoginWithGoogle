
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Provider/GoogleSignInProvider.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(

   child: OutlineButton.icon(
       icon: FaIcon(FontAwesomeIcons.google,color: Colors.brown,),
       label: Text("SignInWithGoogle",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w300),),
       shape: StadiumBorder(),
       padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),

     onPressed: (){

         final provider = Provider.of<GoogleSignInProvider>(context,listen: false);

         provider.login();

     },
   ),

  );
}
