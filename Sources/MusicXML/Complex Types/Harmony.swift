//
//  Harmony.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The harmony type is based on Humdrum's **harm encoding, extended to support chord symbols in
/// popular music as well as functional harmony analysis in classical music. If there are alternate
/// harmonies possible, this can be specified using multiple harmony elements differentiated by
/// type. Explicit harmonies have all notes present in the music; implied have some notes missing
/// but implied; alternate represents alternate analyses. The harmony object may be used for
/// analysis or for chord symbols. The print-object attribute controls whether or not anything is
/// printed due to the harmony element. The print-style attribute group sets the default for the
/// harmony, but individual elements can override this with their own print-style values.
public struct Harmony {
    public let type: HarmonyType
    public let printObject: Bool
    /// The print-frame attribute controls printing of a frame or fretboard diagram.
    public let printFrame: Bool?
    public let printStyle: PrintStyle?
    public let placement: AboveBelow?
    public let chord: [HarmonyChord] // NonEmpty
    public let frame: Frame?
    public let offset: Offset?
    public let editorial: Editorial?
    public let staff: Int?
}

extension Harmony: Equatable { }
extension Harmony: Decodable { }
