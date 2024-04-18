// import 'package:flutter/material.dart';

// class TotalExpense extends StatefulWidget {
//   const TotalExpense({super.key, required this.totaal});

//   @override
//     final double totaal;
//   State<TotalExpense> createState() => _TotalExpense();
// }

// class _TotalExpense extends State<TotalExpense> {
//   @override
//   Widget build(BuildContext context) {
//     final isDarkMode =
//         MediaQuery.of(context).platformBrightness == Brightness.dark;

//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 4.0),
//         child: Row(
//           children: [
//             Text(totaal
//               ,
//               style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// // import 'package:flutter/material.dart';

// // class ChartBar extends StatelessWidget {
// //   const ChartBar({
// //     super.key,
// //     required this.fill,
// //   });

// //   final double fill;

// //   @override
// //   Widget build(BuildContext context) {
// //     final isDarkMode =
// //         MediaQuery.of(context).platformBrightness == Brightness.dark;
// //     return Expanded(
// //       child: Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: 4),
// //         child: FractionallySizedBox(
// //           heightFactor: fill,
// //           child: DecoratedBox(
// //             decoration: BoxDecoration(
// //               shape: BoxShape.rectangle,
// //               borderRadius:
// //                   const BorderRadius.vertical(top: Radius.circular(8)),
// //               color: isDarkMode
// //                   ? Theme.of(context).colorScheme.secondary
// //                   : Theme.of(context).colorScheme.primary.withOpacity(0.65),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
