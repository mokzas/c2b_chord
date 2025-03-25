// Note 표현 방식 분류
enum Notation {
  natural,
  sharp,
  flat,
}

// 12key의 모든 가능한 표현 방식
// suffix S는 sharp, F는 flat.
enum Note {
  c(0, "C", Notation.natural),
  bS(0, "B♯", Notation.sharp),
  cS(1, "C♯", Notation.sharp),
  dF(1, "D♭", Notation.flat),
  d(2, "D", Notation.natural),
  dS(3, "D♯", Notation.sharp),
  eF(3, "E♭", Notation.flat),
  e(4, "E", Notation.natural),
  fF(4, "F♭", Notation.flat),
  f(5, "F", Notation.natural),
  eS(5, "E♯", Notation.sharp),
  fS(6, "F♯", Notation.sharp),
  gF(6, "G♭", Notation.flat),
  g(7, "G", Notation.natural),
  gS(8, "G♯", Notation.sharp),
  aF(8, "A♭", Notation.flat),
  a(9, "A", Notation.natural),
  aS(10, "A♯", Notation.sharp),
  bF(10, "B♭", Notation.flat),
  b(11, "B", Notation.natural),
  cF(11, "C♭", Notation.flat);

  final int pitch;
  final String str;
  final Notation notation;

  const Note(this.pitch, this.str, this.notation);
}

// Note 중 실제 악보상에서 만나기 어려운 경우를 제외한 리스트
const List<Note> rootNotes = [
  Note.c,
  Note.cS,
  Note.dF,
  Note.d,
  Note.dS,
  Note.eF,
  Note.e,
  Note.f,
  Note.fS,
  Note.gF,
  Note.g,
  Note.gS,
  Note.aF,
  Note.a,
  Note.aS,
  Note.bF,
  Note.b
];

// 하나의 chord quality를 구성하는 속성들의 정보
// chord 선택 화면의 filter 기능에 사용
const List<Map<String, String>> qualityProperties = [
  {"name": "M", "group": "Triad"},
  {"name": "m", "group": "Triad"},
  {"name": "dim", "group": "Triad"},
  {"name": "aug", "group": "Triad"},
  {"name": "sus2", "group": "Triad"},
  {"name": "sus4", "group": "Triad"},
  {"name": "Quartal", "group": "Triad"},
  {"name": "M7", "group": "7th"},
  {"name": "m7", "group": "7th"},
  {"name": "7", "group": "7th"},
  {"name": "dim7", "group": "7th"},
  {"name": "aug7", "group": "7th"},
  {"name": "7sus2", "group": "7th"},
  {"name": "7sus4", "group": "7th"},
  {"name": "M7sus2", "group": "7th"},
  {"name": "M7sus4", "group": "7th"},
  {"name": "ø7", "group": "7th"},
  {"name": "mM7", "group": "7th"},
  {"name": "augM7", "group": "7th"},
  {"name": "6", "group": "Extension"},
  {"name": "9", "group": "Extension"},
  {"name": "11", "group": "Extension"},
  {"name": "13", "group": "Extension"},
  {"name": "♭5", "group": "Alter, add"},
  {"name": "♯5", "group": "Alter, add"},
  {"name": "♭9", "group": "Alter, add"},
  {"name": "♯9", "group": "Alter, add"},
  {"name": "♯11", "group": "Alter, add"},
  {"name": "♭13", "group": "Alter, add"},
  {"name": "alt", "group": "Alter, add"},
  {"name": "add2", "group": "Alter, add"},
  {"name": "add9", "group": "Alter, add"},
  {"name": "add11", "group": "Alter, add"},
  {"name": "add13", "group": "Alter, add"},
];
