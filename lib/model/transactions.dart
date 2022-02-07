import 'package:flutter/material.dart';

class Trx {
  final String title;
  final String date;
  final String image;
  final double price;
  final String source;
  Trx({
    required this.title,
    required this.date,
    required this.image,
    required this.price,
    required this.source,
  });
}

final transactions = [
  Trx(
      title: 'Starbucks',
      date: '22/8/2021 10:40 pm',
      image: 'assets/images/brand1.png',
      price: -35,
      source: 'QR Payment'),
  Trx(
      title: 'Mohamed Ali',
      date: '18/8/2021 10:40 pm',
      image: 'assets/images/avatar1.jpeg',
      price: 200,
      source: 'Contact Transfer'),
  Trx(
      title: 'McDonald\'s',
      date: '10/8/2021 10:40 pm',
      image: 'assets/images/brand2.png',
      price: 120,
      source: 'Apple Pay'),
  Trx(
      title: 'Starbucks',
      date: '22/8/2021 10:40 pm',
      image: 'assets/images/brand1.png',
      price: -35,
      source: 'QR Payment'),
  Trx(
      title: 'Mohamed Ali',
      date: '18/8/2021 10:40 pm',
      image: 'assets/images/avatar1.jpeg',
      price: 200,
      source: 'Contact Transfer'),
  Trx(
      title: 'McDonald\'s',
      date: '10/8/2021 10:40 pm',
      image: 'assets/images/brand2.png',
      price: 120,
      source: 'Apple Pay'),
  Trx(
      title: 'Starbucks',
      date: '22/8/2021 10:40 pm',
      image: 'assets/images/brand1.png',
      price: -35,
      source: 'QR Payment'),
  Trx(
      title: 'Mohamed Ali',
      date: '18/8/2021 10:40 pm',
      image: 'assets/images/avatar1.jpeg',
      price: 200,
      source: 'Contact Transfer'),
  Trx(
      title: 'McDonald\'s',
      date: '10/8/2021 10:40 pm',
      image: 'assets/images/brand2.png',
      price: 120,
      source: 'Apple Pay'),
];
