import '../models/lesson.dart';

const List<Lesson> lessons = [
  Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari みず?',
    options: [
      'Air',
      'Api',
      'Tanah',
      'Angin',
    ],
    correctAnswer: 'Air',
  ),

  Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari ねこ?',
    options: [
      'Anjing',
      'Kucing',
      'Burung',
      'Ikan',
    ],
    correctAnswer: 'Kucing',
  ),
];