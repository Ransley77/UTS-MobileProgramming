import '../models/lesson.dart';

final List<Lesson> lessonsJepang = [
 
  Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari みず (mizu)?',
    options: ['Air', 'Api', 'Tanah', 'Angin'],
    correctAnswer: 'Air',
  ),
  Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari ねこ (neko)?',
    options: ['Anjing', 'Kucing', 'Burung', 'Ikan'],
    correctAnswer: 'Kucing',
  ),
  Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari ありがとう (arigatou)?',
    options: ['Selamat pagi', 'Maaf', 'Terima kasih', 'Selamat tinggal'],
    correctAnswer: 'Terima kasih',
  ),
  Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari ほん (hon)?',
    options: ['Buku', 'Pena', 'Tas', 'Meja'],
    correctAnswer: 'Buku',
  ),

 
  Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan bahasa Jepang (romaji) dari "Terima kasih":',
    options: [],
    correctAnswer: 'arigatou',
  ),
  Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan bahasa Jepang (romaji) dari "Selamat pagi":',
    options: [],
    correctAnswer: 'ohayou',
  ),
  Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan bahasa Jepang (romaji) dari "Air":',
    options: [],
    correctAnswer: 'mizu',
  ),

  
  Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun kata menjadi ungkapan "Selamat siang":',
    options: ['wa', 'Konnichi'],
    correctAnswer: 'Konnichi wa',
  ),
  Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun kata menjadi "Saya adalah siswa":',
    options: ['desu', 'Gakusei', 'Watashi', 'wa'],
    correctAnswer: 'Watashi wa Gakusei desu',
  ),
  Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun kata menjadi salam "Selamat malam":',
    options: ['wa', 'Konban'],
    correctAnswer: 'Konban wa',
  ),
];