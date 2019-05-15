//
//  AccordionRegistration.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The accordion-registration type is use for accordion registration symbols. These are circular
/// symbols divided horizontally into high, middle, and low sections that correspond to 4', 8', and
/// 16' pipes. Each accordion-high, accordion-middle, and accordion-low element represents the
/// presence of one or more dots in the registration diagram. An accordion-registration element
/// needs to have at least one of the child elements present.
public struct AccordionRegistration {
    public let position: Position
    public let printStyle: PrintStyle
    public let hAlign: LeftCenterRight?
    public let vAlaign: VAlign?
}

extension AccordionRegistration: Equatable { }
extension AccordionRegistration: Decodable { }
