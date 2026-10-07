import '../models/lesson.dart';

final List<Lesson> lessonsMandarin = [
  Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari 你好 (Nǐ hǎo)?',
    options: ['Halo', 'Terima kasih', 'Selamat tinggal', 'Maaf'],
    correctAnswer: 'Halo',
  ),
  Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari 谢谢 (Xièxie)?',
    options: ['Sama-sama', 'Maaf', 'Terima kasih', 'Tolong'],
    correctAnswer: 'Terima kasih',
  ),
  Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari 水 (Shuǐ)?',
    options: ['Air', 'Api', 'Tanah', 'Minyak'],
    correctAnswer: 'Air',
  ),
  Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari 猫 (Māo)?',
    options: ['Anjing', 'Kucing', 'Kelinci', 'Kuda'],
    correctAnswer: 'Kucing',
  ),

  Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan Pinyin dari "Terima kasih" (tanpa nada):',
    options: [],
    correctAnswer: 'xiexie',
  ),
  Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan Pinyin dari "Halo" (tanpa nada):',
    options: [],
    correctAnswer: 'ni hao',
  ),
  Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan Pinyin dari "Selamat tinggal" (tanpa nada):',
    options: [],
    correctAnswer: 'zaijian',
  ),

  Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun Pinyin untuk kalimat "Saya mencintaimu":',
    options: ['ni', 'Wo', 'ai'],
    correctAnswer: 'Wo ai ni',
  ),
  Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun Pinyin untuk kalimat "Nama saya adalah...":',
    options: ['jia', 'Wo', 'mingzi'],
    correctAnswer: 'Wo jiao mingzi',
  ),
  Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun Pinyin untuk kalimat "Selamat pagi":',
    options: ['shang', 'Zao', 'hao'],
    correctAnswer: 'Zao shang hao',
  ),
];