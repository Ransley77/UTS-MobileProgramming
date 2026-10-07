import '../models/lesson.dart';

final List<Lesson> lessonsSpain = [
  Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari "Hola"?',
    options: ['Selamat tinggal', 'Halo', 'Terima kasih', 'Tolong'],
    correctAnswer: 'Halo',
  ),
  Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari "Gracias"?',
    options: ['Sama-sama', 'Maaf', 'Terima kasih', 'Ya'],
    correctAnswer: 'Terima kasih',
  ),
  Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari "Agua"?',
    options: ['Air', 'Api', 'Udara', 'Susu'],
    correctAnswer: 'Air',
  ),
  Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari "Gato"?',
    options: ['Anjing', 'Kucing', 'Burung', 'Ikan'],
    correctAnswer: 'Kucing',
  ),

  Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan bahasa Spanyol dari "Halo":',
    options: [],
    correctAnswer: 'hola',
  ),
  Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan bahasa Spanyol dari "Terima kasih":',
    options: [],
    correctAnswer: 'gracias',
  ),
  Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan bahasa Spanyol dari "Selamat tinggal":',
    options: [],
    correctAnswer: 'adios',
  ),

  Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun kalimat "Selamat pagi":',
    options: ['días', 'Buenos'],
    correctAnswer: 'Buenos días',
  ),
  Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun kalimat "Nama saya...":',
    options: ['Llamo', 'Me'],
    correctAnswer: 'Me Llamo',
  ),
  Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun kalimat "Sampai jumpa lagi":',
    options: ['luego', 'Hasta'],
    correctAnswer: 'Hasta luego',
  ),
];