// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Laisser un avis'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               _askForReview();
//             },
//             child: Text('Laisser un avis'),
//           ),
//         ),
//       ),
//     );
//   }

//   void _askForReview() async {
//     // Afficher une boîte de dialogue demandant à l'utilisateur s'il souhaite laisser un avis
//     bool leaveReview = await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Laisser un avis'),
//         content: Text('Votre avis est important pour nous. Souhaitez-vous laisser un avis sur Google Play?'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context, true); // L'utilisateur veut laisser un avis
//             },
//             child: Text('Oui'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context, false); // L'utilisateur ne veut pas laisser d'avis
//             },
//             child: Text('Non'),
//           ),
//         ],
//       ),
//     );

//     // Si l'utilisateur souhaite laisser un avis, ouvrir la page de l'application sur Google Play Store
//     if (leaveReview != null && leaveReview) {
//       const url = 'https://play.google.com/store/apps/details?id=votre.package';
//       if (await canLaunch(url)) {
//         await launch(url);
//       } else {
//         throw 'Impossible d\'ouvrir $url';
//       }
//     }
//   }
// }
