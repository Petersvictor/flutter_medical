// import 'package:flutter/material.dart';
//
// class Body extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: getProportionateScreenWidth(18),
//             vertical: getProportionateScreenWidth(15),
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: getProportionateScreenWidth(130),
//                 width: getProportionateScreenWidth(120),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     boxShadow: [
//                       BoxShadow(
//                           offset: Offset(0, 0),
//                           blurRadius: 3,
//                           color: Colors.black.withOpacity(0.2))
//                     ],
//                     image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image: AssetImage(
//                           'assets/images/national-doctors-day-1.jpg'),
//                     )),
//               ),
//               SizedBox(width: getProportionateScreenWidth(10),),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'dr hfhfh',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 0.4,
//                         fontSize: getProportionateScreenWidth(18),
//                         color: Colors.black
//                     ),
//                   ),
//                   Text(
//                     'Opthamologist',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: getProportionateScreenWidth(14),
//                       color: kAshColor,
//                     ),
//                   ),
//                   SizedBox(height: getProportionateScreenWidth(10),),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: List.generate(5, (index) => Padding(
//                       padding: EdgeInsets.only(right: 2),
//                       child: Icon(Icons.star, color: kPrimaryColor, size: getProportionateScreenWidth(20),),
//                     )),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//         SizedBox(height: getProportionateScreenWidth(10),),
//         Expanded(
//           child: Stack(
//             overflow: Overflow.visible,
//             children: [
//               Container(
//                 height: getProportionateScreenWidth(250),
//                 padding: EdgeInsets.only(
//                   top: getProportionateScreenWidth(20),
//                   right: getProportionateScreenWidth(20),
//                   left: getProportionateScreenWidth(20),
//                 ),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: kPrimaryColor,
//                   borderRadius: BorderRadius.circular(40),
//                   boxShadow: [kDefaultShadow],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'About Doctor',
//                       style: TextStyle(
//                           fontSize: getProportionateScreenWidth(16),
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white
//                       ),
//                     ),
//                     SizedBox(height: getProportionateScreenWidth(10),),
//                     SizedBox(
//                       width: double.infinity,
//                       child: Text(
//                         'Dr. Rose Antig has an MBA in Dermatology and has been an active '
//                             'practitioner for over 10 years, Having Occupied governmental and '
//                             'non-governmental positions,I feel i am due for the job',
//                         maxLines: 4,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: getProportionateScreenWidth(16),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 top: getProportionateScreenWidth(150),
//                 child: Container(
//                   width: SizeConfig.screenWidth,
//                   padding: EdgeInsets.only(
//                     top: getProportionateScreenWidth(15),
//                     right: getProportionateScreenWidth(20),
//                     left: getProportionateScreenWidth(20),
//                   ),
//                   decoration: BoxDecoration(
//                       color: kPrimaryLightColor,
//                       borderRadius: BorderRadius.circular(40)
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'About Doctor',
//                         style: TextStyle(
//                             fontSize: getProportionateScreenWidth(16),
//                             fontWeight: FontWeight.bold,
//                             color: kAshColor
//                         ),
//                       ),
//                       DoctorsServices(service: 'Eye Treatment',),
//                       DoctorsServices(service: 'Surgical eye care',),
//                       DoctorsServices(service: 'Plastic Eye Surgery',),
//                       DoctorsServices(service: 'Diagnosis and treatment of eye conditions',),
//                       DoctorsServices(service: 'Glasses Prescription',),
//                       SizedBox(height: getProportionateScreenWidth(20),),
//                       Text(
//                         'Availability',
//                         style: TextStyle(
//                             fontSize: getProportionateScreenWidth(16),
//                             fontWeight: FontWeight.bold,
//                             color: kAshColor
//                         ),
//                       ),
//                       SizedBox(height: getProportionateScreenWidth(10),),
//                       Text(
//                         'Monday - Friday, 09:00 AM - 4:00 PM ',
//                         style: TextStyle(
//                             fontSize: getProportionateScreenWidth(16),
//                             fontWeight: FontWeight.w500,
//                             color: kAshColor
//                         ),
//                       ),
//                       SizedBox(height: getProportionateScreenWidth(50),),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             height: getProportionateScreenHeight(55),
//                             width: getProportionateScreenWidth(55),
//                             decoration: BoxDecoration(
//                                 color: kPrimaryColor.withOpacity(0.2),
//                                 borderRadius: BorderRadius.circular(10)
//                             ),
//                             child: Icon(
//                               Icons.favorite_border_outlined,
//                               color: kPrimaryColor,
//                               size: getProportionateScreenWidth(25),
//                             ),
//                           ),
//                           InkWell(
//                             onTap : () {
//                               Navigator.push(context, MaterialPageRoute(builder: (context) => Appointment()));
//                             },
//                             child: Container(
//                               height: getProportionateScreenHeight(55),
//                               width: getProportionateScreenWidth(270),
//                               decoration: BoxDecoration(
//                                   color: kPrimaryColor,
//                                   borderRadius: BorderRadius.circular(10)
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   'Book Appointment',
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize:  getProportionateScreenWidth(18),
//                                       fontWeight: FontWeight.w600
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       ],
//     );;
//   }
// }
