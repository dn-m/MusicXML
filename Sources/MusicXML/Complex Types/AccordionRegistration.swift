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

    // MARK: - Instance Properties

    // MARK: Attribute Groups

    public let printStyleAlign: PrintStyleAlign

    // MARK: Elements

    public let high: Bool
    public let middle: AccordionMiddle?
    public let low: Bool

    // MARK: - Initializers

    public init(
        printStyleAlign: PrintStyleAlign = PrintStyleAlign(),
        accordionHigh: Bool = false,
        accordionMiddle: AccordionMiddle? = nil,
        accordionLow: Bool = false
    ) {
        self.printStyleAlign = printStyleAlign
        self.high = accordionHigh
        self.middle = accordionMiddle
        self.low = accordionLow
    }
}

extension AccordionRegistration: Equatable { }
extension AccordionRegistration: Codable {
    private enum CodingKeys: String, CodingKey {
        case high = "accordion-high"
        case middle = "accordion-middle"
        case low = "accordion-low"
    }

    public func encode(to encoder: Encoder) throws {
        fatalError()
    }

    public init(from decoder: Decoder) throws {
        self.printStyleAlign = try PrintStyleAlign(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.high = container.contains(.high)
        self.low = container.contains(.low)
        self.middle = try container.decodeIfPresent(AccordionMiddle.self, forKey: .middle)
    }
}
