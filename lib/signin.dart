// import 'package:flutter/material.dart';

// import 'drive.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
//   'profile',
//   'email',
//   'https://www.googleapis.com/auth/drive',
//   'https://www.googleapis.com/auth/drive.appdata',
//   'https://www.googleapis.com/auth/drive.photos.readonly',
// ]);

// String name;
// String email;
// String imageUrl;
// String firstName;

// Future<FirebaseUser> signInWithGoogle() async {
//   final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//   final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount.authentication;

//   final AuthCredential credential = GoogleAuthProvider.getCredential(
//     accessToken: googleSignInAuthentication.accessToken,
//     idToken: googleSignInAuthentication.idToken,
//   );

//   final AuthResult authResult = await _auth.signInWithCredential(credential);
//   final FirebaseUser user = authResult.user;

//   // Checking if email and name is null
//   assert(user.email != null);
//   assert(user.displayName != null);
//   assert(user.photoUrl != null);

//   name = user.displayName;
//   email = user.email;
//   imageUrl = user.photoUrl;

//   // Only taking the first part of the name, i.e., First Name
//   if (name.contains(" ")) {
//     firstName = name.substring(0, name.indexOf(" "));
//   }

//   assert(!user.isAnonymous);
//   assert(await user.getIdToken() != null);

//   final FirebaseUser currentUser = await _auth.currentUser();
//   assert(user.uid == currentUser.uid);
//   print(user.displayName);
//   print(firstName);

//   print(user.email);
//   print(user.photoUrl);

//   return user;
// }

// void signOutGoogle() async {
//   await googleSignIn.signOut();

//   print("User Sign Out");
// }

// class SignIn extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         child: FlatButton(
//           child: Text('sign in'),
//           onPressed: () {
//             signInWithGoogle().whenComplete(() {
//               print('pressed');
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) {
//                     return Drive();
//                   },
//                 ),
//               );
//             });
//           },
//         ),
//       ),
//     );
//   }
// }
