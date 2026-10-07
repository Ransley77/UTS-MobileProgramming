import '../models/lesson.dart';

final List<Lesson> lessonsMandarin = [
  const Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari 你好 (Nǐ hǎo)?',
    options: ['Halo', 'Terima kasih', 'Selamat tinggal', 'Maaf'],
    correctAnswer: 'Halo',
  ),
  const Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari 谢谢 (Xièxie)?',
    options: ['Sama-sama', 'Maaf', 'Terima kasih', 'Tolong'],
    correctAnswer: 'Terima kasih',
  ),
  const Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari 水 (Shuǐ)?',
    options: ['Air', 'Api', 'Tanah', 'Minyak'],
    correctAnswer: 'Air',
  ),
  const Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari 猫 (Māo)?',
    options: ['Anjing', 'Kucing', 'Kelinci', 'Kuda'],
    correctAnswer: 'Kucing',
  ),
  const Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari 狗 (Gǒu)?',
    options: ['Anjing', 'Kucing', 'Ikan', 'Burung'],
    correctAnswer: 'Anjing',
  ),
  const Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari 家 (Jiā)?',
    options: ['Rumah', 'Sekolah', 'Toko', 'Kantor'],
    correctAnswer: 'Rumah',
  ),
  const Lesson(
    type: TipeSoal.pilihanganda,
    question: 'Apa arti dari 老师 (Lǎoshī)?',
    options: ['Guru', 'Murid', 'Dokter', 'Teman'],
    correctAnswer: 'Guru',
  ),

  const Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan Pinyin dari "Terima kasih" (tanpa nada):',
    options: [],
    correctAnswer: 'xiexie',
  ),
  const Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan Pinyin dari "Halo" (tanpa nada):',
    options: [],
    correctAnswer: 'ni hao',
  ),
  const Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan Pinyin dari "Selamat tinggal" (tanpa nada):',
    options: [],
    correctAnswer: 'zaijian',
  ),
  const Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan Pinyin dari "Maaf" (tanpa nada):',
    options: [],
    correctAnswer: 'duibuqi',
  ),
  const Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan Pinyin dari "Saya" (tanpa nada):',
    options: [],
    correctAnswer: 'wo',
  ),
  const Lesson(
    type: TipeSoal.ketikkan,
    question: 'Ketikkan Pinyin dari "Kamu" (tanpa nada):',
    options: [],
    correctAnswer: 'ni',
  ),

  const Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun Pinyin untuk "Saya mencintaimu":',
    options: ['ni', 'Wo', 'ai'],
    correctAnswer: 'Wo ai ni',
  ),
  const Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun Pinyin untuk "Selamat pagi":',
    options: ['shang', 'Zao', 'hao'],
    correctAnswer: 'Zao shang hao',
  ),
  const Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun Pinyin untuk "Tidak masalah":',
    options: ['guan', 'Mei', 'xi'],
    correctAnswer: 'Mei guan xi',
  ),
  const Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun Pinyin untuk "Sama-sama":',
    options: ['ke', 'Bu', 'qi'],
    correctAnswer: 'Bu ke qi',
  ),
  const Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun Pinyin untuk "Siapa nama Anda?":',
    options: ['shenme', 'Ni', 'mingzi?'],
    correctAnswer: 'Ni shenme mingzi?',
  ),
  const Lesson(
    type: TipeSoal.susunkata,
    question: 'Susun Pinyin untuk "Sampai jumpa besok":',
    options: ['tian', 'Ming', 'jian'],
    correctAnswer: 'Ming tian jian',
  ),

  const Lesson(
    type: TipeSoal.dengarkata,
    question: 'Ni hao',
    options: ['你好', '谢谢', '再见', '对不起'],
    correctAnswer: '你好',
  ),
  const Lesson(
    type: TipeSoal.dengarkata,
    question: 'Xiexie',
    options: ['谢谢', '你好', '不客气', '没关系'],
    correctAnswer: '谢谢',
  ),
  const Lesson(
    type: TipeSoal.dengarkata,
    question: 'Zaijian',
    options: ['再见', '早上好', '晚安', '你好'],
    correctAnswer: '再见',
  ),
  const Lesson(
    type: TipeSoal.dengarkata,
    question: 'Duibuqi',
    options: ['对不起', '没关系', '谢谢', '好的'],
    correctAnswer: '对不起',
  ),
  const Lesson(
    type: TipeSoal.dengarkata,
    question: 'Wo ai ni',
    options: ['我爱你', '你好吗', '再见吧', '谢谢你'],
    correctAnswer: '我爱你',
  ),
  const Lesson(
    type: TipeSoal.dengarkata,
    question: 'Shuǐ',
    options: ['水', '猫', '狗', '家'],
    correctAnswer: '水',
  ),
];