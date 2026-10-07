import '../models/lesson.dart';

final List<Lesson> lessonsInggris = [
  Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari "Apple"?',
    options: ['Pisang', 'Apel', 'Jeruk', 'Anggur'],
    correctAnswer: 'Apel',
  ),
  Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa terjemahan dari "Thank you"?',
    options: ['Terima kasih', 'Sama-sama', 'Halo', 'Selamat tinggal'],
    correctAnswer: 'Terima kasih',
  ),
  Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari "Water"?',
    options: ['Api', 'Udara', 'Air', 'Minyak'],
    correctAnswer: 'Air',
  ),
  Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa terjemahan dari "Good morning"?',
    options: ['Selamat malam', 'Selamat pagi', 'Selamat siang', 'Selamat sore'],
    correctAnswer: 'Selamat pagi',
  ),

  Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan bahasa Inggris dari "Kucing":',
    options: [],
    correctAnswer: 'cat',
  ),
  Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan bahasa Inggris dari "Buku":',
    options: [],
    correctAnswer: 'book',
  ),
  Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan bahasa Inggris dari "Rumah":',
    options: [],
    correctAnswer: 'house',
  ),

  Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun kalimat "Saya suka apel":',
    options: ['apples', 'I', 'like'],
    correctAnswer: 'I like apples',
  ),
  Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun kalimat "Siapa nama Anda?":',
    options: ['your', 'What', 'is', 'name?'],
    correctAnswer: 'What is your name?',
  ),
  Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun kalimat "Semoga harimu menyenangkan":',
    options: ['a', 'nice', 'Have', 'day'],
    correctAnswer: 'Have a nice day',
  ),
];