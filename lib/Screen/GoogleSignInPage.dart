
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Provider/GoogleSignInProvider.dart';
import 'package:untitled2/Widgets/LoginWidget.dart';
import 'package:untitled2/Widgets/SignUpWidgets.dart';

class GoogleSignInPage extends StatefulWidget {
  const GoogleSignInPage({Key? key}) : super(key: key);

  @override
  _GoogleSignInPageState createState() => _GoogleSignInPageState();
}

class _GoogleSignInPageState extends State<GoogleSignInPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey,

      appBar: AppBar(
        title: Text("Login With Google"),
        centerTitle: true,
      ),
      
      body: ChangeNotifierProvider(create: (context)=>GoogleSignInProvider(),

        child: StreamBuilder(

            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot){
              final provider = Provider.of<GoogleSignInProvider>(context);

             if(provider.isSignIn){
               return buildLoading();
             }else if(snapshot.hasData){

               return LoginWidget();

             }





             else{

               return SignUpWidget();


             }


            }),


      ),
    );
  }
  Widget buildLoading() => Stack(

     children: [
       Center(child: CircularProgressIndicator())
     ],


  );

}
