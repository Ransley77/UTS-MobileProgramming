import '../models/lesson.dart';

final List<Lesson> lessonsKorea = [
  Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari 안녕하세요 (Annyeonghaseyo)?',
    options: ['Halo', 'Terima kasih', 'Maaf', 'Selamat tinggal'],
    correctAnswer: 'Halo',
  ),
  Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari 감사합니다 (Kamsahamnida)?',
    options: ['Sama-sama', 'Terima kasih', 'Permisi', 'Ya'],
    correctAnswer: 'Terima kasih',
  ),
  Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari 물 (Mul)?',
    options: ['Air', 'Susu', 'Teh', 'Kopi'],
    correctAnswer: 'Air',
  ),
  Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari 고양이 (Goyangi)?',
    options: ['Anjing', 'Kucing', 'Burung', 'Ikan'],
    correctAnswer: 'Kucing',
  ),

  Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan Romaji/Latin dari "Halo" (Annyeonghaseyo):',
    options: [],
    correctAnswer: 'annyeonghaseyo',
  ),
  Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan Romaji/Latin dari "Terima kasih" (Kamsahamnida):',
    options: [],
    correctAnswer: 'kamsahamnida',
  ),
  Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan Romaji/Latin dari "Ya" (Ne):',
    options: [],
    correctAnswer: 'ne',
  ),

  Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun kata menjadi "Aku mencintaimu":',
    options: ['hae', 'Sarang'],
    correctAnswer: 'Sarang hae',
  ),
  Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun kata menjadi ungkapan "Sampai jumpa lagi":',
    options: ['mannayo', 'Tto'],
    correctAnswer: 'Tto mannayo',
  ),
  Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun kata menjadi ungkapan "Selamat tidur":',
    options: ['jumo-seyo', 'Annyeong-hi'],
    correctAnswer: 'Annyeong-hi jumo-seyo',
  ),
];