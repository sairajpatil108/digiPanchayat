// // ignore_for_file: camel_case_types

// import 'package:digi_panchayat/data/events.dart';
// import 'package:flutter/material.dart';

// class eventUpdate extends StatefulWidget {
//   const eventUpdate({super.key});

//   @override
//   State<eventUpdate> createState() => _eventUpdateState();
// }

// class _eventUpdateState extends State<eventUpdate> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         Container(
//           width: MediaQuery.of(context).size.width / 2,
//           height: MediaQuery.of(context).size.height * 0.8,
//           color: Theme.of(context).colorScheme.background,
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 ElevatedButton(
//                     style: ButtonStyle(
//                       fixedSize: MaterialStateProperty.all(const Size(400, 100)),
//                     ),
//                     onPressed: () {},
//                     child:const Text("Villager's Database")),
//               const  SizedBox(
//                   height: 30,
//                 ),
//                 ElevatedButton(
//                     style: ButtonStyle(
//                       fixedSize: MaterialStateProperty.all(const Size(400, 100)),
//                     ),
//                     onPressed: () {},
//                     child:const Text("Tax"))
//               ],
//             ),
//           ),
//         ),
//         Column(
//           children: [
//             Card(
//               child: Padding(
//                 padding:
//                     const EdgeInsets.all(10.0).copyWith(left: 40, right: 40),
//                 child:const Text("Events"),
//               ),
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width / 2,
//               height: MediaQuery.of(context).size.height * 0.6,
//               color: Theme.of(context).colorScheme.background,
//               child: Padding(
//                 padding:const EdgeInsets.all(10.0),
//                 child: Card(
//                   child: Padding(
//                     padding:const EdgeInsets.all(20.0),
//                     child: ListView.builder(
//                       itemCount: eventData.length,
//                       itemBuilder: (context, index) {
//                         final event = eventData[index];
//                         return InkWell(
//                           onTap: () {},
//                           child: Card(
//                             color: Theme.of(context).colorScheme.surface,
//                             child: ListTile(
//                               title: Text(event.eventName),
//                               subtitle: Text(event.dateTime),
//                               // You can add more ListTile customization here
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
