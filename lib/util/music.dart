
enum Notation {
  natural,
  sharp,
  flat,
}

enum Note {
  c(0, "C", Notation.natural), bS(0, "B♯", Notation.sharp),
  cS(1, "C♯", Notation.sharp), dF(1, "D♭", Notation.flat),
  d(2, "D", Notation.natural),
  dS(3, "D♯", Notation.sharp), eF(3, "E♭", Notation.flat),
  e(4, "E", Notation.natural), fF(4, "F♭", Notation.flat),
  f(5, "F", Notation.natural), eS(5, "E♯", Notation.sharp),
  fS(6, "F♯", Notation.sharp), gF(6, "G♭", Notation.flat),
  g(7, "G", Notation.natural),
  gS(8, "G♯", Notation.sharp), aF(8, "A♭", Notation.flat),
  a(9, "A", Notation.natural),
  aS(10, "A♯", Notation.sharp), bF(10, "B♭", Notation.flat),
  b(11, "B", Notation.natural), cF(11, "C♭", Notation.flat);

  final int pitch;
  final String str;
  final Notation notation;

  const Note(this.pitch, this.str, this.notation);
}

List<Note> c_rootNotes = [
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

Map<int, Note> c_sharpNotes = {
  0: Note.c,
  1: Note.cS,
  2: Note.d,
  3: Note.dS,
  4: Note.e,
  5: Note.eS,
  6: Note.fS,
  7: Note.g,
  8: Note.gS,
  9: Note.a,
  10: Note.aS,
  11: Note.b,
};
Map<int, Note> c_flatNotes = {
  0: Note.c,
  1: Note.dF,
  2: Note.d,
  3: Note.eF,
  4: Note.e,
  5: Note.f,
  6: Note.gF,
  7: Note.g,
  8: Note.aF,
  9: Note.a,
  10: Note.bF,
  11: Note.b,
};

// const List<Chord> chordList = [
//   Chord(name: "CM", nameAlt: ["CMaj", "CΔ"], root: Note.c, tones: [Note.c, Note.e, Note.g]),
//   Chord(name: "Cm", nameAlt: ["C", "C–"], root: Note.c, tones: [Note.c, Note.eF, Note.g]),
//   Chord(name: "DM", nameAlt: ["DMaj", "DΔ"], root: Note.d, tones: [Note.d, Note.fS, Note.a]),
// ];

/* Integer Notation
M: [0, 4, 7]
m: [0, 3, 7]
dim: [0, 3, 6]
aug: [0, 4, 8]
sus2: [0, 2, 7]
sus4: [0, 5, 7]
quartal: [0, 5, 10]

M7: [0, 4, 7, 11]
m7: [0, 3, 7, 10]
7: [0, 4, 7, 10]
dim7: [0, 3, 6, 9]
aug7: [0, 4, 8, 10]
7sus2: [0, 2, 7, 10]
7sus4: [0, 5, 7, 10]
mM7: [0, 3, 7, 11]
ø7: [0, 3, 6, 10]
quartal7: [0, 5, 10, 15]

6: [0, 4, 7, 9]
6/7: [0, 4, 7, 9, 10]
6/9: [0, 4, 7, 9, 14]
m6: [0, 3, 7, 9]
m6/7: [0, 3, 7, 9, 10]
M9: [0, 4, 7, 11, 14]
m9: [0, 3, 7, 10, 14]
9: [0, 4, 7, 10, 14]
mM9: [0, 3, 7, 11, 14]
9sus4: [0, 5, 7, 10, 14]
m11: [0, 3, 7, 10, 14, 17]
11: [0, 4, 7, 10, 14, 17]
11♯: [0, 4, 7, 10, 14, 18]
M13: [0, 4, 7, 11, 14, 17, 21]
m13: [0, 3, 7, 10, 14, 17, 21]
13: [0, 4, 7, 10, 14, 17, 21]
mM13: [0, 3, 7, 11, 14, 17, 21]

M7♭5: [0, 4, 6, 11]
M7♯5: [0, 4, 8, 11]
M7♭9: [0, 4, 7, 11, 13]
M7♯11: [0, 4, 7, 11, 18]
m7♭5: [0, 3, 6, 10]
m7♭9: [0, 3, 7, 10, 13]
m7♭9♭5: [0, 3, 6, 10, 13]
7♭5: [0, 4, 6, 10]
7♯5: [0, 4, 8, 10]
7sus4♭9: [0, 5, 7, 10, 13]
7♭9: [0, 4, 7, 10, 13]
7♭9♭5: [0, 4, 6, 10, 13]
7♭9♯5: [0, 4, 8, 10, 13]
7♭9♯9: [0, 4, 7, 10, 13, 15]
7♯9: [0, 4, 7, 10, 15]
7♯9♯5: [0, 4, 8, 10, 15]
7♯11: [0, 4, 7, 10, 18]
7(13): [0, 4, 7, 10, 14, 17, 21]
7♭13: [0, 4, 7, 10, 14, 17, 20]
7alt: [0, 4, 6, 10, 13]

M9♭5: [0, 4, 6, 11, 14]
m9♭5: [0, 3, 6, 10, 14]
9♯5: [0, 4, 8, 10, 14]
9♭5: [0, 4, 6, 10, 14]
9♯11: [0, 4, 7, 10, 14, 18]
13♯11: [0, 4, 7, 10, 14, 18, 21]

add2: [0, 2, 4, 7]
add9: [0, 4, 7, 14]
add11: [0, 4, 7, 17]
m(add2): [0, 2, 3, 7]
m(add9): [0, 3, 7, 14]
m(add11): [0, 3, 7, 17]


-------------------------------
 */
