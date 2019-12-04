//
//  Printout.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The printout attribute group collects the different controls over printing an object (e.g. a
/// note or rest) and its parts, including augmentation dots and lyrics. This is especially useful
/// for notes that overlap in different voices, or for chord sheets that contain lyrics and chords
/// but no melody.
///
/// By default, all these attributes are set to yes. If print-object is set to no, the print-dot and
/// print-lyric attributes are interpreted to also be set to no if they are not present.
public struct Printout {
    // MARK: - Instance Properties
    
    // MARK: Attributes

    public let printObject: Bool?
    public let printDot: Bool?
    public let printSpacing: Bool?
    public let printLyric: Bool?

    // MARK: - Initializers

    public init(
        printObject: Bool? = nil,
        printDot: Bool? = nil,
        printSpacing: Bool? = nil,
        printLyric: Bool? = nil
    ) {
        self.printObject = printObject
        self.printDot = printDot
        self.printSpacing = printSpacing
        self.printLyric = printLyric
    }
}

extension Printout: Equatable {}
extension Printout: Codable {}
