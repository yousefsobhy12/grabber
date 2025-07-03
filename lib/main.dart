import 'package:flutter/material.dart';
import 'package:grabber/screens/home_screen.dart';

void main() {
  runApp(Grabber());
}

class Grabber extends StatelessWidget {
  const Grabber({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

// class Test extends StatelessWidget {
//   const Test({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Example App')),
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(width: 16),
//             const Text("Item Name Here"),
//             const SizedBox(width: 16),
//             const Expanded(child: SizedBox(width: double.infinity)),
//             AddToCartCounterButton(
//               initNumber: 0,
//               minNumber: 0,
//               maxNumber: 10,
//               increaseCallback: () {},
//               decreaseCallback: () {},
//               counterCallback: (int count) {
//                 log('Current count: $count');
//               },
//               backgroundColor: Colors.orange,
//               buttonFillColor: Colors.orange,
//               buttonIconColor: Colors.white,
//             ),
//             const SizedBox(width: 16),
//           ],
//         ),
//       ),
//     );
//   }
// }
