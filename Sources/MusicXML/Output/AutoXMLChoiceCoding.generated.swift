// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



// sourcery:inline:Technique.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .arrow:
        try container.encodeNil(forKey: .arrow)
    case .bend:
        try container.encodeNil(forKey: .bend)
    case .doubleTongue:
        try container.encodeNil(forKey: .doubleTongue)
    case .downBow:
        try container.encodeNil(forKey: .downBow)
    case .fingering:
        try container.encodeNil(forKey: .fingering)
    case .fingernails:
        try container.encodeNil(forKey: .fingernails)
    case .fret:
        try container.encodeNil(forKey: .fret)
    case .hammerOn:
        try container.encodeNil(forKey: .hammerOn)
    case .handbell:
        try container.encodeNil(forKey: .handbell)
    case .harmonic:
        try container.encodeNil(forKey: .harmonic)
    case .heel:
        try container.encodeNil(forKey: .heel)
    case .openString:
        try container.encodeNil(forKey: .openString)
    case .otherTechnical:
        try container.encodeNil(forKey: .otherTechnical)
    case .pluck:
        try container.encodeNil(forKey: .pluck)
    case .pullOff:
        try container.encodeNil(forKey: .pullOff)
    case .snapPizzicato:
        try container.encodeNil(forKey: .snapPizzicato)
    case .string:
        try container.encodeNil(forKey: .string)
    case .tap:
        try container.encodeNil(forKey: .tap)
    case .thumbPosition:
        try container.encodeNil(forKey: .thumbPosition)
    case .toe:
        try container.encodeNil(forKey: .toe)
    case .tripleTongue:
        try container.encodeNil(forKey: .tripleTongue)
    case .upBow:
        try container.encodeNil(forKey: .upBow)
    }
}
// sourcery:end

// sourcery:inline:Technique.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.arrow) {
        _ = try container.decodeNil(forKey: .arrow)
        self = .arrow
    } else if container.contains(.bend) {
        _ = try container.decodeNil(forKey: .bend)
        self = .bend
    } else if container.contains(.doubleTongue) {
        _ = try container.decodeNil(forKey: .doubleTongue)
        self = .doubleTongue
    } else if container.contains(.downBow) {
        _ = try container.decodeNil(forKey: .downBow)
        self = .downBow
    } else if container.contains(.fingering) {
        _ = try container.decodeNil(forKey: .fingering)
        self = .fingering
    } else if container.contains(.fingernails) {
        _ = try container.decodeNil(forKey: .fingernails)
        self = .fingernails
    } else if container.contains(.fret) {
        _ = try container.decodeNil(forKey: .fret)
        self = .fret
    } else if container.contains(.hammerOn) {
        _ = try container.decodeNil(forKey: .hammerOn)
        self = .hammerOn
    } else if container.contains(.handbell) {
        _ = try container.decodeNil(forKey: .handbell)
        self = .handbell
    } else if container.contains(.harmonic) {
        _ = try container.decodeNil(forKey: .harmonic)
        self = .harmonic
    } else if container.contains(.heel) {
        _ = try container.decodeNil(forKey: .heel)
        self = .heel
    } else if container.contains(.openString) {
        _ = try container.decodeNil(forKey: .openString)
        self = .openString
    } else if container.contains(.otherTechnical) {
        _ = try container.decodeNil(forKey: .otherTechnical)
        self = .otherTechnical
    } else if container.contains(.pluck) {
        _ = try container.decodeNil(forKey: .pluck)
        self = .pluck
    } else if container.contains(.pullOff) {
        _ = try container.decodeNil(forKey: .pullOff)
        self = .pullOff
    } else if container.contains(.snapPizzicato) {
        _ = try container.decodeNil(forKey: .snapPizzicato)
        self = .snapPizzicato
    } else if container.contains(.string) {
        _ = try container.decodeNil(forKey: .string)
        self = .string
    } else if container.contains(.tap) {
        _ = try container.decodeNil(forKey: .tap)
        self = .tap
    } else if container.contains(.thumbPosition) {
        _ = try container.decodeNil(forKey: .thumbPosition)
        self = .thumbPosition
    } else if container.contains(.toe) {
        _ = try container.decodeNil(forKey: .toe)
        self = .toe
    } else if container.contains(.tripleTongue) {
        _ = try container.decodeNil(forKey: .tripleTongue)
        self = .tripleTongue
    } else if container.contains(.upBow) {
        _ = try container.decodeNil(forKey: .upBow)
        self = .upBow
    } else {
        throw DecodingError.typeMismatch(
            Technique.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
