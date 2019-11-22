//
//  ClefSign.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// Sign values include G, F, C, percussion, TAB, jianpu, and none.
///
/// The jianpu sign indicates that the music that follows should be in jianpu numbered notation,
/// just as the TAB sign indicates that the music that follows should be in tablature notation.
/// Unlike TAB, a jianpu sign does not correspond to a visual clef notation. Sometimes clefs are
/// added to the staff in non-standard line positions, either to indicate cue passages, or when
/// there are multiple clefs present simultaneously on one staff. In this situation, the additional
/// attribute is set to "yes" and the line value is ignored. The size attribute is used for clefs
/// where the additional attribute is "yes". It is typically used to indicate cue clefs. Sometimes
/// clefs at the start of a measure need to appear after the barline rather than before, as for cues
/// or for use after a repeated section. The after-barline attribute is set to "yes" in this
/// situation. The attribute is ignored  for mid-measure clefs. Clefs appear at the start of each
/// system unless the print-object attribute has been set to "no" or the additional attribute has
/// been set to "yes".
public enum ClefSign: String {
    case g = "G"
    case f = "F"
    case c = "C"
    case percussion
    case TAB
    case jianpu
    case none
}

extension ClefSign: Equatable {}
extension ClefSign: Codable {}
