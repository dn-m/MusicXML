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
    public let printStyleAlign: PrintStyleAlign
    public let accordionHigh: Empty?
    public let accordionMiddle: AccordionMiddle?
    public let accordionLow: Empty?

    public init(printStyleAlign: PrintStyleAlign = PrintStyleAlign(), accordionHigh: Empty? = nil, accordionMiddle: AccordionMiddle? = nil, accordionLow: Empty? = nil) {
        self.printStyleAlign = printStyleAlign
        self.accordionHigh = accordionHigh
        self.accordionMiddle = accordionMiddle
        self.accordionLow = accordionLow
    }
}

extension AccordionRegistration: Equatable { }
extension AccordionRegistration: Codable {
    private enum CodingKeys: String, CodingKey {
        case accordionHigh = "accordion-high"
        case accordionMiddle = "accordion-middle"
        case accordionLow = "accordion-low"
    }

    public func encode(to encoder: Encoder) throws {
        fatalError()
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.printStyleAlign = try PrintStyleAlign(from: decoder)
        self.accordionHigh = try container.decodeIfPresent(Empty.self, forKey: .accordionHigh)
        self.accordionMiddle = try container.decodeIfPresent(AccordionMiddle.self, forKey: .accordionMiddle)
        self.accordionLow = try container.decodeIfPresent(Empty.self, forKey: .accordionLow)
    }
}
