import 'package:flutter/material.dart';

class Demo {
  final int id;
  final String title, description, docName, img, docImage, docFullName, docOccupation;
  final bool isOnline, isPopular;

  Demo({
    @required this.id,
    this.isOnline = false,
    this.isPopular = false,
    @required this.title,
    @required this.description,
    @required this.docName,
    @required this.docImage,
    @required this.img,
    @required this.docFullName,
    @required this.docOccupation
  });
}

// Our demo Products

List<Demo> demoItems = [
  Demo(
    id: 1,
    title: "Covid-19 Vaccine",
    description: 'Protect yourself from Covid19',
    isOnline: true,
    isPopular: true,
    img: 'assets/images/wysiwyg-uploads_1580196666465-doctor.jpg',
    docName: 'Dr. Mana',
    docImage: 'assets/images/bigstock.jpg',
    docFullName: 'Dr Mana Ogbuth',
    docOccupation: 'Optician'
  ),
  Demo(
    id: 2,
    title: "Asthma Treatment",
    description: 'New way to treat Asthma',
    isPopular: true,
    isOnline: false,
    docImage: 'assets/images/istockphoto-485610895-170667a.jpg',
    img: 'assets/images/doc2.jpg',
    docName: 'Dr. Paker',
      docFullName: 'Dr Paker Beans',
      docOccupation: 'Heart Surgeon'
  ),
  Demo(
    id: 3,
    title: "Covid-19 Treatment",
    description: 'Coronavirus Vaccine',
    isOnline: true,
    isPopular: true,
    docImage: 'assets/images/istockphoto-624472962-170667a.jpg',
    img: 'assets/images/doc3.jpg',
    docName: 'Dr. Rose',
      docFullName: 'Dr Offor Nicho',
      docOccupation: 'Pediatrician'
  ),
  Demo(
    id: 4,
    title: "Malaria Treatment",
    description: 'New solution to treating malaria',
    isOnline: true,
    docImage: 'assets/images/national-doctors-day-1.jpg',
    img: 'assets/images/doc4.jpg',
    docName: 'Dr. Harry',
      docFullName: 'Dr Mana Azikiwa',
      docOccupation: 'Surgeon'
  ),
  Demo(
    id: 4,
    title: "CholeraTreatment",
    description: 'New solution to treating cholera',
    isOnline: true,
    docImage: 'assets/images/file-20191203-67002-1fcpnfd.jpg',
    img: 'assets/images/file-20191203-67002-1fcpnfd.jpg',
    docName: 'Dr. Para',
      docFullName: 'Dr Mana Ogbuth',
      docOccupation: 'Optician'
  ),
  Demo(
      id: 4,
      title: "Malaria Treatment",
      description: 'New solution to treating malaria',
      isOnline: true,
      docImage: 'assets/images/wysiwyg-uploads_1580196666465-doctor.jpg',
    img: 'assets/images/wysiwyg-uploads_1580196666465-doctor.jpg',
    docName: 'Dr. Peter',
      docFullName: 'Dr Mana Ogbuth',
      docOccupation: 'Optician'
  ),
];