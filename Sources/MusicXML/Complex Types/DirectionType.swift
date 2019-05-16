//
//  DirectionType.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// Textual direction types may have more than 1 component due to multiple fonts. The dynamics
/// element may also be used in the notations element. Attribute groups related to print suggestions
/// apply to the individual direction-type, not to the overall direction.
public enum DirectionType {
    case accordionRegistration(AccordionRegistration)
    case bracket(Bracket)
    case coda(EmptyPrintStyleAlign)
    case damp(EmptyPrintStyleAlign)
    case dampAll(EmptyPrintStyleAlign)
    case dashes(Dashes)
    case dynamics(Dynamics)
    case eyeglasses(EmptyPrintStyleAlign)
    case harpPedals(HarpPedals)
    case image(Image)
    case metronome(Metronome)
    case octaveShift(OctaveShift)
    case otherDirection(OtherDirection)
    case pedal(Pedal)
    case percussion(Percussion)
}

extension DirectionType: Equatable { }

extension DirectionType: Decodable {
    #warning("TODO: Implement DirectionType: Decodable conformance")
    public init(from decoder: Decoder) throws {
        fatalError("DirectionType.init(from: Decoder) not yet implemented!")
    }
}
