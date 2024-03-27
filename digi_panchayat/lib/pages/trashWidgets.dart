
// void _showBottomSheet(BuildContext context) {
//   final formKey = GlobalKey<FormState>();

//   String eventtitle = "";
//   DateTime? selectedDateTime;

//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent,
//     builder: (context) => StatefulBuilder(
//       builder: (BuildContext context, StateSetter setState) {
//         return Form(
//           key: formKey,
//           child: Container(
//             height: MediaQuery.of(context).size.height * 0.35,
//             decoration: BoxDecoration(
//               color: Theme.of(context).colorScheme.surface,
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(25.0),
//                 topRight: Radius.circular(25.0),
//               ),
//             ),
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       decoration: const InputDecoration(hintText: "Title"),
//                       validator: (value) =>
//                           value!.isEmpty ? "Please enter a title" : null,
//                       onSaved: (value) => eventtitle = value!,
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     TextButton(
//                       onPressed: () async {
//                         final selectedDate = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime.now(),
//                           lastDate:
//                               DateTime.now().add(const Duration(days: 365)),
//                         );
//                         if (selectedDate != null) {
//                           final selectedTime = await showTimePicker(
//                             context: context,
//                             initialTime: TimeOfDay.now(),
//                           );
//                           if (selectedTime != null) {
//                             setState(() {
//                               selectedDateTime = DateTime(
//                                 selectedDate.year,
//                                 selectedDate.month,
//                                 selectedDate.day,
//                                 selectedTime.hour,
//                                 selectedTime.minute,
//                               );
//                             });
//                           }
//                         }
//                       },
//                       child: Text(
//                         selectedDateTime == null
//                             ? 'Select Date and Time'
//                             : 'Selected: ${DateFormat('MM/dd/yyyy HH:mm').format(selectedDateTime!)}',
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         if (formKey.currentState!.validate()) {
//                           formKey.currentState!.save();
//                           if (selectedDateTime != null) {
//                             // Create a new Event object
//                             final newEvent = Event(
//                                 eventtitle: eventtitle,
//                                 dateTime: selectedDateTime.toString(),
//                                 eventTitle: '');
//                             // Add the new event to the list
//                             eventData.add(newEvent);
//                             // Perform any other actions, like saving to a database
//                             Navigator.of(context).pop();
//                           } else {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text('Please select date and time'),
//                               ),
//                             );
//                           }
//                         }
//                       },
//                       child: const Text("Save"),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     ),
//   );
// }
