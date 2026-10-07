import '../models/lesson.dart';

final List<Lesson> lessonsKorea = [
  const Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari 안녕하세요 (Annyeonghaseyo)?',
    options: ['Halo', 'Terima kasih', 'Maaf', 'Selamat tinggal'],
    correctAnswer: 'Halo',
  ),
  const Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari 감사합니다 (Kamsahamnida)?',
    options: ['Sama-sama', 'Terima kasih', 'Permisi', 'Ya'],
    correctAnswer: 'Terima kasih',
  ),
  const Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari 물 (Mul)?',
    options: ['Air', 'Susu', 'Teh', 'Kopi'],
    correctAnswer: 'Air',
  ),
  const Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari 고양이 (Goyangi)?',
    options: ['Anjing', 'Kucing', 'Burung', 'Ikan'],
    correctAnswer: 'Kucing',
  ),
  const Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari 집 (Jib)?',
    options: ['Rumah', 'Sekolah', 'Toko', 'Taman'],
    correctAnswer: 'Rumah',
  ),
  const Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari 친구 (Chingu)?',
    options: ['Teman', 'Musuh', 'Kakak', 'Guru'],
    correctAnswer: 'Teman',
  ),
  const Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari 학교 (Hakgyo)?',
    options: ['Sekolah', 'Rumah Sakit', 'Pasar', 'Stasiun'],
    correctAnswer: 'Sekolah',
  ),

  const Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan Latin dari "Halo" (Annyeonghaseyo):',
    options: [],
    correctAnswer: 'annyeonghaseyo',
  ),
  const Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan Latin dari "Terima kasih" (Kamsahamnida):',
    options: [],
    correctAnswer: 'kamsahamnida',
  ),
  const Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan Latin dari "Ya" (Ne):',
    options: [],
    correctAnswer: 'ne',
  ),
  const Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan Latin dari "Tidak" (Aniyo):',
    options: [],
    correctAnswer: 'aniyo',
  ),
  const Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan Latin dari "Maaf" (Mianhae):',
    options: [],
    correctAnswer: 'mianhae',
  ),
  const Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan Latin dari "Susu" (Uyu):',
    options: [],
    correctAnswer: 'uyu',
  ),

  const Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun kata "Aku mencintaimu":',
    options: ['hae', 'Sarang'],
    correctAnswer: 'Sarang hae',
  ),
  const Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun ungkapan "Sampai jumpa lagi":',
    options: ['mannayo', 'Tto'],
    correctAnswer: 'Tto mannayo',
  ),
  const Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun ungkapan "Selamat tidur":',
    options: ['jumuseyo', 'Annyeonghi'],
    correctAnswer: 'Annyeonghi jumuseyo',
  ),
  const Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun kalimat "Selamat tinggal":',
    options: ['gaseyo', 'Annyeonghi'],
    correctAnswer: 'Annyeonghi gaseyo',
  ),
  const Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun ungkapan "Tidak apa-apa":',
    options: ['ayo', 'Gwaenchan'],
    correctAnswer: 'Gwaenchan ayo',
  ),
  const Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun ungkapan "Selamat makan":',
    options: ['kkesseumnida', 'Mas-issge', 'mueo'],
    correctAnswer: 'Mas-issge mueo kkesseumnida',
  ),

  const Lesson(
    type: TipeSoal.dengarkata,
    question: 'Annyeonghaseyo',
    options: ['안녕하세요', '감사합니다', '죄송합니다', '네'],
    correctAnswer: '안녕하세요',
  ),
  const Lesson(
    type: TipeSoal.dengarkata,
    question: 'Kamsahamnida',
    options: ['감사합니다', '안녕하세요', '아니요', '사랑해'],
    correctAnswer: '감사합니다',
  ),
  const Lesson(
    type: TipeSoal.dengarkata,
    question: 'Saranghae',
    options: ['사랑해', '미안해', '괜찮아', '잘가'],
    correctAnswer: '사랑해',
  ),
  const Lesson(
    type: TipeSoal.dengarkata,
    question: 'Mianhamnida',
    options: ['미안합니다', '감사합니다', '네', '아니요'],
    correctAnswer: '미안합니다',
  ),
  const Lesson(
    type: TipeSoal.dengarkata,
    question: 'Ne',
    options: ['네', '아니요', '물', '집'],
    correctAnswer: '네',
  ),
  const Lesson(
    type: TipeSoal.dengarkata,
    question: 'Gwaenchana',
    options: ['괜찮아', '사랑해', '고마워', '안녕'],
    correctAnswer: '괜찮아',
  ),
];