//
//  AccidentalValue.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

// > Valid values include: sharp,
// > natural, flat, double-sharp, sharp-sharp, flat-flat,
// > natural-sharp, natural-flat, quarter-flat, quarter-sharp,
// > three-quarters-flat, three-quarters-sharp, sharp-down,
// > sharp-up, natural-down, natural-up, flat-down, flat-up,
// > double-sharp-down, double-sharp-up, flat-flat-down,
// > flat-flat-up, arrow-down, arrow-up, triple-sharp,
// > triple-flat, slash-quarter-sharp, slash-sharp, slash-flat,
// > double-slash-flat, sharp-1, sharp-2, sharp-3, sharp-5,
// > flat-1, flat-2, flat-3, flat-4, sori, koron, and other.
// > The quarter- and three-quarters- accidentals are
// > Tartini-style quarter-tone accidentals. The -down and -up
// > accidentals are quarter-tone accidentals that include
// > arrows pointing down or up. The slash- accidentals
// > are used in Turkish classical music. The numbered
// > sharp and flat accidentals are superscripted versions
// > of the accidental signs, used in Turkish folk music.
// > The sori and koron accidentals are microtonal sharp and
// > flat accidentals used in Iranian and Persian music. The
// > other accidental covers accidentals other than those listed
// > here. It is usually used in combination with the smufl
// > attribute to specify a particular SMuFL accidental. The
// > smufl attribute may be used with any accidental value to
// > help specify the appearance of symbols that share the same
// > MusicXML semantics.
public enum AccidentalValue: String, Decodable, Equatable {
    case sharp
    case natural
    case flat
    case doubleSharp = "double-sharp"
    case sharpSharp = "sharp-sharp"
    case flatFlat = "flat-flat"
    case doubleFlat = "double-flat"
    case naturalSharp = "natural-sharp"
    case naturalFlat = "natural-flat"
    case quarterFlat = "quarter-flat"
    case quarterSharp = "quarter-sharp"
    case threeQuartersFlat = "three-quarters-flat"
    case threeQuartersSharp = "three-quarters-sharp"
    case sharpDown = "sharp-down"
    case sharpUp = "sharp-up"
    case naturalDown = "natural-down"
    case naturalUp = "natural-up"
    case flatDown = "flat-down"
    case flatUp = "flat-up"
    case doubleSharpDown = "double-sharp-down"
    case doubleSharpUp = "double-sharp-up"
    case flatFlatDown = "flat-flat-down"
    case flatFlatUp = "flat-flat-up"
    case arrowDown = "arrow-down"
    case arrowUp = "arrow-up"
    case tripleSharp = "triple-sharp"
    case tripleFlat = "triple-flat"
    case slashQuarterSharp = "slash-quarter-sharp"
    case slashSharp = "slash-sharp"
    case slashFlat = "slash-flat"
    case doubleSlashFlat = "double-slash-flat"
    case sharp1 = "sharp-1"
    case sharp2 = "sharp-2"
    case sharp3 = "sharp-3"
    case sharp5 = "sharp-5"
    case flat1 = "flat-1"
    case flat2 = "flat-2"
    case flat3 = "flat-3"
    case flat4 = "flat-4"
    case sori
    case koron
    case other
}
