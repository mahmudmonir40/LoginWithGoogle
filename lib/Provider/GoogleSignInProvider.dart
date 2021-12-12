
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier{
  final googleSignIn = GoogleSignIn();

bool _isSignIn = false;


GoogleSignInProvider(){
  _isSignIn = false;
}

bool get isSignIn => _isSignIn;

set isSignIn (bool isSignIn){
_isSignIn = isSignIn;
notifyListeners();
}

Future login() async{

  isSignIn = true;

  final user = await googleSignIn.signIn();

  if(user==null){
   isSignIn = false;
   return;

  }else{

     final googleAut = await user.authentication;
     final credential = GoogleAuthProvider.credential(

       accessToken: googleAut.accessToken,
       idToken: googleAut.idToken

     );

     await FirebaseAuth.instance.signInWithCredential(credential);

  }


}
  void logOut() async {

    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();

  }



}