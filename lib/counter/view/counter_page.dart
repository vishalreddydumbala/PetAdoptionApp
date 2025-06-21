// import 'package:flutter/material.dart';
//
// void main() => runApp(PetApp());
//
// class PetApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: Color(0xFF1C1C1E),
//         primaryColor: Colors.tealAccent,
//       ),
//       home: PetHomePage(),
//     );
//   }
// }
//
// class PetHomePage extends StatefulWidget {
//   @override
//   _PetHomePageState createState() => _PetHomePageState();
// }
//
// class _PetHomePageState extends State<PetHomePage> {
//   List allPets = List.generate(20, (index) => {
//     'name': 'Pet #$index',
//     'type': index % 2 == 0 ? 'Dog' : 'Cat',
//     'image': 'https://placekitten.com/200/200?image=${index + 1}',
//     'description': 'This is a friendly ${index % 2 == 0 ? 'dog' : 'cat'} number $index.'
//   });
//   List pets = [];
//   String query = "";
//   int page = 1;
//   final int pageSize = 10;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchPets();
//   }
//
//   void fetchPets() {
//     final filtered = allPets
//         .where((pet) => pet['name'].toLowerCase().contains(query.toLowerCase()))
//         .toList();
//     final start = (page - 1) * pageSize;
//     final end = start + pageSize;
//     setState(() {
//       pets = filtered.sublist(start, end > filtered.length ? filtered.length : end);
//     });
//   }
//
//   void onSearch(String value) {
//     setState(() {
//       query = value;
//       page = 1;
//     });
//     fetchPets();
//   }
//
//   void nextPage() {
//     setState(() {
//       page++;
//     });
//     fetchPets();
//   }
//
//   void prevPage() {
//     if (page > 1) {
//       setState(() {
//         page--;
//       });
//       fetchPets();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('🐾 Pet Finder'),
//         centerTitle: true,
//         backgroundColor: Colors.tealAccent,
//         foregroundColor: Colors.black,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search pets by name...',
//                 prefixIcon: Icon(Icons.search),
//                 filled: true,
//                 fillColor: Colors.white10,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               onChanged: onSearch,
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: GridView.builder(
//                 itemCount: pets.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 10,
//                   crossAxisSpacing: 10,
//                   childAspectRatio: 3 / 4,
//                 ),
//                 itemBuilder: (context, index) {
//                   final pet = pets[index];
//                   return GestureDetector(
//                     onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => PetDetailPage(pet: pet),
//                       ),
//                     ),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white10,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: Image.network(pet['image'], height: 100, width: 100, fit: BoxFit.cover),
//                           ),
//                           SizedBox(height: 10),
//                           Text(pet['name'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                           Text(pet['type'], style: TextStyle(color: Colors.tealAccent)),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ElevatedButton(
//                   onPressed: prevPage,
//                   child: Text('Previous'),
//                 ),
//                 Text('Page $page'),
//                 ElevatedButton(
//                   onPressed: nextPage,
//                   child: Text('Next'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class PetDetailPage extends StatelessWidget {
//   final Map pet;
//
//   PetDetailPage({required this.pet});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(pet['name']),
//         backgroundColor: Colors.tealAccent,
//         foregroundColor: Colors.black,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Image.network(pet['image'], height: 200, width: double.infinity, fit: BoxFit.cover),
//             ),
//             SizedBox(height: 20),
//             Text(pet['description'], style: TextStyle(fontSize: 18)),
//           ],
//         ),
//       ),
//     );
//   }
// }
