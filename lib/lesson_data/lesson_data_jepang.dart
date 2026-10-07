import '../models/lesson.dart';

final List<Lesson> lessonsJepang = [
  const Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari みず (mizu)?',
    options: ['Air', 'Api', 'Tanah', 'Angin'],
    correctAnswer: 'Air',
  ),
  const Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari ねこ (neko)?',
    options: ['Anjing', 'Kucing', 'Burung', 'Ikan'],
    correctAnswer: 'Kucing',
  ),
  const Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari ありがとう (arigatou)?',
    options: ['Selamat pagi', 'Maaf', 'Terima kasih', 'Selamat tinggal'],
    correctAnswer: 'Terima kasih',
  ),
  const Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari ほん (hon)?',
    options: ['Buku', 'Pena', 'Tas', 'Meja'],
    correctAnswer: 'Buku',
  ),
  const Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari いぬ (inu)?',
    options: ['Kucing', 'Anjing', 'Kelinci', 'Kuda'],
    correctAnswer: 'Anjing',
  ),
  const Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari せんせい (sensei)?',
    options: ['Siswa', 'Guru', 'Dokter', 'Polisi'],
    correctAnswer: 'Guru',
  ),
  const Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari たべもの (tabemono)?',
    options: ['Minuman', 'Makanan', 'Pakaian', 'Rumah'],
    correctAnswer: 'Makanan',
  ),

  const Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan romaji dari "Terima kasih" (arigatou):',
    options: [],
    correctAnswer: 'arigatou',
  ),
  const Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan romaji dari "Selamat pagi" (ohayou):',
    options: [],
    correctAnswer: 'ohayou',
  ),
  const Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan romaji dari "Air" (mizu):',
    options: [],
    correctAnswer: 'mizu',
  ),
  const Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan romaji dari "Maaf" (gomen):',
    options: [],
    correctAnswer: 'gomen',
  ),
  const Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan romaji dari "Kucing" (neko):',
    options: [],
    correctAnswer: 'neko',
  ),
  const Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan romaji dari "Sekolah" (gakkou):',
    options: [],
    correctAnswer: 'gakkou',
  ),

  const Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun ungkapan "Selamat siang":',
    options: ['wa', 'Konnichi'],
    correctAnswer: 'Konnichi wa',
  ),
  const Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun kalimat "Saya adalah siswa":',
    options: ['desu', 'gakusei', 'Watashi', 'wa'],
    correctAnswer: 'Watashi wa gakusei desu',
  ),
  const Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun salam "Selamat malam":',
    options: ['wa', 'Konban'],
    correctAnswer: 'Konban wa',
  ),
  const Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun kalimat "Selamat tinggal":',
    options: ['na', 'Sayoo', 'ra'],
    correctAnswer: 'Sayoo na ra',
  ),
  const Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun ungkapan "Sampai jumpa besok":',
    options: ['ashita', 'Mata'],
    correctAnswer: 'Mata ashita',
  ),
  const Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun ungkapan "Selamat makan":',
    options: ['masu', 'Itadaki'],
    correctAnswer: 'Itadaki masu',
  ),

  const Lesson(
    type: TipeSoal.dengarkata,
    question: 'Konnichiwa',
    options: ['こんにちは', 'おはよう', 'さようなら', 'ありがとう'],
    correctAnswer: 'こんにちは',
  ),
  const Lesson(
    type: TipeSoal.dengarkata,
    question: 'Arigatou',
    options: ['ありがとう', 'すみません', 'はい', 'いいえ'],
    correctAnswer: 'ありがとう',
  ),
  const Lesson(
    type: TipeSoal.dengarkata,
    question: 'Sayounara',
    options: ['さようなら', 'おはよう', 'こんばんは', 'じゃあね'],
    correctAnswer: 'さようなら',
  ),
  const Lesson(
    type: TipeSoal.dengarkata,
    question: 'Sumimasen',
    options: ['すみません', 'ごめんなさい', 'ありがとう', 'はい'],
    correctAnswer: 'すみません',
  ),
  const Lesson(
    type: TipeSoal.dengarkata,
    question: 'Oyasumi',
    options: ['おやすみ', 'おはよう', 'こんにちは', 'はじめまして'],
    correctAnswer: 'おやすみ',
  ),
  const Lesson(
    type: TipeSoal.dengarkata,
    question: 'Hai',
    options: ['はい', 'いいえ', 'みず', 'ねこ'],
    correctAnswer: 'はい',
  ),
];