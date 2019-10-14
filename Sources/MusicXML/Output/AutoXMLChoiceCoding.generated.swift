// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// sourcery:inline:Accidental.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .cautionary:
        try container.encodeNil(forKey: .cautionary)
    case .editorial:
        try container.encodeNil(forKey: .editorial)
    case .parentheses:
        try container.encodeNil(forKey: .parentheses)
    case .bracket:
        try container.encodeNil(forKey: .bracket)
    case .size:
        try container.encodeNil(forKey: .size)
    case .position:
        try container.encodeNil(forKey: .position)
    case .printStyle:
        try container.encodeNil(forKey: .printStyle)
    case .value:
        try container.encodeNil(forKey: .value)
    }
}
// sourcery:end

// sourcery:inline:Accidental.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.cautionary) {
        _ = try container.decodeNil(forKey: .cautionary)
        self = .cautionary
    } else if container.contains(.editorial) {
        _ = try container.decodeNil(forKey: .editorial)
        self = .editorial
    } else if container.contains(.parentheses) {
        _ = try container.decodeNil(forKey: .parentheses)
        self = .parentheses
    } else if container.contains(.bracket) {
        _ = try container.decodeNil(forKey: .bracket)
        self = .bracket
    } else if container.contains(.size) {
        _ = try container.decodeNil(forKey: .size)
        self = .size
    } else if container.contains(.position) {
        _ = try container.decodeNil(forKey: .position)
        self = .position
    } else if container.contains(.printStyle) {
        _ = try container.decodeNil(forKey: .printStyle)
        self = .printStyle
    } else if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else {
        throw DecodingError.typeMismatch(
            Accidental.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:AccidentalMark.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .position:
        try container.encodeNil(forKey: .position)
    case .placement:
        try container.encodeNil(forKey: .placement)
    case .printStyle:
        try container.encodeNil(forKey: .printStyle)
    }
}
// sourcery:end

// sourcery:inline:AccidentalMark.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.position) {
        _ = try container.decodeNil(forKey: .position)
        self = .position
    } else if container.contains(.placement) {
        _ = try container.decodeNil(forKey: .placement)
        self = .placement
    } else if container.contains(.printStyle) {
        _ = try container.decodeNil(forKey: .printStyle)
        self = .printStyle
    } else {
        throw DecodingError.typeMismatch(
            AccidentalMark.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:AccidentalText.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .justify:
        try container.encodeNil(forKey: .justify)
    case .hAlign:
        try container.encodeNil(forKey: .hAlign)
    case .vAlign:
        try container.encodeNil(forKey: .vAlign)
    case .underline:
        try container.encodeNil(forKey: .underline)
    case .overline:
        try container.encodeNil(forKey: .overline)
    case .lineThrough:
        try container.encodeNil(forKey: .lineThrough)
    case .rotation:
        try container.encodeNil(forKey: .rotation)
    case .letterSpacing:
        try container.encodeNil(forKey: .letterSpacing)
    case .lineHeight:
        try container.encodeNil(forKey: .lineHeight)
    case .direction:
        try container.encodeNil(forKey: .direction)
    case .enclosure:
        try container.encodeNil(forKey: .enclosure)
    case .value:
        try container.encodeNil(forKey: .value)
    }
}
// sourcery:end

// sourcery:inline:AccidentalText.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.justify) {
        _ = try container.decodeNil(forKey: .justify)
        self = .justify
    } else if container.contains(.hAlign) {
        _ = try container.decodeNil(forKey: .hAlign)
        self = .hAlign
    } else if container.contains(.vAlign) {
        _ = try container.decodeNil(forKey: .vAlign)
        self = .vAlign
    } else if container.contains(.underline) {
        _ = try container.decodeNil(forKey: .underline)
        self = .underline
    } else if container.contains(.overline) {
        _ = try container.decodeNil(forKey: .overline)
        self = .overline
    } else if container.contains(.lineThrough) {
        _ = try container.decodeNil(forKey: .lineThrough)
        self = .lineThrough
    } else if container.contains(.rotation) {
        _ = try container.decodeNil(forKey: .rotation)
        self = .rotation
    } else if container.contains(.letterSpacing) {
        _ = try container.decodeNil(forKey: .letterSpacing)
        self = .letterSpacing
    } else if container.contains(.lineHeight) {
        _ = try container.decodeNil(forKey: .lineHeight)
        self = .lineHeight
    } else if container.contains(.direction) {
        _ = try container.decodeNil(forKey: .direction)
        self = .direction
    } else if container.contains(.enclosure) {
        _ = try container.decodeNil(forKey: .enclosure)
        self = .enclosure
    } else if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else {
        throw DecodingError.typeMismatch(
            AccidentalText.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Accord.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .string:
        try container.encodeNil(forKey: .string)
    case .tuningStep:
        try container.encodeNil(forKey: .tuningStep)
    case .tuningAlter:
        try container.encodeNil(forKey: .tuningAlter)
    case .tuningOctave:
        try container.encodeNil(forKey: .tuningOctave)
    }
}
// sourcery:end

// sourcery:inline:Accord.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.string) {
        _ = try container.decodeNil(forKey: .string)
        self = .string
    } else if container.contains(.tuningStep) {
        _ = try container.decodeNil(forKey: .tuningStep)
        self = .tuningStep
    } else if container.contains(.tuningAlter) {
        _ = try container.decodeNil(forKey: .tuningAlter)
        self = .tuningAlter
    } else if container.contains(.tuningOctave) {
        _ = try container.decodeNil(forKey: .tuningOctave)
        self = .tuningOctave
    } else {
        throw DecodingError.typeMismatch(
            Accord.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:AccordionRegistration.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .accordionHigh:
        try container.encodeNil(forKey: .accordionHigh)
    case .accordionMiddle:
        try container.encodeNil(forKey: .accordionMiddle)
    case .accordionLow:
        try container.encodeNil(forKey: .accordionLow)
    }
}
// sourcery:end

// sourcery:inline:AccordionRegistration.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.accordionHigh) {
        _ = try container.decodeNil(forKey: .accordionHigh)
        self = .accordionHigh
    } else if container.contains(.accordionMiddle) {
        _ = try container.decodeNil(forKey: .accordionMiddle)
        self = .accordionMiddle
    } else if container.contains(.accordionLow) {
        _ = try container.decodeNil(forKey: .accordionLow)
        self = .accordionLow
    } else {
        throw DecodingError.typeMismatch(
            AccordionRegistration.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Arrow.Kind.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .circular(value):
        try container.encode(value, forKey: .circular)
    case let .linear(value):
        try container.encode(value, forKey: .linear)
    }
}
// sourcery:end

// sourcery:inline:Arrow.Kind.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.circular) {
        self = .circular(try decode(.circular))
    } else if container.contains(.linear) {
        self = .linear(try decode(.linear))
    } else {
        throw DecodingError.typeMismatch(
            Arrow.Kind.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Arrow.Kind.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .circular:
        try container.encodeNil(forKey: .circular)
    case .linear:
        try container.encodeNil(forKey: .linear)
    }
}
// sourcery:end

// sourcery:inline:Arrow.Kind.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.circular) {
        _ = try container.decodeNil(forKey: .circular)
        self = .circular
    } else if container.contains(.linear) {
        _ = try container.decodeNil(forKey: .linear)
        self = .linear
    } else {
        throw DecodingError.typeMismatch(
            Arrow.Kind.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Articulation.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .accent(value):
        try container.encode(value, forKey: .accent)
    case let .breathMark(value):
        try container.encode(value, forKey: .breathMark)
    case let .caesura(value):
        try container.encode(value, forKey: .caesura)
    case let .detachedLegato(value):
        try container.encode(value, forKey: .detachedLegato)
    case let .doit(value):
        try container.encode(value, forKey: .doit)
    case let .falloff(value):
        try container.encode(value, forKey: .falloff)
    case let .otherArticulation(value):
        try container.encode(value, forKey: .otherArticulation)
    case let .plop(value):
        try container.encode(value, forKey: .plop)
    case let .scoop(value):
        try container.encode(value, forKey: .scoop)
    case let .spiccato(value):
        try container.encode(value, forKey: .spiccato)
    case let .staccatissimo(value):
        try container.encode(value, forKey: .staccatissimo)
    case let .staccato(value):
        try container.encode(value, forKey: .staccato)
    case let .stress(value):
        try container.encode(value, forKey: .stress)
    case let .strongAccent(value):
        try container.encode(value, forKey: .strongAccent)
    case let .tenuto(value):
        try container.encode(value, forKey: .tenuto)
    case let .unstress(value):
        try container.encode(value, forKey: .unstress)
    }
}
// sourcery:end

// sourcery:inline:Articulation.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.accent) {
        self = .accent(try decode(.accent))
    } else if container.contains(.breathMark) {
        self = .breathMark(try decode(.breathMark))
    } else if container.contains(.caesura) {
        self = .caesura(try decode(.caesura))
    } else if container.contains(.detachedLegato) {
        self = .detachedLegato(try decode(.detachedLegato))
    } else if container.contains(.doit) {
        self = .doit(try decode(.doit))
    } else if container.contains(.falloff) {
        self = .falloff(try decode(.falloff))
    } else if container.contains(.otherArticulation) {
        self = .otherArticulation(try decode(.otherArticulation))
    } else if container.contains(.plop) {
        self = .plop(try decode(.plop))
    } else if container.contains(.scoop) {
        self = .scoop(try decode(.scoop))
    } else if container.contains(.spiccato) {
        self = .spiccato(try decode(.spiccato))
    } else if container.contains(.staccatissimo) {
        self = .staccatissimo(try decode(.staccatissimo))
    } else if container.contains(.staccato) {
        self = .staccato(try decode(.staccato))
    } else if container.contains(.stress) {
        self = .stress(try decode(.stress))
    } else if container.contains(.strongAccent) {
        self = .strongAccent(try decode(.strongAccent))
    } else if container.contains(.tenuto) {
        self = .tenuto(try decode(.tenuto))
    } else if container.contains(.unstress) {
        self = .unstress(try decode(.unstress))
    } else {
        throw DecodingError.typeMismatch(
            Articulation.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Articulation.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .accent:
        try container.encodeNil(forKey: .accent)
    case .breathMark:
        try container.encodeNil(forKey: .breathMark)
    case .caesura:
        try container.encodeNil(forKey: .caesura)
    case .detachedLegato:
        try container.encodeNil(forKey: .detachedLegato)
    case .doit:
        try container.encodeNil(forKey: .doit)
    case .falloff:
        try container.encodeNil(forKey: .falloff)
    case .otherArticulation:
        try container.encodeNil(forKey: .otherArticulation)
    case .plop:
        try container.encodeNil(forKey: .plop)
    case .scoop:
        try container.encodeNil(forKey: .scoop)
    case .spiccato:
        try container.encodeNil(forKey: .spiccato)
    case .staccatissimo:
        try container.encodeNil(forKey: .staccatissimo)
    case .staccato:
        try container.encodeNil(forKey: .staccato)
    case .stress:
        try container.encodeNil(forKey: .stress)
    case .strongAccent:
        try container.encodeNil(forKey: .strongAccent)
    case .tenuto:
        try container.encodeNil(forKey: .tenuto)
    case .unstress:
        try container.encodeNil(forKey: .unstress)
    }
}
// sourcery:end

// sourcery:inline:Articulation.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.accent) {
        _ = try container.decodeNil(forKey: .accent)
        self = .accent
    } else if container.contains(.breathMark) {
        _ = try container.decodeNil(forKey: .breathMark)
        self = .breathMark
    } else if container.contains(.caesura) {
        _ = try container.decodeNil(forKey: .caesura)
        self = .caesura
    } else if container.contains(.detachedLegato) {
        _ = try container.decodeNil(forKey: .detachedLegato)
        self = .detachedLegato
    } else if container.contains(.doit) {
        _ = try container.decodeNil(forKey: .doit)
        self = .doit
    } else if container.contains(.falloff) {
        _ = try container.decodeNil(forKey: .falloff)
        self = .falloff
    } else if container.contains(.otherArticulation) {
        _ = try container.decodeNil(forKey: .otherArticulation)
        self = .otherArticulation
    } else if container.contains(.plop) {
        _ = try container.decodeNil(forKey: .plop)
        self = .plop
    } else if container.contains(.scoop) {
        _ = try container.decodeNil(forKey: .scoop)
        self = .scoop
    } else if container.contains(.spiccato) {
        _ = try container.decodeNil(forKey: .spiccato)
        self = .spiccato
    } else if container.contains(.staccatissimo) {
        _ = try container.decodeNil(forKey: .staccatissimo)
        self = .staccatissimo
    } else if container.contains(.staccato) {
        _ = try container.decodeNil(forKey: .staccato)
        self = .staccato
    } else if container.contains(.stress) {
        _ = try container.decodeNil(forKey: .stress)
        self = .stress
    } else if container.contains(.strongAccent) {
        _ = try container.decodeNil(forKey: .strongAccent)
        self = .strongAccent
    } else if container.contains(.tenuto) {
        _ = try container.decodeNil(forKey: .tenuto)
        self = .tenuto
    } else if container.contains(.unstress) {
        _ = try container.decodeNil(forKey: .unstress)
        self = .unstress
    } else {
        throw DecodingError.typeMismatch(
            Articulation.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Attributes.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .footnote:
        try container.encodeNil(forKey: .footnote)
    case .level:
        try container.encodeNil(forKey: .level)
    case .divisions:
        try container.encodeNil(forKey: .divisions)
    case .keys:
        try container.encodeNil(forKey: .keys)
    case .times:
        try container.encodeNil(forKey: .times)
    case .staves:
        try container.encodeNil(forKey: .staves)
    case .partSymbol:
        try container.encodeNil(forKey: .partSymbol)
    case .instruments:
        try container.encodeNil(forKey: .instruments)
    case .clefs:
        try container.encodeNil(forKey: .clefs)
    case .staffDetails:
        try container.encodeNil(forKey: .staffDetails)
    case .transpose:
        try container.encodeNil(forKey: .transpose)
    case .measureStyles:
        try container.encodeNil(forKey: .measureStyles)
    }
}
// sourcery:end

// sourcery:inline:Attributes.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.footnote) {
        _ = try container.decodeNil(forKey: .footnote)
        self = .footnote
    } else if container.contains(.level) {
        _ = try container.decodeNil(forKey: .level)
        self = .level
    } else if container.contains(.divisions) {
        _ = try container.decodeNil(forKey: .divisions)
        self = .divisions
    } else if container.contains(.keys) {
        _ = try container.decodeNil(forKey: .keys)
        self = .keys
    } else if container.contains(.times) {
        _ = try container.decodeNil(forKey: .times)
        self = .times
    } else if container.contains(.staves) {
        _ = try container.decodeNil(forKey: .staves)
        self = .staves
    } else if container.contains(.partSymbol) {
        _ = try container.decodeNil(forKey: .partSymbol)
        self = .partSymbol
    } else if container.contains(.instruments) {
        _ = try container.decodeNil(forKey: .instruments)
        self = .instruments
    } else if container.contains(.clefs) {
        _ = try container.decodeNil(forKey: .clefs)
        self = .clefs
    } else if container.contains(.staffDetails) {
        _ = try container.decodeNil(forKey: .staffDetails)
        self = .staffDetails
    } else if container.contains(.transpose) {
        _ = try container.decodeNil(forKey: .transpose)
        self = .transpose
    } else if container.contains(.measureStyles) {
        _ = try container.decodeNil(forKey: .measureStyles)
        self = .measureStyles
    } else {
        throw DecodingError.typeMismatch(
            Attributes.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:BarStyleColor.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .color:
        try container.encodeNil(forKey: .color)
    }
}
// sourcery:end

// sourcery:inline:BarStyleColor.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.color) {
        _ = try container.decodeNil(forKey: .color)
        self = .color
    } else {
        throw DecodingError.typeMismatch(
            BarStyleColor.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Barline.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .location:
        try container.encodeNil(forKey: .location)
    case .barStyle:
        try container.encodeNil(forKey: .barStyle)
    case .editorial:
        try container.encodeNil(forKey: .editorial)
    case .wavyLine:
        try container.encodeNil(forKey: .wavyLine)
    case .segno:
        try container.encodeNil(forKey: .segno)
    case .coda:
        try container.encodeNil(forKey: .coda)
    case .fermata:
        try container.encodeNil(forKey: .fermata)
    case .ending:
        try container.encodeNil(forKey: .ending)
    case .`repeat`:
        try container.encodeNil(forKey: .`repeat`)
    case .divisions:
        try container.encodeNil(forKey: .divisions)
    }
}
// sourcery:end

// sourcery:inline:Barline.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.location) {
        _ = try container.decodeNil(forKey: .location)
        self = .location
    } else if container.contains(.barStyle) {
        _ = try container.decodeNil(forKey: .barStyle)
        self = .barStyle
    } else if container.contains(.editorial) {
        _ = try container.decodeNil(forKey: .editorial)
        self = .editorial
    } else if container.contains(.wavyLine) {
        _ = try container.decodeNil(forKey: .wavyLine)
        self = .wavyLine
    } else if container.contains(.segno) {
        _ = try container.decodeNil(forKey: .segno)
        self = .segno
    } else if container.contains(.coda) {
        _ = try container.decodeNil(forKey: .coda)
        self = .coda
    } else if container.contains(.fermata) {
        _ = try container.decodeNil(forKey: .fermata)
        self = .fermata
    } else if container.contains(.ending) {
        _ = try container.decodeNil(forKey: .ending)
        self = .ending
    } else if container.contains(.`repeat`) {
        _ = try container.decodeNil(forKey: .`repeat`)
        self = .`repeat`
    } else if container.contains(.divisions) {
        _ = try container.decodeNil(forKey: .divisions)
        self = .divisions
    } else {
        throw DecodingError.typeMismatch(
            Barline.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Bass.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .bassStep:
        try container.encodeNil(forKey: .bassStep)
    case .bassAlter:
        try container.encodeNil(forKey: .bassAlter)
    }
}
// sourcery:end

// sourcery:inline:Bass.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.bassStep) {
        _ = try container.decodeNil(forKey: .bassStep)
        self = .bassStep
    } else if container.contains(.bassAlter) {
        _ = try container.decodeNil(forKey: .bassAlter)
        self = .bassAlter
    } else {
        throw DecodingError.typeMismatch(
            Bass.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:BassAlter.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .printObject:
        try container.encodeNil(forKey: .printObject)
    case .location:
        try container.encodeNil(forKey: .location)
    }
}
// sourcery:end

// sourcery:inline:BassAlter.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.printObject) {
        _ = try container.decodeNil(forKey: .printObject)
        self = .printObject
    } else if container.contains(.location) {
        _ = try container.decodeNil(forKey: .location)
        self = .location
    } else {
        throw DecodingError.typeMismatch(
            BassAlter.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:BassStep.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .text:
        try container.encodeNil(forKey: .text)
    }
}
// sourcery:end

// sourcery:inline:BassStep.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.text) {
        _ = try container.decodeNil(forKey: .text)
        self = .text
    } else {
        throw DecodingError.typeMismatch(
            BassStep.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Bend.PreBendOrRelease.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .preBend:
        try container.encodeNil(forKey: .preBend)
    case .release:
        try container.encodeNil(forKey: .release)
    }
}
// sourcery:end

// sourcery:inline:Bend.PreBendOrRelease.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.preBend) {
        _ = try container.decodeNil(forKey: .preBend)
        self = .preBend
    } else if container.contains(.release) {
        _ = try container.decodeNil(forKey: .release)
        self = .release
    } else {
        throw DecodingError.typeMismatch(
            Bend.PreBendOrRelease.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:BendSound.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .accelerate:
        try container.encodeNil(forKey: .accelerate)
    case .beats:
        try container.encodeNil(forKey: .beats)
    case .firstBeat:
        try container.encodeNil(forKey: .firstBeat)
    case .lastBeat:
        try container.encodeNil(forKey: .lastBeat)
    }
}
// sourcery:end

// sourcery:inline:BendSound.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.accelerate) {
        _ = try container.decodeNil(forKey: .accelerate)
        self = .accelerate
    } else if container.contains(.beats) {
        _ = try container.decodeNil(forKey: .beats)
        self = .beats
    } else if container.contains(.firstBeat) {
        _ = try container.decodeNil(forKey: .firstBeat)
        self = .firstBeat
    } else if container.contains(.lastBeat) {
        _ = try container.decodeNil(forKey: .lastBeat)
        self = .lastBeat
    } else {
        throw DecodingError.typeMismatch(
            BendSound.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Bracket.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .type:
        try container.encodeNil(forKey: .type)
    case .number:
        try container.encodeNil(forKey: .number)
    case .lineEnd:
        try container.encodeNil(forKey: .lineEnd)
    case .endLength:
        try container.encodeNil(forKey: .endLength)
    case .lineType:
        try container.encodeNil(forKey: .lineType)
    case .dashLength:
        try container.encodeNil(forKey: .dashLength)
    case .spaceLength:
        try container.encodeNil(forKey: .spaceLength)
    case .color:
        try container.encodeNil(forKey: .color)
    }
}
// sourcery:end

// sourcery:inline:Bracket.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.type) {
        _ = try container.decodeNil(forKey: .type)
        self = .type
    } else if container.contains(.number) {
        _ = try container.decodeNil(forKey: .number)
        self = .number
    } else if container.contains(.lineEnd) {
        _ = try container.decodeNil(forKey: .lineEnd)
        self = .lineEnd
    } else if container.contains(.endLength) {
        _ = try container.decodeNil(forKey: .endLength)
        self = .endLength
    } else if container.contains(.lineType) {
        _ = try container.decodeNil(forKey: .lineType)
        self = .lineType
    } else if container.contains(.dashLength) {
        _ = try container.decodeNil(forKey: .dashLength)
        self = .dashLength
    } else if container.contains(.spaceLength) {
        _ = try container.decodeNil(forKey: .spaceLength)
        self = .spaceLength
    } else if container.contains(.color) {
        _ = try container.decodeNil(forKey: .color)
        self = .color
    } else {
        throw DecodingError.typeMismatch(
            Bracket.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:BreathMark.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .placement:
        try container.encodeNil(forKey: .placement)
    }
}
// sourcery:end

// sourcery:inline:BreathMark.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.placement) {
        _ = try container.decodeNil(forKey: .placement)
        self = .placement
    } else {
        throw DecodingError.typeMismatch(
            BreathMark.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Clef.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .number:
        try container.encodeNil(forKey: .number)
    case .additional:
        try container.encodeNil(forKey: .additional)
    case .size:
        try container.encodeNil(forKey: .size)
    case .afterBarline:
        try container.encodeNil(forKey: .afterBarline)
    case .printStyle:
        try container.encodeNil(forKey: .printStyle)
    case .printObject:
        try container.encodeNil(forKey: .printObject)
    case .sign:
        try container.encodeNil(forKey: .sign)
    case .line:
        try container.encodeNil(forKey: .line)
    case .clefOctaveChange:
        try container.encodeNil(forKey: .clefOctaveChange)
    }
}
// sourcery:end

// sourcery:inline:Clef.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.number) {
        _ = try container.decodeNil(forKey: .number)
        self = .number
    } else if container.contains(.additional) {
        _ = try container.decodeNil(forKey: .additional)
        self = .additional
    } else if container.contains(.size) {
        _ = try container.decodeNil(forKey: .size)
        self = .size
    } else if container.contains(.afterBarline) {
        _ = try container.decodeNil(forKey: .afterBarline)
        self = .afterBarline
    } else if container.contains(.printStyle) {
        _ = try container.decodeNil(forKey: .printStyle)
        self = .printStyle
    } else if container.contains(.printObject) {
        _ = try container.decodeNil(forKey: .printObject)
        self = .printObject
    } else if container.contains(.sign) {
        _ = try container.decodeNil(forKey: .sign)
        self = .sign
    } else if container.contains(.line) {
        _ = try container.decodeNil(forKey: .line)
        self = .line
    } else if container.contains(.clefOctaveChange) {
        _ = try container.decodeNil(forKey: .clefOctaveChange)
        self = .clefOctaveChange
    } else {
        throw DecodingError.typeMismatch(
            Clef.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Creator.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .type:
        try container.encodeNil(forKey: .type)
    }
}
// sourcery:end

// sourcery:inline:Creator.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.type) {
        _ = try container.decodeNil(forKey: .type)
        self = .type
    } else {
        throw DecodingError.typeMismatch(
            Creator.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Credit.Kind.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .image(value):
        try container.encode(value, forKey: .image)
    case let .words(value):
        try container.encode(value, forKey: .words)
    }
}
// sourcery:end

// sourcery:inline:Credit.Kind.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.image) {
        self = .image(try decode(.image))
    } else if container.contains(.words) {
        self = .words(try decode(.words))
    } else {
        throw DecodingError.typeMismatch(
            Credit.Kind.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Credit.Kind.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .image:
        try container.encodeNil(forKey: .image)
    case .words:
        try container.encodeNil(forKey: .words)
    }
}
// sourcery:end

// sourcery:inline:Credit.Kind.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.image) {
        _ = try container.decodeNil(forKey: .image)
        self = .image
    } else if container.contains(.words) {
        _ = try container.decodeNil(forKey: .words)
        self = .words
    } else {
        throw DecodingError.typeMismatch(
            Credit.Kind.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:DashedFormatting.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .dashLength:
        try container.encodeNil(forKey: .dashLength)
    case .spaceLength:
        try container.encodeNil(forKey: .spaceLength)
    }
}
// sourcery:end

// sourcery:inline:DashedFormatting.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.dashLength) {
        _ = try container.decodeNil(forKey: .dashLength)
        self = .dashLength
    } else if container.contains(.spaceLength) {
        _ = try container.decodeNil(forKey: .spaceLength)
        self = .spaceLength
    } else {
        throw DecodingError.typeMismatch(
            DashedFormatting.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Degree.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .printObject:
        try container.encodeNil(forKey: .printObject)
    case .value:
        try container.encodeNil(forKey: .value)
    case .type:
        try container.encodeNil(forKey: .type)
    case .alter:
        try container.encodeNil(forKey: .alter)
    }
}
// sourcery:end

// sourcery:inline:Degree.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.printObject) {
        _ = try container.decodeNil(forKey: .printObject)
        self = .printObject
    } else if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.type) {
        _ = try container.decodeNil(forKey: .type)
        self = .type
    } else if container.contains(.alter) {
        _ = try container.decodeNil(forKey: .alter)
        self = .alter
    } else {
        throw DecodingError.typeMismatch(
            Degree.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:DegreeAlter.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .plusMinus:
        try container.encodeNil(forKey: .plusMinus)
    }
}
// sourcery:end

// sourcery:inline:DegreeAlter.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.plusMinus) {
        _ = try container.decodeNil(forKey: .plusMinus)
        self = .plusMinus
    } else {
        throw DecodingError.typeMismatch(
            DegreeAlter.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:DegreeType.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .text:
        try container.encodeNil(forKey: .text)
    }
}
// sourcery:end

// sourcery:inline:DegreeType.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.text) {
        _ = try container.decodeNil(forKey: .text)
        self = .text
    } else {
        throw DecodingError.typeMismatch(
            DegreeType.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:DegreeValue.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .symbol:
        try container.encodeNil(forKey: .symbol)
    case .text:
        try container.encodeNil(forKey: .text)
    }
}
// sourcery:end

// sourcery:inline:DegreeValue.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.symbol) {
        _ = try container.decodeNil(forKey: .symbol)
        self = .symbol
    } else if container.contains(.text) {
        _ = try container.decodeNil(forKey: .text)
        self = .text
    } else {
        throw DecodingError.typeMismatch(
            DegreeValue.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Direction.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .placement:
        try container.encodeNil(forKey: .placement)
    case .directive:
        try container.encodeNil(forKey: .directive)
    case .directionTypes:
        try container.encodeNil(forKey: .directionTypes)
    case .offset:
        try container.encodeNil(forKey: .offset)
    case .footnote:
        try container.encodeNil(forKey: .footnote)
    case .level:
        try container.encodeNil(forKey: .level)
    case .voice:
        try container.encodeNil(forKey: .voice)
    case .staff:
        try container.encodeNil(forKey: .staff)
    case .sound:
        try container.encodeNil(forKey: .sound)
    }
}
// sourcery:end

// sourcery:inline:Direction.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.placement) {
        _ = try container.decodeNil(forKey: .placement)
        self = .placement
    } else if container.contains(.directive) {
        _ = try container.decodeNil(forKey: .directive)
        self = .directive
    } else if container.contains(.directionTypes) {
        _ = try container.decodeNil(forKey: .directionTypes)
        self = .directionTypes
    } else if container.contains(.offset) {
        _ = try container.decodeNil(forKey: .offset)
        self = .offset
    } else if container.contains(.footnote) {
        _ = try container.decodeNil(forKey: .footnote)
        self = .footnote
    } else if container.contains(.level) {
        _ = try container.decodeNil(forKey: .level)
        self = .level
    } else if container.contains(.voice) {
        _ = try container.decodeNil(forKey: .voice)
        self = .voice
    } else if container.contains(.staff) {
        _ = try container.decodeNil(forKey: .staff)
        self = .staff
    } else if container.contains(.sound) {
        _ = try container.decodeNil(forKey: .sound)
        self = .sound
    } else {
        throw DecodingError.typeMismatch(
            Direction.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:DirectionType.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .accordionRegistration(value):
        try container.encode(value, forKey: .accordionRegistration)
    case let .bracket(value):
        try container.encode(value, forKey: .bracket)
    case let .coda(value):
        try container.encode(value, forKey: .coda)
    case let .damp(value):
        try container.encode(value, forKey: .damp)
    case let .dampAll(value):
        try container.encode(value, forKey: .dampAll)
    case let .dashes(value):
        try container.encode(value, forKey: .dashes)
    case let .dynamics(value):
        try container.encode(value, forKey: .dynamics)
    case let .eyeglasses(value):
        try container.encode(value, forKey: .eyeglasses)
    case let .harpPedals(value):
        try container.encode(value, forKey: .harpPedals)
    case let .image(value):
        try container.encode(value, forKey: .image)
    case let .metronome(value):
        try container.encode(value, forKey: .metronome)
    case let .octaveShift(value):
        try container.encode(value, forKey: .octaveShift)
    case let .otherDirection(value):
        try container.encode(value, forKey: .otherDirection)
    case let .pedal(value):
        try container.encode(value, forKey: .pedal)
    case let .percussion(value):
        try container.encode(value, forKey: .percussion)
    case let .principleVoice(value):
        try container.encode(value, forKey: .principleVoice)
    case let .rehearsal(value):
        try container.encode(value, forKey: .rehearsal)
    case let .scordatura(value):
        try container.encode(value, forKey: .scordatura)
    case let .segno(value):
        try container.encode(value, forKey: .segno)
    case let .stringMute(value):
        try container.encode(value, forKey: .stringMute)
    case let .wedge(value):
        try container.encode(value, forKey: .wedge)
    case let .words(value):
        try container.encode(value, forKey: .words)
    }
}
// sourcery:end

// sourcery:inline:DirectionType.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.accordionRegistration) {
        self = .accordionRegistration(try decode(.accordionRegistration))
    } else if container.contains(.bracket) {
        self = .bracket(try decode(.bracket))
    } else if container.contains(.coda) {
        self = .coda(try decode(.coda))
    } else if container.contains(.damp) {
        self = .damp(try decode(.damp))
    } else if container.contains(.dampAll) {
        self = .dampAll(try decode(.dampAll))
    } else if container.contains(.dashes) {
        self = .dashes(try decode(.dashes))
    } else if container.contains(.dynamics) {
        self = .dynamics(try decode(.dynamics))
    } else if container.contains(.eyeglasses) {
        self = .eyeglasses(try decode(.eyeglasses))
    } else if container.contains(.harpPedals) {
        self = .harpPedals(try decode(.harpPedals))
    } else if container.contains(.image) {
        self = .image(try decode(.image))
    } else if container.contains(.metronome) {
        self = .metronome(try decode(.metronome))
    } else if container.contains(.octaveShift) {
        self = .octaveShift(try decode(.octaveShift))
    } else if container.contains(.otherDirection) {
        self = .otherDirection(try decode(.otherDirection))
    } else if container.contains(.pedal) {
        self = .pedal(try decode(.pedal))
    } else if container.contains(.percussion) {
        self = .percussion(try decode(.percussion))
    } else if container.contains(.principleVoice) {
        self = .principleVoice(try decode(.principleVoice))
    } else if container.contains(.rehearsal) {
        self = .rehearsal(try decode(.rehearsal))
    } else if container.contains(.scordatura) {
        self = .scordatura(try decode(.scordatura))
    } else if container.contains(.segno) {
        self = .segno(try decode(.segno))
    } else if container.contains(.stringMute) {
        self = .stringMute(try decode(.stringMute))
    } else if container.contains(.wedge) {
        self = .wedge(try decode(.wedge))
    } else if container.contains(.words) {
        self = .words(try decode(.words))
    } else {
        throw DecodingError.typeMismatch(
            DirectionType.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:DirectionType.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .accordionRegistration:
        try container.encodeNil(forKey: .accordionRegistration)
    case .bracket:
        try container.encodeNil(forKey: .bracket)
    case .coda:
        try container.encodeNil(forKey: .coda)
    case .damp:
        try container.encodeNil(forKey: .damp)
    case .dampAll:
        try container.encodeNil(forKey: .dampAll)
    case .dashes:
        try container.encodeNil(forKey: .dashes)
    case .dynamics:
        try container.encodeNil(forKey: .dynamics)
    case .eyeglasses:
        try container.encodeNil(forKey: .eyeglasses)
    case .harpPedals:
        try container.encodeNil(forKey: .harpPedals)
    case .image:
        try container.encodeNil(forKey: .image)
    case .metronome:
        try container.encodeNil(forKey: .metronome)
    case .octaveShift:
        try container.encodeNil(forKey: .octaveShift)
    case .otherDirection:
        try container.encodeNil(forKey: .otherDirection)
    case .pedal:
        try container.encodeNil(forKey: .pedal)
    case .percussion:
        try container.encodeNil(forKey: .percussion)
    case .principleVoice:
        try container.encodeNil(forKey: .principleVoice)
    case .rehearsal:
        try container.encodeNil(forKey: .rehearsal)
    case .scordatura:
        try container.encodeNil(forKey: .scordatura)
    case .segno:
        try container.encodeNil(forKey: .segno)
    case .stringMute:
        try container.encodeNil(forKey: .stringMute)
    case .wedge:
        try container.encodeNil(forKey: .wedge)
    case .words:
        try container.encodeNil(forKey: .words)
    }
}
// sourcery:end

// sourcery:inline:DirectionType.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.accordionRegistration) {
        _ = try container.decodeNil(forKey: .accordionRegistration)
        self = .accordionRegistration
    } else if container.contains(.bracket) {
        _ = try container.decodeNil(forKey: .bracket)
        self = .bracket
    } else if container.contains(.coda) {
        _ = try container.decodeNil(forKey: .coda)
        self = .coda
    } else if container.contains(.damp) {
        _ = try container.decodeNil(forKey: .damp)
        self = .damp
    } else if container.contains(.dampAll) {
        _ = try container.decodeNil(forKey: .dampAll)
        self = .dampAll
    } else if container.contains(.dashes) {
        _ = try container.decodeNil(forKey: .dashes)
        self = .dashes
    } else if container.contains(.dynamics) {
        _ = try container.decodeNil(forKey: .dynamics)
        self = .dynamics
    } else if container.contains(.eyeglasses) {
        _ = try container.decodeNil(forKey: .eyeglasses)
        self = .eyeglasses
    } else if container.contains(.harpPedals) {
        _ = try container.decodeNil(forKey: .harpPedals)
        self = .harpPedals
    } else if container.contains(.image) {
        _ = try container.decodeNil(forKey: .image)
        self = .image
    } else if container.contains(.metronome) {
        _ = try container.decodeNil(forKey: .metronome)
        self = .metronome
    } else if container.contains(.octaveShift) {
        _ = try container.decodeNil(forKey: .octaveShift)
        self = .octaveShift
    } else if container.contains(.otherDirection) {
        _ = try container.decodeNil(forKey: .otherDirection)
        self = .otherDirection
    } else if container.contains(.pedal) {
        _ = try container.decodeNil(forKey: .pedal)
        self = .pedal
    } else if container.contains(.percussion) {
        _ = try container.decodeNil(forKey: .percussion)
        self = .percussion
    } else if container.contains(.principleVoice) {
        _ = try container.decodeNil(forKey: .principleVoice)
        self = .principleVoice
    } else if container.contains(.rehearsal) {
        _ = try container.decodeNil(forKey: .rehearsal)
        self = .rehearsal
    } else if container.contains(.scordatura) {
        _ = try container.decodeNil(forKey: .scordatura)
        self = .scordatura
    } else if container.contains(.segno) {
        _ = try container.decodeNil(forKey: .segno)
        self = .segno
    } else if container.contains(.stringMute) {
        _ = try container.decodeNil(forKey: .stringMute)
        self = .stringMute
    } else if container.contains(.wedge) {
        _ = try container.decodeNil(forKey: .wedge)
        self = .wedge
    } else if container.contains(.words) {
        _ = try container.decodeNil(forKey: .words)
        self = .words
    } else {
        throw DecodingError.typeMismatch(
            DirectionType.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Dynamic.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .p:
        try container.encodeNil(forKey: .p)
    case .pp:
        try container.encodeNil(forKey: .pp)
    case .ppp:
        try container.encodeNil(forKey: .ppp)
    case .pppp:
        try container.encodeNil(forKey: .pppp)
    case .ppppp:
        try container.encodeNil(forKey: .ppppp)
    case .pppppp:
        try container.encodeNil(forKey: .pppppp)
    case .f:
        try container.encodeNil(forKey: .f)
    case .ff:
        try container.encodeNil(forKey: .ff)
    case .fff:
        try container.encodeNil(forKey: .fff)
    case .ffff:
        try container.encodeNil(forKey: .ffff)
    case .fffff:
        try container.encodeNil(forKey: .fffff)
    case .ffffff:
        try container.encodeNil(forKey: .ffffff)
    case .mp:
        try container.encodeNil(forKey: .mp)
    case .mf:
        try container.encodeNil(forKey: .mf)
    case .sf:
        try container.encodeNil(forKey: .sf)
    case .sfp:
        try container.encodeNil(forKey: .sfp)
    case .sfpp:
        try container.encodeNil(forKey: .sfpp)
    case .fp:
        try container.encodeNil(forKey: .fp)
    case .rf:
        try container.encodeNil(forKey: .rf)
    case .rfz:
        try container.encodeNil(forKey: .rfz)
    case .sfz:
        try container.encodeNil(forKey: .sfz)
    case .sffz:
        try container.encodeNil(forKey: .sffz)
    case .fz:
        try container.encodeNil(forKey: .fz)
    case .n:
        try container.encodeNil(forKey: .n)
    case .pf:
        try container.encodeNil(forKey: .pf)
    case .sfzp:
        try container.encodeNil(forKey: .sfzp)
    case let .other(value):
        try container.encode(value, forKey: .other)
    }
}
// sourcery:end

// sourcery:inline:Dynamic.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.p) {
        _ = try container.decodeNil(forKey: .p)
        self = .p
    } else if container.contains(.pp) {
        _ = try container.decodeNil(forKey: .pp)
        self = .pp
    } else if container.contains(.ppp) {
        _ = try container.decodeNil(forKey: .ppp)
        self = .ppp
    } else if container.contains(.pppp) {
        _ = try container.decodeNil(forKey: .pppp)
        self = .pppp
    } else if container.contains(.ppppp) {
        _ = try container.decodeNil(forKey: .ppppp)
        self = .ppppp
    } else if container.contains(.pppppp) {
        _ = try container.decodeNil(forKey: .pppppp)
        self = .pppppp
    } else if container.contains(.f) {
        _ = try container.decodeNil(forKey: .f)
        self = .f
    } else if container.contains(.ff) {
        _ = try container.decodeNil(forKey: .ff)
        self = .ff
    } else if container.contains(.fff) {
        _ = try container.decodeNil(forKey: .fff)
        self = .fff
    } else if container.contains(.ffff) {
        _ = try container.decodeNil(forKey: .ffff)
        self = .ffff
    } else if container.contains(.fffff) {
        _ = try container.decodeNil(forKey: .fffff)
        self = .fffff
    } else if container.contains(.ffffff) {
        _ = try container.decodeNil(forKey: .ffffff)
        self = .ffffff
    } else if container.contains(.mp) {
        _ = try container.decodeNil(forKey: .mp)
        self = .mp
    } else if container.contains(.mf) {
        _ = try container.decodeNil(forKey: .mf)
        self = .mf
    } else if container.contains(.sf) {
        _ = try container.decodeNil(forKey: .sf)
        self = .sf
    } else if container.contains(.sfp) {
        _ = try container.decodeNil(forKey: .sfp)
        self = .sfp
    } else if container.contains(.sfpp) {
        _ = try container.decodeNil(forKey: .sfpp)
        self = .sfpp
    } else if container.contains(.fp) {
        _ = try container.decodeNil(forKey: .fp)
        self = .fp
    } else if container.contains(.rf) {
        _ = try container.decodeNil(forKey: .rf)
        self = .rf
    } else if container.contains(.rfz) {
        _ = try container.decodeNil(forKey: .rfz)
        self = .rfz
    } else if container.contains(.sfz) {
        _ = try container.decodeNil(forKey: .sfz)
        self = .sfz
    } else if container.contains(.sffz) {
        _ = try container.decodeNil(forKey: .sffz)
        self = .sffz
    } else if container.contains(.fz) {
        _ = try container.decodeNil(forKey: .fz)
        self = .fz
    } else if container.contains(.n) {
        _ = try container.decodeNil(forKey: .n)
        self = .n
    } else if container.contains(.pf) {
        _ = try container.decodeNil(forKey: .pf)
        self = .pf
    } else if container.contains(.sfzp) {
        _ = try container.decodeNil(forKey: .sfzp)
        self = .sfzp
    } else if container.contains(.other) {
        self = .other(try decode(.other))
    } else {
        throw DecodingError.typeMismatch(
            Dynamic.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Dynamic.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .p:
        try container.encodeNil(forKey: .p)
    case .pp:
        try container.encodeNil(forKey: .pp)
    case .ppp:
        try container.encodeNil(forKey: .ppp)
    case .pppp:
        try container.encodeNil(forKey: .pppp)
    case .ppppp:
        try container.encodeNil(forKey: .ppppp)
    case .pppppp:
        try container.encodeNil(forKey: .pppppp)
    case .f:
        try container.encodeNil(forKey: .f)
    case .ff:
        try container.encodeNil(forKey: .ff)
    case .fff:
        try container.encodeNil(forKey: .fff)
    case .ffff:
        try container.encodeNil(forKey: .ffff)
    case .fffff:
        try container.encodeNil(forKey: .fffff)
    case .ffffff:
        try container.encodeNil(forKey: .ffffff)
    case .mp:
        try container.encodeNil(forKey: .mp)
    case .mf:
        try container.encodeNil(forKey: .mf)
    case .sf:
        try container.encodeNil(forKey: .sf)
    case .sfp:
        try container.encodeNil(forKey: .sfp)
    case .sfpp:
        try container.encodeNil(forKey: .sfpp)
    case .fp:
        try container.encodeNil(forKey: .fp)
    case .rf:
        try container.encodeNil(forKey: .rf)
    case .rfz:
        try container.encodeNil(forKey: .rfz)
    case .sfz:
        try container.encodeNil(forKey: .sfz)
    case .sffz:
        try container.encodeNil(forKey: .sffz)
    case .fz:
        try container.encodeNil(forKey: .fz)
    case .n:
        try container.encodeNil(forKey: .n)
    case .pf:
        try container.encodeNil(forKey: .pf)
    case .sfzp:
        try container.encodeNil(forKey: .sfzp)
    case .other:
        try container.encodeNil(forKey: .other)
    }
}
// sourcery:end

// sourcery:inline:Dynamic.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.p) {
        _ = try container.decodeNil(forKey: .p)
        self = .p
    } else if container.contains(.pp) {
        _ = try container.decodeNil(forKey: .pp)
        self = .pp
    } else if container.contains(.ppp) {
        _ = try container.decodeNil(forKey: .ppp)
        self = .ppp
    } else if container.contains(.pppp) {
        _ = try container.decodeNil(forKey: .pppp)
        self = .pppp
    } else if container.contains(.ppppp) {
        _ = try container.decodeNil(forKey: .ppppp)
        self = .ppppp
    } else if container.contains(.pppppp) {
        _ = try container.decodeNil(forKey: .pppppp)
        self = .pppppp
    } else if container.contains(.f) {
        _ = try container.decodeNil(forKey: .f)
        self = .f
    } else if container.contains(.ff) {
        _ = try container.decodeNil(forKey: .ff)
        self = .ff
    } else if container.contains(.fff) {
        _ = try container.decodeNil(forKey: .fff)
        self = .fff
    } else if container.contains(.ffff) {
        _ = try container.decodeNil(forKey: .ffff)
        self = .ffff
    } else if container.contains(.fffff) {
        _ = try container.decodeNil(forKey: .fffff)
        self = .fffff
    } else if container.contains(.ffffff) {
        _ = try container.decodeNil(forKey: .ffffff)
        self = .ffffff
    } else if container.contains(.mp) {
        _ = try container.decodeNil(forKey: .mp)
        self = .mp
    } else if container.contains(.mf) {
        _ = try container.decodeNil(forKey: .mf)
        self = .mf
    } else if container.contains(.sf) {
        _ = try container.decodeNil(forKey: .sf)
        self = .sf
    } else if container.contains(.sfp) {
        _ = try container.decodeNil(forKey: .sfp)
        self = .sfp
    } else if container.contains(.sfpp) {
        _ = try container.decodeNil(forKey: .sfpp)
        self = .sfpp
    } else if container.contains(.fp) {
        _ = try container.decodeNil(forKey: .fp)
        self = .fp
    } else if container.contains(.rf) {
        _ = try container.decodeNil(forKey: .rf)
        self = .rf
    } else if container.contains(.rfz) {
        _ = try container.decodeNil(forKey: .rfz)
        self = .rfz
    } else if container.contains(.sfz) {
        _ = try container.decodeNil(forKey: .sfz)
        self = .sfz
    } else if container.contains(.sffz) {
        _ = try container.decodeNil(forKey: .sffz)
        self = .sffz
    } else if container.contains(.fz) {
        _ = try container.decodeNil(forKey: .fz)
        self = .fz
    } else if container.contains(.n) {
        _ = try container.decodeNil(forKey: .n)
        self = .n
    } else if container.contains(.pf) {
        _ = try container.decodeNil(forKey: .pf)
        self = .pf
    } else if container.contains(.sfzp) {
        _ = try container.decodeNil(forKey: .sfzp)
        self = .sfzp
    } else if container.contains(.other) {
        _ = try container.decodeNil(forKey: .other)
        self = .other
    } else {
        throw DecodingError.typeMismatch(
            Dynamic.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:EmptyTrillSound.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .placement:
        try container.encodeNil(forKey: .placement)
    }
}
// sourcery:end

// sourcery:inline:EmptyTrillSound.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.placement) {
        _ = try container.decodeNil(forKey: .placement)
        self = .placement
    } else {
        throw DecodingError.typeMismatch(
            EmptyTrillSound.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Encoding.Kind.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .encoder(value):
        try container.encode(value, forKey: .encoder)
    case let .date(value):
        try container.encode(value, forKey: .date)
    case let .description(value):
        try container.encode(value, forKey: .description)
    case let .software(value):
        try container.encode(value, forKey: .software)
    case let .supports(value):
        try container.encode(value, forKey: .supports)
    }
}
// sourcery:end

// sourcery:inline:Encoding.Kind.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.encoder) {
        self = .encoder(try decode(.encoder))
    } else if container.contains(.date) {
        self = .date(try decode(.date))
    } else if container.contains(.description) {
        self = .description(try decode(.description))
    } else if container.contains(.software) {
        self = .software(try decode(.software))
    } else if container.contains(.supports) {
        self = .supports(try decode(.supports))
    } else {
        throw DecodingError.typeMismatch(
            Encoding.Kind.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Encoding.Kind.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .encoder:
        try container.encodeNil(forKey: .encoder)
    case .date:
        try container.encodeNil(forKey: .date)
    case .description:
        try container.encodeNil(forKey: .description)
    case .software:
        try container.encodeNil(forKey: .software)
    case .supports:
        try container.encodeNil(forKey: .supports)
    }
}
// sourcery:end

// sourcery:inline:Encoding.Kind.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.encoder) {
        _ = try container.decodeNil(forKey: .encoder)
        self = .encoder
    } else if container.contains(.date) {
        _ = try container.decodeNil(forKey: .date)
        self = .date
    } else if container.contains(.description) {
        _ = try container.decodeNil(forKey: .description)
        self = .description
    } else if container.contains(.software) {
        _ = try container.decodeNil(forKey: .software)
        self = .software
    } else if container.contains(.supports) {
        _ = try container.decodeNil(forKey: .supports)
        self = .supports
    } else {
        throw DecodingError.typeMismatch(
            Encoding.Kind.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Ending.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .number:
        try container.encodeNil(forKey: .number)
    case .type:
        try container.encodeNil(forKey: .type)
    case .printObject:
        try container.encodeNil(forKey: .printObject)
    case .endLength:
        try container.encodeNil(forKey: .endLength)
    case .textX:
        try container.encodeNil(forKey: .textX)
    case .textY:
        try container.encodeNil(forKey: .textY)
    }
}
// sourcery:end

// sourcery:inline:Ending.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.number) {
        _ = try container.decodeNil(forKey: .number)
        self = .number
    } else if container.contains(.type) {
        _ = try container.decodeNil(forKey: .type)
        self = .type
    } else if container.contains(.printObject) {
        _ = try container.decodeNil(forKey: .printObject)
        self = .printObject
    } else if container.contains(.endLength) {
        _ = try container.decodeNil(forKey: .endLength)
        self = .endLength
    } else if container.contains(.textX) {
        _ = try container.decodeNil(forKey: .textX)
        self = .textX
    } else if container.contains(.textY) {
        _ = try container.decodeNil(forKey: .textY)
        self = .textY
    } else {
        throw DecodingError.typeMismatch(
            Ending.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Fermata.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .type:
        try container.encodeNil(forKey: .type)
    case .printStyle:
        try container.encodeNil(forKey: .printStyle)
    }
}
// sourcery:end

// sourcery:inline:Fermata.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.type) {
        _ = try container.decodeNil(forKey: .type)
        self = .type
    } else if container.contains(.printStyle) {
        _ = try container.decodeNil(forKey: .printStyle)
        self = .printStyle
    } else {
        throw DecodingError.typeMismatch(
            Fermata.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Figure.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .prefix:
        try container.encodeNil(forKey: .prefix)
    case .figureNumber:
        try container.encodeNil(forKey: .figureNumber)
    case .suffix:
        try container.encodeNil(forKey: .suffix)
    case .extend:
        try container.encodeNil(forKey: .extend)
    }
}
// sourcery:end

// sourcery:inline:Figure.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.prefix) {
        _ = try container.decodeNil(forKey: .prefix)
        self = .prefix
    } else if container.contains(.figureNumber) {
        _ = try container.decodeNil(forKey: .figureNumber)
        self = .figureNumber
    } else if container.contains(.suffix) {
        _ = try container.decodeNil(forKey: .suffix)
        self = .suffix
    } else if container.contains(.extend) {
        _ = try container.decodeNil(forKey: .extend)
        self = .extend
    } else {
        throw DecodingError.typeMismatch(
            Figure.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:FiguredBass.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .figures:
        try container.encodeNil(forKey: .figures)
    case .duration:
        try container.encodeNil(forKey: .duration)
    case .footnote:
        try container.encodeNil(forKey: .footnote)
    case .level:
        try container.encodeNil(forKey: .level)
    case .parentheses:
        try container.encodeNil(forKey: .parentheses)
    }
}
// sourcery:end

// sourcery:inline:FiguredBass.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.figures) {
        _ = try container.decodeNil(forKey: .figures)
        self = .figures
    } else if container.contains(.duration) {
        _ = try container.decodeNil(forKey: .duration)
        self = .duration
    } else if container.contains(.footnote) {
        _ = try container.decodeNil(forKey: .footnote)
        self = .footnote
    } else if container.contains(.level) {
        _ = try container.decodeNil(forKey: .level)
        self = .level
    } else if container.contains(.parentheses) {
        _ = try container.decodeNil(forKey: .parentheses)
        self = .parentheses
    } else {
        throw DecodingError.typeMismatch(
            FiguredBass.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Fingering.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .substitution:
        try container.encodeNil(forKey: .substitution)
    case .alternate:
        try container.encodeNil(forKey: .alternate)
    case .placement:
        try container.encodeNil(forKey: .placement)
    }
}
// sourcery:end

// sourcery:inline:Fingering.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.substitution) {
        _ = try container.decodeNil(forKey: .substitution)
        self = .substitution
    } else if container.contains(.alternate) {
        _ = try container.decodeNil(forKey: .alternate)
        self = .alternate
    } else if container.contains(.placement) {
        _ = try container.decodeNil(forKey: .placement)
        self = .placement
    } else {
        throw DecodingError.typeMismatch(
            Fingering.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Font.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .family:
        try container.encodeNil(forKey: .family)
    case .style:
        try container.encodeNil(forKey: .style)
    case .size:
        try container.encodeNil(forKey: .size)
    case .weight:
        try container.encodeNil(forKey: .weight)
    }
}
// sourcery:end

// sourcery:inline:Font.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.family) {
        _ = try container.decodeNil(forKey: .family)
        self = .family
    } else if container.contains(.style) {
        _ = try container.decodeNil(forKey: .style)
        self = .style
    } else if container.contains(.size) {
        _ = try container.decodeNil(forKey: .size)
        self = .size
    } else if container.contains(.weight) {
        _ = try container.decodeNil(forKey: .weight)
        self = .weight
    } else {
        throw DecodingError.typeMismatch(
            Font.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:FormattedText.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .justify:
        try container.encodeNil(forKey: .justify)
    case .hAlign:
        try container.encodeNil(forKey: .hAlign)
    case .vAlign:
        try container.encodeNil(forKey: .vAlign)
    case .underline:
        try container.encodeNil(forKey: .underline)
    case .overline:
        try container.encodeNil(forKey: .overline)
    case .lineThrough:
        try container.encodeNil(forKey: .lineThrough)
    case .rotation:
        try container.encodeNil(forKey: .rotation)
    case .letterSpacing:
        try container.encodeNil(forKey: .letterSpacing)
    case .lineHeight:
        try container.encodeNil(forKey: .lineHeight)
    case .direction:
        try container.encodeNil(forKey: .direction)
    case .enclosure:
        try container.encodeNil(forKey: .enclosure)
    case .value:
        try container.encodeNil(forKey: .value)
    }
}
// sourcery:end

// sourcery:inline:FormattedText.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.justify) {
        _ = try container.decodeNil(forKey: .justify)
        self = .justify
    } else if container.contains(.hAlign) {
        _ = try container.decodeNil(forKey: .hAlign)
        self = .hAlign
    } else if container.contains(.vAlign) {
        _ = try container.decodeNil(forKey: .vAlign)
        self = .vAlign
    } else if container.contains(.underline) {
        _ = try container.decodeNil(forKey: .underline)
        self = .underline
    } else if container.contains(.overline) {
        _ = try container.decodeNil(forKey: .overline)
        self = .overline
    } else if container.contains(.lineThrough) {
        _ = try container.decodeNil(forKey: .lineThrough)
        self = .lineThrough
    } else if container.contains(.rotation) {
        _ = try container.decodeNil(forKey: .rotation)
        self = .rotation
    } else if container.contains(.letterSpacing) {
        _ = try container.decodeNil(forKey: .letterSpacing)
        self = .letterSpacing
    } else if container.contains(.lineHeight) {
        _ = try container.decodeNil(forKey: .lineHeight)
        self = .lineHeight
    } else if container.contains(.direction) {
        _ = try container.decodeNil(forKey: .direction)
        self = .direction
    } else if container.contains(.enclosure) {
        _ = try container.decodeNil(forKey: .enclosure)
        self = .enclosure
    } else if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else {
        throw DecodingError.typeMismatch(
            FormattedText.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Frame.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .position:
        try container.encodeNil(forKey: .position)
    case .color:
        try container.encodeNil(forKey: .color)
    case .hAlign:
        try container.encodeNil(forKey: .hAlign)
    case .vAlign:
        try container.encodeNil(forKey: .vAlign)
    case .height:
        try container.encodeNil(forKey: .height)
    case .width:
        try container.encodeNil(forKey: .width)
    case .unplayed:
        try container.encodeNil(forKey: .unplayed)
    case .frameStrings:
        try container.encodeNil(forKey: .frameStrings)
    case .frameFrets:
        try container.encodeNil(forKey: .frameFrets)
    case .frameNotes:
        try container.encodeNil(forKey: .frameNotes)
    case .firstFret:
        try container.encodeNil(forKey: .firstFret)
    }
}
// sourcery:end

// sourcery:inline:Frame.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.position) {
        _ = try container.decodeNil(forKey: .position)
        self = .position
    } else if container.contains(.color) {
        _ = try container.decodeNil(forKey: .color)
        self = .color
    } else if container.contains(.hAlign) {
        _ = try container.decodeNil(forKey: .hAlign)
        self = .hAlign
    } else if container.contains(.vAlign) {
        _ = try container.decodeNil(forKey: .vAlign)
        self = .vAlign
    } else if container.contains(.height) {
        _ = try container.decodeNil(forKey: .height)
        self = .height
    } else if container.contains(.width) {
        _ = try container.decodeNil(forKey: .width)
        self = .width
    } else if container.contains(.unplayed) {
        _ = try container.decodeNil(forKey: .unplayed)
        self = .unplayed
    } else if container.contains(.frameStrings) {
        _ = try container.decodeNil(forKey: .frameStrings)
        self = .frameStrings
    } else if container.contains(.frameFrets) {
        _ = try container.decodeNil(forKey: .frameFrets)
        self = .frameFrets
    } else if container.contains(.frameNotes) {
        _ = try container.decodeNil(forKey: .frameNotes)
        self = .frameNotes
    } else if container.contains(.firstFret) {
        _ = try container.decodeNil(forKey: .firstFret)
        self = .firstFret
    } else {
        throw DecodingError.typeMismatch(
            Frame.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Fret.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .color:
        try container.encodeNil(forKey: .color)
    }
}
// sourcery:end

// sourcery:inline:Fret.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.color) {
        _ = try container.decodeNil(forKey: .color)
        self = .color
    } else {
        throw DecodingError.typeMismatch(
            Fret.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:GroupBarline.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .color:
        try container.encodeNil(forKey: .color)
    }
}
// sourcery:end

// sourcery:inline:GroupBarline.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.color) {
        _ = try container.decodeNil(forKey: .color)
        self = .color
    } else {
        throw DecodingError.typeMismatch(
            GroupBarline.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:GroupSymbol.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .position:
        try container.encodeNil(forKey: .position)
    case .color:
        try container.encodeNil(forKey: .color)
    }
}
// sourcery:end

// sourcery:inline:GroupSymbol.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.position) {
        _ = try container.decodeNil(forKey: .position)
        self = .position
    } else if container.contains(.color) {
        _ = try container.decodeNil(forKey: .color)
        self = .color
    } else {
        throw DecodingError.typeMismatch(
            GroupSymbol.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Harmonic.BaseSoundingTouchingPitch.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .base:
        try container.encodeNil(forKey: .base)
    case .sounding:
        try container.encodeNil(forKey: .sounding)
    case .touching:
        try container.encodeNil(forKey: .touching)
    }
}
// sourcery:end

// sourcery:inline:Harmonic.BaseSoundingTouchingPitch.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.base) {
        _ = try container.decodeNil(forKey: .base)
        self = .base
    } else if container.contains(.sounding) {
        _ = try container.decodeNil(forKey: .sounding)
        self = .sounding
    } else if container.contains(.touching) {
        _ = try container.decodeNil(forKey: .touching)
        self = .touching
    } else {
        throw DecodingError.typeMismatch(
            Harmonic.BaseSoundingTouchingPitch.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Harmonic.CodingKeys.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .naturalArtificial:
        try container.encodeNil(forKey: .naturalArtificial)
    case .baseSoundingTouchingPitch:
        try container.encodeNil(forKey: .baseSoundingTouchingPitch)
    case .printObject:
        try container.encodeNil(forKey: .printObject)
    case .printStyle:
        try container.encodeNil(forKey: .printStyle)
    case .placement:
        try container.encodeNil(forKey: .placement)
    case .natural:
        try container.encodeNil(forKey: .natural)
    case .artificial:
        try container.encodeNil(forKey: .artificial)
    case .base:
        try container.encodeNil(forKey: .base)
    case .sounding:
        try container.encodeNil(forKey: .sounding)
    case .touching:
        try container.encodeNil(forKey: .touching)
    }
}
// sourcery:end

// sourcery:inline:Harmonic.CodingKeys.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.naturalArtificial) {
        _ = try container.decodeNil(forKey: .naturalArtificial)
        self = .naturalArtificial
    } else if container.contains(.baseSoundingTouchingPitch) {
        _ = try container.decodeNil(forKey: .baseSoundingTouchingPitch)
        self = .baseSoundingTouchingPitch
    } else if container.contains(.printObject) {
        _ = try container.decodeNil(forKey: .printObject)
        self = .printObject
    } else if container.contains(.printStyle) {
        _ = try container.decodeNil(forKey: .printStyle)
        self = .printStyle
    } else if container.contains(.placement) {
        _ = try container.decodeNil(forKey: .placement)
        self = .placement
    } else if container.contains(.natural) {
        _ = try container.decodeNil(forKey: .natural)
        self = .natural
    } else if container.contains(.artificial) {
        _ = try container.decodeNil(forKey: .artificial)
        self = .artificial
    } else if container.contains(.base) {
        _ = try container.decodeNil(forKey: .base)
        self = .base
    } else if container.contains(.sounding) {
        _ = try container.decodeNil(forKey: .sounding)
        self = .sounding
    } else if container.contains(.touching) {
        _ = try container.decodeNil(forKey: .touching)
        self = .touching
    } else {
        throw DecodingError.typeMismatch(
            Harmonic.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Harmonic.NaturalArtificial.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .natural:
        try container.encodeNil(forKey: .natural)
    case .artificial:
        try container.encodeNil(forKey: .artificial)
    }
}
// sourcery:end

// sourcery:inline:Harmonic.NaturalArtificial.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.natural) {
        _ = try container.decodeNil(forKey: .natural)
        self = .natural
    } else if container.contains(.artificial) {
        _ = try container.decodeNil(forKey: .artificial)
        self = .artificial
    } else {
        throw DecodingError.typeMismatch(
            Harmonic.NaturalArtificial.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Harmony.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .type:
        try container.encodeNil(forKey: .type)
    case .printObject:
        try container.encodeNil(forKey: .printObject)
    case .printFrame:
        try container.encodeNil(forKey: .printFrame)
    case .printStyle:
        try container.encodeNil(forKey: .printStyle)
    case .placement:
        try container.encodeNil(forKey: .placement)
    case .frame:
        try container.encodeNil(forKey: .frame)
    case .offset:
        try container.encodeNil(forKey: .offset)
    case .staff:
        try container.encodeNil(forKey: .staff)
    }
}
// sourcery:end

// sourcery:inline:Harmony.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.type) {
        _ = try container.decodeNil(forKey: .type)
        self = .type
    } else if container.contains(.printObject) {
        _ = try container.decodeNil(forKey: .printObject)
        self = .printObject
    } else if container.contains(.printFrame) {
        _ = try container.decodeNil(forKey: .printFrame)
        self = .printFrame
    } else if container.contains(.printStyle) {
        _ = try container.decodeNil(forKey: .printStyle)
        self = .printStyle
    } else if container.contains(.placement) {
        _ = try container.decodeNil(forKey: .placement)
        self = .placement
    } else if container.contains(.frame) {
        _ = try container.decodeNil(forKey: .frame)
        self = .frame
    } else if container.contains(.offset) {
        _ = try container.decodeNil(forKey: .offset)
        self = .offset
    } else if container.contains(.staff) {
        _ = try container.decodeNil(forKey: .staff)
        self = .staff
    } else {
        throw DecodingError.typeMismatch(
            Harmony.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:HarmonyChord.RootOrFunction.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .root(value):
        try container.encode(value, forKey: .root)
    case let .function(value):
        try container.encode(value, forKey: .function)
    }
}
// sourcery:end

// sourcery:inline:HarmonyChord.RootOrFunction.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.root) {
        self = .root(try decode(.root))
    } else if container.contains(.function) {
        self = .function(try decode(.function))
    } else {
        throw DecodingError.typeMismatch(
            HarmonyChord.RootOrFunction.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:HarmonyChord.RootOrFunction.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .root:
        try container.encodeNil(forKey: .root)
    case .function:
        try container.encodeNil(forKey: .function)
    }
}
// sourcery:end

// sourcery:inline:HarmonyChord.RootOrFunction.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.root) {
        _ = try container.decodeNil(forKey: .root)
        self = .root
    } else if container.contains(.function) {
        _ = try container.decodeNil(forKey: .function)
        self = .function
    } else {
        throw DecodingError.typeMismatch(
            HarmonyChord.RootOrFunction.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:HarmonyChordComponent.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .root(value):
        try container.encode(value, forKey: .root)
    case let .function(value):
        try container.encode(value, forKey: .function)
    case let .kind(value):
        try container.encode(value, forKey: .kind)
    case let .inversion(value):
        try container.encode(value, forKey: .inversion)
    case let .bass(value):
        try container.encode(value, forKey: .bass)
    case let .degree(value):
        try container.encode(value, forKey: .degree)
    }
}
// sourcery:end

// sourcery:inline:HarmonyChordComponent.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.root) {
        self = .root(try decode(.root))
    } else if container.contains(.function) {
        self = .function(try decode(.function))
    } else if container.contains(.kind) {
        self = .kind(try decode(.kind))
    } else if container.contains(.inversion) {
        self = .inversion(try decode(.inversion))
    } else if container.contains(.bass) {
        self = .bass(try decode(.bass))
    } else if container.contains(.degree) {
        self = .degree(try decode(.degree))
    } else {
        throw DecodingError.typeMismatch(
            HarmonyChordComponent.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:HarmonyChordComponent.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .root:
        try container.encodeNil(forKey: .root)
    case .function:
        try container.encodeNil(forKey: .function)
    case .kind:
        try container.encodeNil(forKey: .kind)
    case .inversion:
        try container.encodeNil(forKey: .inversion)
    case .bass:
        try container.encodeNil(forKey: .bass)
    case .degree:
        try container.encodeNil(forKey: .degree)
    }
}
// sourcery:end

// sourcery:inline:HarmonyChordComponent.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.root) {
        _ = try container.decodeNil(forKey: .root)
        self = .root
    } else if container.contains(.function) {
        _ = try container.decodeNil(forKey: .function)
        self = .function
    } else if container.contains(.kind) {
        _ = try container.decodeNil(forKey: .kind)
        self = .kind
    } else if container.contains(.inversion) {
        _ = try container.decodeNil(forKey: .inversion)
        self = .inversion
    } else if container.contains(.bass) {
        _ = try container.decodeNil(forKey: .bass)
        self = .bass
    } else if container.contains(.degree) {
        _ = try container.decodeNil(forKey: .degree)
        self = .degree
    } else {
        throw DecodingError.typeMismatch(
            HarmonyChordComponent.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:HarpPedals.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .pedalTunings:
        try container.encodeNil(forKey: .pedalTunings)
    }
}
// sourcery:end

// sourcery:inline:HarpPedals.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.pedalTunings) {
        _ = try container.decodeNil(forKey: .pedalTunings)
        self = .pedalTunings
    } else {
        throw DecodingError.typeMismatch(
            HarpPedals.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Header.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .work:
        try container.encodeNil(forKey: .work)
    case .movementNumber:
        try container.encodeNil(forKey: .movementNumber)
    case .movementTitle:
        try container.encodeNil(forKey: .movementTitle)
    case .identification:
        try container.encodeNil(forKey: .identification)
    case .defaults:
        try container.encodeNil(forKey: .defaults)
    case .credits:
        try container.encodeNil(forKey: .credits)
    case .partList:
        try container.encodeNil(forKey: .partList)
    }
}
// sourcery:end

// sourcery:inline:Header.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.work) {
        _ = try container.decodeNil(forKey: .work)
        self = .work
    } else if container.contains(.movementNumber) {
        _ = try container.decodeNil(forKey: .movementNumber)
        self = .movementNumber
    } else if container.contains(.movementTitle) {
        _ = try container.decodeNil(forKey: .movementTitle)
        self = .movementTitle
    } else if container.contains(.identification) {
        _ = try container.decodeNil(forKey: .identification)
        self = .identification
    } else if container.contains(.defaults) {
        _ = try container.decodeNil(forKey: .defaults)
        self = .defaults
    } else if container.contains(.credits) {
        _ = try container.decodeNil(forKey: .credits)
        self = .credits
    } else if container.contains(.partList) {
        _ = try container.decodeNil(forKey: .partList)
        self = .partList
    } else {
        throw DecodingError.typeMismatch(
            Header.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Identification.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .creators:
        try container.encodeNil(forKey: .creators)
    case .rights:
        try container.encodeNil(forKey: .rights)
    case .encoding:
        try container.encodeNil(forKey: .encoding)
    case .source:
        try container.encodeNil(forKey: .source)
    case .relation:
        try container.encodeNil(forKey: .relation)
    case .miscellaneous:
        try container.encodeNil(forKey: .miscellaneous)
    }
}
// sourcery:end

// sourcery:inline:Identification.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.creators) {
        _ = try container.decodeNil(forKey: .creators)
        self = .creators
    } else if container.contains(.rights) {
        _ = try container.decodeNil(forKey: .rights)
        self = .rights
    } else if container.contains(.encoding) {
        _ = try container.decodeNil(forKey: .encoding)
        self = .encoding
    } else if container.contains(.source) {
        _ = try container.decodeNil(forKey: .source)
        self = .source
    } else if container.contains(.relation) {
        _ = try container.decodeNil(forKey: .relation)
        self = .relation
    } else if container.contains(.miscellaneous) {
        _ = try container.decodeNil(forKey: .miscellaneous)
        self = .miscellaneous
    } else {
        throw DecodingError.typeMismatch(
            Identification.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Inversion.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    }
}
// sourcery:end

// sourcery:inline:Inversion.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else {
        throw DecodingError.typeMismatch(
            Inversion.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Justify.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .left:
        try container.encodeNil(forKey: .left)
    case .center:
        try container.encodeNil(forKey: .center)
    case .right:
        try container.encodeNil(forKey: .right)
    }
}
// sourcery:end

// sourcery:inline:Justify.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.left) {
        _ = try container.decodeNil(forKey: .left)
        self = .left
    } else if container.contains(.center) {
        _ = try container.decodeNil(forKey: .center)
        self = .center
    } else if container.contains(.right) {
        _ = try container.decodeNil(forKey: .right)
        self = .right
    } else {
        throw DecodingError.typeMismatch(
            Justify.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Key.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .number:
        try container.encodeNil(forKey: .number)
    case .position:
        try container.encodeNil(forKey: .position)
    case .printStyle:
        try container.encodeNil(forKey: .printStyle)
    case .printObject:
        try container.encodeNil(forKey: .printObject)
    case .kind:
        try container.encodeNil(forKey: .kind)
    case .keyOctaves:
        try container.encodeNil(forKey: .keyOctaves)
    case .keyStep:
        try container.encodeNil(forKey: .keyStep)
    case .keyAlter:
        try container.encodeNil(forKey: .keyAlter)
    case .keyAccidental:
        try container.encodeNil(forKey: .keyAccidental)
    case .cancel:
        try container.encodeNil(forKey: .cancel)
    case .fifths:
        try container.encodeNil(forKey: .fifths)
    case .mode:
        try container.encodeNil(forKey: .mode)
    }
}
// sourcery:end

// sourcery:inline:Key.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.number) {
        _ = try container.decodeNil(forKey: .number)
        self = .number
    } else if container.contains(.position) {
        _ = try container.decodeNil(forKey: .position)
        self = .position
    } else if container.contains(.printStyle) {
        _ = try container.decodeNil(forKey: .printStyle)
        self = .printStyle
    } else if container.contains(.printObject) {
        _ = try container.decodeNil(forKey: .printObject)
        self = .printObject
    } else if container.contains(.kind) {
        _ = try container.decodeNil(forKey: .kind)
        self = .kind
    } else if container.contains(.keyOctaves) {
        _ = try container.decodeNil(forKey: .keyOctaves)
        self = .keyOctaves
    } else if container.contains(.keyStep) {
        _ = try container.decodeNil(forKey: .keyStep)
        self = .keyStep
    } else if container.contains(.keyAlter) {
        _ = try container.decodeNil(forKey: .keyAlter)
        self = .keyAlter
    } else if container.contains(.keyAccidental) {
        _ = try container.decodeNil(forKey: .keyAccidental)
        self = .keyAccidental
    } else if container.contains(.cancel) {
        _ = try container.decodeNil(forKey: .cancel)
        self = .cancel
    } else if container.contains(.fifths) {
        _ = try container.decodeNil(forKey: .fifths)
        self = .fifths
    } else if container.contains(.mode) {
        _ = try container.decodeNil(forKey: .mode)
        self = .mode
    } else {
        throw DecodingError.typeMismatch(
            Key.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Key.KeyComponent.AutoXMLChoiceEncoding
fileprivate func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .keyStep(value):
        try container.encode(value, forKey: .keyStep)
    case let .keyAlter(value):
        try container.encode(value, forKey: .keyAlter)
    case let .keyAccidental(value):
        try container.encode(value, forKey: .keyAccidental)
    }
}
// sourcery:end

// sourcery:inline:Key.KeyComponent.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .keyStep:
        try container.encodeNil(forKey: .keyStep)
    case .keyAlter:
        try container.encodeNil(forKey: .keyAlter)
    case .keyAccidental:
        try container.encodeNil(forKey: .keyAccidental)
    }
}
// sourcery:end

// sourcery:inline:Key.KeyComponent.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.keyStep) {
        _ = try container.decodeNil(forKey: .keyStep)
        self = .keyStep
    } else if container.contains(.keyAlter) {
        _ = try container.decodeNil(forKey: .keyAlter)
        self = .keyAlter
    } else if container.contains(.keyAccidental) {
        _ = try container.decodeNil(forKey: .keyAccidental)
        self = .keyAccidental
    } else {
        throw DecodingError.typeMismatch(
            Key.KeyComponent.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Key.Kind.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .traditional(value):
        try container.encode(value, forKey: .traditional)
    case let .nonTraditional(value):
        try container.encode(value, forKey: .nonTraditional)
    }
}
// sourcery:end

// sourcery:inline:Key.Kind.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.traditional) {
        self = .traditional(try decode(.traditional))
    } else if container.contains(.nonTraditional) {
        self = .nonTraditional(try decode(.nonTraditional))
    } else {
        throw DecodingError.typeMismatch(
            Key.Kind.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Kind.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .useSymbols:
        try container.encodeNil(forKey: .useSymbols)
    case .text:
        try container.encodeNil(forKey: .text)
    case .stackDegrees:
        try container.encodeNil(forKey: .stackDegrees)
    case .parenthesesDegrees:
        try container.encodeNil(forKey: .parenthesesDegrees)
    case .bracketDegrees:
        try container.encodeNil(forKey: .bracketDegrees)
    case .hAlign:
        try container.encodeNil(forKey: .hAlign)
    case .vAlign:
        try container.encodeNil(forKey: .vAlign)
    case .value:
        try container.encodeNil(forKey: .value)
    }
}
// sourcery:end

// sourcery:inline:Kind.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.useSymbols) {
        _ = try container.decodeNil(forKey: .useSymbols)
        self = .useSymbols
    } else if container.contains(.text) {
        _ = try container.decodeNil(forKey: .text)
        self = .text
    } else if container.contains(.stackDegrees) {
        _ = try container.decodeNil(forKey: .stackDegrees)
        self = .stackDegrees
    } else if container.contains(.parenthesesDegrees) {
        _ = try container.decodeNil(forKey: .parenthesesDegrees)
        self = .parenthesesDegrees
    } else if container.contains(.bracketDegrees) {
        _ = try container.decodeNil(forKey: .bracketDegrees)
        self = .bracketDegrees
    } else if container.contains(.hAlign) {
        _ = try container.decodeNil(forKey: .hAlign)
        self = .hAlign
    } else if container.contains(.vAlign) {
        _ = try container.decodeNil(forKey: .vAlign)
        self = .vAlign
    } else if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else {
        throw DecodingError.typeMismatch(
            Kind.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Lyric.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .kind:
        try container.encodeNil(forKey: .kind)
    case .number:
        try container.encodeNil(forKey: .number)
    case .name:
        try container.encodeNil(forKey: .name)
    case .justify:
        try container.encodeNil(forKey: .justify)
    case .color:
        try container.encodeNil(forKey: .color)
    case .position:
        try container.encodeNil(forKey: .position)
    case .placement:
        try container.encodeNil(forKey: .placement)
    case .printObject:
        try container.encodeNil(forKey: .printObject)
    case .endLine:
        try container.encodeNil(forKey: .endLine)
    case .endParagraph:
        try container.encodeNil(forKey: .endParagraph)
    case .extend:
        try container.encodeNil(forKey: .extend)
    case .laughing:
        try container.encodeNil(forKey: .laughing)
    case .humming:
        try container.encodeNil(forKey: .humming)
    case .syllabic:
        try container.encodeNil(forKey: .syllabic)
    case .text:
        try container.encodeNil(forKey: .text)
    case .elision:
        try container.encodeNil(forKey: .elision)
    case .level:
        try container.encodeNil(forKey: .level)
    }
}
// sourcery:end

// sourcery:inline:Lyric.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.kind) {
        _ = try container.decodeNil(forKey: .kind)
        self = .kind
    } else if container.contains(.number) {
        _ = try container.decodeNil(forKey: .number)
        self = .number
    } else if container.contains(.name) {
        _ = try container.decodeNil(forKey: .name)
        self = .name
    } else if container.contains(.justify) {
        _ = try container.decodeNil(forKey: .justify)
        self = .justify
    } else if container.contains(.color) {
        _ = try container.decodeNil(forKey: .color)
        self = .color
    } else if container.contains(.position) {
        _ = try container.decodeNil(forKey: .position)
        self = .position
    } else if container.contains(.placement) {
        _ = try container.decodeNil(forKey: .placement)
        self = .placement
    } else if container.contains(.printObject) {
        _ = try container.decodeNil(forKey: .printObject)
        self = .printObject
    } else if container.contains(.endLine) {
        _ = try container.decodeNil(forKey: .endLine)
        self = .endLine
    } else if container.contains(.endParagraph) {
        _ = try container.decodeNil(forKey: .endParagraph)
        self = .endParagraph
    } else if container.contains(.extend) {
        _ = try container.decodeNil(forKey: .extend)
        self = .extend
    } else if container.contains(.laughing) {
        _ = try container.decodeNil(forKey: .laughing)
        self = .laughing
    } else if container.contains(.humming) {
        _ = try container.decodeNil(forKey: .humming)
        self = .humming
    } else if container.contains(.syllabic) {
        _ = try container.decodeNil(forKey: .syllabic)
        self = .syllabic
    } else if container.contains(.text) {
        _ = try container.decodeNil(forKey: .text)
        self = .text
    } else if container.contains(.elision) {
        _ = try container.decodeNil(forKey: .elision)
        self = .elision
    } else if container.contains(.level) {
        _ = try container.decodeNil(forKey: .level)
        self = .level
    } else {
        throw DecodingError.typeMismatch(
            Lyric.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Lyric.Kind.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .verbal(value):
        try container.encode(value, forKey: .verbal)
    case let .nonVerbal(value):
        try container.encode(value, forKey: .nonVerbal)
    }
}
// sourcery:end

// sourcery:inline:Lyric.Kind.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.verbal) {
        self = .verbal(try decode(.verbal))
    } else if container.contains(.nonVerbal) {
        self = .nonVerbal(try decode(.nonVerbal))
    } else {
        throw DecodingError.typeMismatch(
            Lyric.Kind.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Lyric.NonVerbal.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .extend(value):
        try container.encode(value, forKey: .extend)
    case .laughing:
        try container.encodeNil(forKey: .laughing)
    case .humming:
        try container.encodeNil(forKey: .humming)
    }
}
// sourcery:end

// sourcery:inline:Lyric.NonVerbal.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.extend) {
        self = .extend(try decode(.extend))
    } else if container.contains(.laughing) {
        _ = try container.decodeNil(forKey: .laughing)
        self = .laughing
    } else if container.contains(.humming) {
        _ = try container.decodeNil(forKey: .humming)
        self = .humming
    } else {
        throw DecodingError.typeMismatch(
            Lyric.NonVerbal.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:MIDIDevice.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .id:
        try container.encodeNil(forKey: .id)
    case .port:
        try container.encodeNil(forKey: .port)
    case .value:
        try container.encodeNil(forKey: .value)
    }
}
// sourcery:end

// sourcery:inline:MIDIDevice.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.id) {
        _ = try container.decodeNil(forKey: .id)
        self = .id
    } else if container.contains(.port) {
        _ = try container.decodeNil(forKey: .port)
        self = .port
    } else if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else {
        throw DecodingError.typeMismatch(
            MIDIDevice.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:MIDIInstrument.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .id:
        try container.encodeNil(forKey: .id)
    case .midiChannel:
        try container.encodeNil(forKey: .midiChannel)
    case .midiName:
        try container.encodeNil(forKey: .midiName)
    case .midiBank:
        try container.encodeNil(forKey: .midiBank)
    case .midiProgram:
        try container.encodeNil(forKey: .midiProgram)
    case .midiUnpitched:
        try container.encodeNil(forKey: .midiUnpitched)
    case .volume:
        try container.encodeNil(forKey: .volume)
    case .pan:
        try container.encodeNil(forKey: .pan)
    case .elevation:
        try container.encodeNil(forKey: .elevation)
    }
}
// sourcery:end

// sourcery:inline:MIDIInstrument.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.id) {
        _ = try container.decodeNil(forKey: .id)
        self = .id
    } else if container.contains(.midiChannel) {
        _ = try container.decodeNil(forKey: .midiChannel)
        self = .midiChannel
    } else if container.contains(.midiName) {
        _ = try container.decodeNil(forKey: .midiName)
        self = .midiName
    } else if container.contains(.midiBank) {
        _ = try container.decodeNil(forKey: .midiBank)
        self = .midiBank
    } else if container.contains(.midiProgram) {
        _ = try container.decodeNil(forKey: .midiProgram)
        self = .midiProgram
    } else if container.contains(.midiUnpitched) {
        _ = try container.decodeNil(forKey: .midiUnpitched)
        self = .midiUnpitched
    } else if container.contains(.volume) {
        _ = try container.decodeNil(forKey: .volume)
        self = .volume
    } else if container.contains(.pan) {
        _ = try container.decodeNil(forKey: .pan)
        self = .pan
    } else if container.contains(.elevation) {
        _ = try container.decodeNil(forKey: .elevation)
        self = .elevation
    } else {
        throw DecodingError.typeMismatch(
            MIDIInstrument.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:MeasureStyle.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .number:
        try container.encodeNil(forKey: .number)
    case .font:
        try container.encodeNil(forKey: .font)
    case .color:
        try container.encodeNil(forKey: .color)
    }
}
// sourcery:end

// sourcery:inline:MeasureStyle.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.number) {
        _ = try container.decodeNil(forKey: .number)
        self = .number
    } else if container.contains(.font) {
        _ = try container.decodeNil(forKey: .font)
        self = .font
    } else if container.contains(.color) {
        _ = try container.decodeNil(forKey: .color)
        self = .color
    } else {
        throw DecodingError.typeMismatch(
            MeasureStyle.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:MeasureStyle.Kind.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .beatRepeat(value):
        try container.encode(value, forKey: .beatRepeat)
    case let .measureRepeat(value):
        try container.encode(value, forKey: .measureRepeat)
    case let .multipleRest(value):
        try container.encode(value, forKey: .multipleRest)
    case let .slash(value):
        try container.encode(value, forKey: .slash)
    }
}
// sourcery:end

// sourcery:inline:MeasureStyle.Kind.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.beatRepeat) {
        self = .beatRepeat(try decode(.beatRepeat))
    } else if container.contains(.measureRepeat) {
        self = .measureRepeat(try decode(.measureRepeat))
    } else if container.contains(.multipleRest) {
        self = .multipleRest(try decode(.multipleRest))
    } else if container.contains(.slash) {
        self = .slash(try decode(.slash))
    } else {
        throw DecodingError.typeMismatch(
            MeasureStyle.Kind.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:MeasureStyle.Kind.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .beatRepeat:
        try container.encodeNil(forKey: .beatRepeat)
    case .measureRepeat:
        try container.encodeNil(forKey: .measureRepeat)
    case .multipleRest:
        try container.encodeNil(forKey: .multipleRest)
    case .slash:
        try container.encodeNil(forKey: .slash)
    }
}
// sourcery:end

// sourcery:inline:MeasureStyle.Kind.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.beatRepeat) {
        _ = try container.decodeNil(forKey: .beatRepeat)
        self = .beatRepeat
    } else if container.contains(.measureRepeat) {
        _ = try container.decodeNil(forKey: .measureRepeat)
        self = .measureRepeat
    } else if container.contains(.multipleRest) {
        _ = try container.decodeNil(forKey: .multipleRest)
        self = .multipleRest
    } else if container.contains(.slash) {
        _ = try container.decodeNil(forKey: .slash)
        self = .slash
    } else {
        throw DecodingError.typeMismatch(
            MeasureStyle.Kind.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Metronome.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .position:
        try container.encodeNil(forKey: .position)
    case .printStyleAlign:
        try container.encodeNil(forKey: .printStyleAlign)
    case .justify:
        try container.encodeNil(forKey: .justify)
    case .parentheses:
        try container.encodeNil(forKey: .parentheses)
    case .beatUnit:
        try container.encodeNil(forKey: .beatUnit)
    case .beatUnitDot:
        try container.encodeNil(forKey: .beatUnitDot)
    case .metronomeNote:
        try container.encodeNil(forKey: .metronomeNote)
    }
}
// sourcery:end

// sourcery:inline:Metronome.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.position) {
        _ = try container.decodeNil(forKey: .position)
        self = .position
    } else if container.contains(.printStyleAlign) {
        _ = try container.decodeNil(forKey: .printStyleAlign)
        self = .printStyleAlign
    } else if container.contains(.justify) {
        _ = try container.decodeNil(forKey: .justify)
        self = .justify
    } else if container.contains(.parentheses) {
        _ = try container.decodeNil(forKey: .parentheses)
        self = .parentheses
    } else if container.contains(.beatUnit) {
        _ = try container.decodeNil(forKey: .beatUnit)
        self = .beatUnit
    } else if container.contains(.beatUnitDot) {
        _ = try container.decodeNil(forKey: .beatUnitDot)
        self = .beatUnitDot
    } else if container.contains(.metronomeNote) {
        _ = try container.decodeNil(forKey: .metronomeNote)
        self = .metronomeNote
    } else {
        throw DecodingError.typeMismatch(
            Metronome.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Metronome.Complicated.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .metronomeNote:
        try container.encodeNil(forKey: .metronomeNote)
    case .metronomeRelation:
        try container.encodeNil(forKey: .metronomeRelation)
    case .otherMetronomeNote:
        try container.encodeNil(forKey: .otherMetronomeNote)
    }
}
// sourcery:end

// sourcery:inline:Metronome.Complicated.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.metronomeNote) {
        _ = try container.decodeNil(forKey: .metronomeNote)
        self = .metronomeNote
    } else if container.contains(.metronomeRelation) {
        _ = try container.decodeNil(forKey: .metronomeRelation)
        self = .metronomeRelation
    } else if container.contains(.otherMetronomeNote) {
        _ = try container.decodeNil(forKey: .otherMetronomeNote)
        self = .otherMetronomeNote
    } else {
        throw DecodingError.typeMismatch(
            Metronome.Complicated.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Metronome.Kind.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .regular(value):
        try container.encode(value, forKey: .regular)
    case let .relative(value):
        try container.encode(value, forKey: .relative)
    }
}
// sourcery:end

// sourcery:inline:Metronome.Kind.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.regular) {
        self = .regular(try decode(.regular))
    } else if container.contains(.relative) {
        self = .relative(try decode(.relative))
    } else {
        throw DecodingError.typeMismatch(
            Metronome.Kind.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Metronome.Regular.Relation.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .perMinute(value):
        try container.encode(value, forKey: .perMinute)
    case let .beatUnit(value):
        try container.encode(value, forKey: .beatUnit)
    }
}
// sourcery:end

// sourcery:inline:Metronome.Regular.Relation.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.perMinute) {
        self = .perMinute(try decode(.perMinute))
    } else if container.contains(.beatUnit) {
        self = .beatUnit(try decode(.beatUnit))
    } else {
        throw DecodingError.typeMismatch(
            Metronome.Regular.Relation.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:MetronomeRegularComponent.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .beatUnit(value):
        try container.encode(value, forKey: .beatUnit)
    case let .beatUnitDot(value):
        try container.encode(value, forKey: .beatUnitDot)
    case let .perMinute(value):
        try container.encode(value, forKey: .perMinute)
    }
}
// sourcery:end

// sourcery:inline:MetronomeRegularComponent.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.beatUnit) {
        self = .beatUnit(try decode(.beatUnit))
    } else if container.contains(.beatUnitDot) {
        self = .beatUnitDot(try decode(.beatUnitDot))
    } else if container.contains(.perMinute) {
        self = .perMinute(try decode(.perMinute))
    } else {
        throw DecodingError.typeMismatch(
            MetronomeRegularComponent.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:MetronomeRegularComponent.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .beatUnit:
        try container.encodeNil(forKey: .beatUnit)
    case .beatUnitDot:
        try container.encodeNil(forKey: .beatUnitDot)
    case .perMinute:
        try container.encodeNil(forKey: .perMinute)
    }
}
// sourcery:end

// sourcery:inline:MetronomeRegularComponent.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.beatUnit) {
        _ = try container.decodeNil(forKey: .beatUnit)
        self = .beatUnit
    } else if container.contains(.beatUnitDot) {
        _ = try container.decodeNil(forKey: .beatUnitDot)
        self = .beatUnitDot
    } else if container.contains(.perMinute) {
        _ = try container.decodeNil(forKey: .perMinute)
        self = .perMinute
    } else {
        throw DecodingError.typeMismatch(
            MetronomeRegularComponent.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Miscellaneous.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .fields:
        try container.encodeNil(forKey: .fields)
    }
}
// sourcery:end

// sourcery:inline:Miscellaneous.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.fields) {
        _ = try container.decodeNil(forKey: .fields)
        self = .fields
    } else {
        throw DecodingError.typeMismatch(
            Miscellaneous.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:MiscellaneousField.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .name:
        try container.encodeNil(forKey: .name)
    case .value:
        try container.encodeNil(forKey: .value)
    }
}
// sourcery:end

// sourcery:inline:MiscellaneousField.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.name) {
        _ = try container.decodeNil(forKey: .name)
        self = .name
    } else if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else {
        throw DecodingError.typeMismatch(
            MiscellaneousField.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:MusicData.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .note(value):
        try container.encode(value, forKey: .note)
    case let .backup(value):
        try container.encode(value, forKey: .backup)
    case let .forward(value):
        try container.encode(value, forKey: .forward)
    case let .attributes(value):
        try container.encode(value, forKey: .attributes)
    case let .direction(value):
        try container.encode(value, forKey: .direction)
    case let .harmony(value):
        try container.encode(value, forKey: .harmony)
    case let .figuredBass(value):
        try container.encode(value, forKey: .figuredBass)
    case let .print(value):
        try container.encode(value, forKey: .print)
    case let .sound(value):
        try container.encode(value, forKey: .sound)
    case let .barline(value):
        try container.encode(value, forKey: .barline)
    case let .grouping(value):
        try container.encode(value, forKey: .grouping)
    case let .link(value):
        try container.encode(value, forKey: .link)
    case let .bookmark(value):
        try container.encode(value, forKey: .bookmark)
    }
}
// sourcery:end

// sourcery:inline:MusicData.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.note) {
        self = .note(try decode(.note))
    } else if container.contains(.backup) {
        self = .backup(try decode(.backup))
    } else if container.contains(.forward) {
        self = .forward(try decode(.forward))
    } else if container.contains(.attributes) {
        self = .attributes(try decode(.attributes))
    } else if container.contains(.direction) {
        self = .direction(try decode(.direction))
    } else if container.contains(.harmony) {
        self = .harmony(try decode(.harmony))
    } else if container.contains(.figuredBass) {
        self = .figuredBass(try decode(.figuredBass))
    } else if container.contains(.print) {
        self = .print(try decode(.print))
    } else if container.contains(.sound) {
        self = .sound(try decode(.sound))
    } else if container.contains(.barline) {
        self = .barline(try decode(.barline))
    } else if container.contains(.grouping) {
        self = .grouping(try decode(.grouping))
    } else if container.contains(.link) {
        self = .link(try decode(.link))
    } else if container.contains(.bookmark) {
        self = .bookmark(try decode(.bookmark))
    } else {
        throw DecodingError.typeMismatch(
            MusicData.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:MusicData.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .note:
        try container.encodeNil(forKey: .note)
    case .backup:
        try container.encodeNil(forKey: .backup)
    case .forward:
        try container.encodeNil(forKey: .forward)
    case .direction:
        try container.encodeNil(forKey: .direction)
    case .attributes:
        try container.encodeNil(forKey: .attributes)
    case .harmony:
        try container.encodeNil(forKey: .harmony)
    case .figuredBass:
        try container.encodeNil(forKey: .figuredBass)
    case .print:
        try container.encodeNil(forKey: .print)
    case .sound:
        try container.encodeNil(forKey: .sound)
    case .barline:
        try container.encodeNil(forKey: .barline)
    case .grouping:
        try container.encodeNil(forKey: .grouping)
    case .link:
        try container.encodeNil(forKey: .link)
    case .bookmark:
        try container.encodeNil(forKey: .bookmark)
    }
}
// sourcery:end

// sourcery:inline:MusicData.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.note) {
        _ = try container.decodeNil(forKey: .note)
        self = .note
    } else if container.contains(.backup) {
        _ = try container.decodeNil(forKey: .backup)
        self = .backup
    } else if container.contains(.forward) {
        _ = try container.decodeNil(forKey: .forward)
        self = .forward
    } else if container.contains(.direction) {
        _ = try container.decodeNil(forKey: .direction)
        self = .direction
    } else if container.contains(.attributes) {
        _ = try container.decodeNil(forKey: .attributes)
        self = .attributes
    } else if container.contains(.harmony) {
        _ = try container.decodeNil(forKey: .harmony)
        self = .harmony
    } else if container.contains(.figuredBass) {
        _ = try container.decodeNil(forKey: .figuredBass)
        self = .figuredBass
    } else if container.contains(.print) {
        _ = try container.decodeNil(forKey: .print)
        self = .print
    } else if container.contains(.sound) {
        _ = try container.decodeNil(forKey: .sound)
        self = .sound
    } else if container.contains(.barline) {
        _ = try container.decodeNil(forKey: .barline)
        self = .barline
    } else if container.contains(.grouping) {
        _ = try container.decodeNil(forKey: .grouping)
        self = .grouping
    } else if container.contains(.link) {
        _ = try container.decodeNil(forKey: .link)
        self = .link
    } else if container.contains(.bookmark) {
        _ = try container.decodeNil(forKey: .bookmark)
        self = .bookmark
    } else {
        throw DecodingError.typeMismatch(
            MusicData.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:MusicXML.String.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .placement:
        try container.encodeNil(forKey: .placement)
    }
}
// sourcery:end

// sourcery:inline:MusicXML.String.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.placement) {
        _ = try container.decodeNil(forKey: .placement)
        self = .placement
    } else {
        throw DecodingError.typeMismatch(
            MusicXML.String.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:NameDisplay.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .printObject:
        try container.encodeNil(forKey: .printObject)
    }
}
// sourcery:end

// sourcery:inline:NameDisplay.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.printObject) {
        _ = try container.decodeNil(forKey: .printObject)
        self = .printObject
    } else {
        throw DecodingError.typeMismatch(
            NameDisplay.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:NameDisplay.Text.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .accidentalText(value):
        try container.encode(value, forKey: .accidentalText)
    case let .displayText(value):
        try container.encode(value, forKey: .displayText)
    }
}
// sourcery:end

// sourcery:inline:NameDisplay.Text.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.accidentalText) {
        self = .accidentalText(try decode(.accidentalText))
    } else if container.contains(.displayText) {
        self = .displayText(try decode(.displayText))
    } else {
        throw DecodingError.typeMismatch(
            NameDisplay.Text.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:NameDisplay.Text.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .displayText:
        try container.encodeNil(forKey: .displayText)
    case .accidentalText:
        try container.encodeNil(forKey: .accidentalText)
    }
}
// sourcery:end

// sourcery:inline:NameDisplay.Text.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.displayText) {
        _ = try container.decodeNil(forKey: .displayText)
        self = .displayText
    } else if container.contains(.accidentalText) {
        _ = try container.decodeNil(forKey: .accidentalText)
        self = .accidentalText
    } else {
        throw DecodingError.typeMismatch(
            NameDisplay.Text.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Notations.Notation.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .tied(value):
        try container.encode(value, forKey: .tied)
    case let .slur(value):
        try container.encode(value, forKey: .slur)
    case let .tuplet(value):
        try container.encode(value, forKey: .tuplet)
    case let .glissando(value):
        try container.encode(value, forKey: .glissando)
    case let .slide(value):
        try container.encode(value, forKey: .slide)
    case let .ornaments(value):
        try container.encode(value, forKey: .ornaments)
    case let .technical(value):
        try container.encode(value, forKey: .technical)
    case let .articulations(value):
        try container.encode(value, forKey: .articulations)
    case let .dynamics(value):
        try container.encode(value, forKey: .dynamics)
    case let .fermata(value):
        try container.encode(value, forKey: .fermata)
    case let .arpeggiate(value):
        try container.encode(value, forKey: .arpeggiate)
    case let .nonArpeggiate(value):
        try container.encode(value, forKey: .nonArpeggiate)
    case let .accidentalMark(value):
        try container.encode(value, forKey: .accidentalMark)
    case let .other(value):
        try container.encode(value, forKey: .other)
    }
}
// sourcery:end

// sourcery:inline:Notations.Notation.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.tied) {
        self = .tied(try decode(.tied))
    } else if container.contains(.slur) {
        self = .slur(try decode(.slur))
    } else if container.contains(.tuplet) {
        self = .tuplet(try decode(.tuplet))
    } else if container.contains(.glissando) {
        self = .glissando(try decode(.glissando))
    } else if container.contains(.slide) {
        self = .slide(try decode(.slide))
    } else if container.contains(.ornaments) {
        self = .ornaments(try decode(.ornaments))
    } else if container.contains(.technical) {
        self = .technical(try decode(.technical))
    } else if container.contains(.articulations) {
        self = .articulations(try decode(.articulations))
    } else if container.contains(.dynamics) {
        self = .dynamics(try decode(.dynamics))
    } else if container.contains(.fermata) {
        self = .fermata(try decode(.fermata))
    } else if container.contains(.arpeggiate) {
        self = .arpeggiate(try decode(.arpeggiate))
    } else if container.contains(.nonArpeggiate) {
        self = .nonArpeggiate(try decode(.nonArpeggiate))
    } else if container.contains(.accidentalMark) {
        self = .accidentalMark(try decode(.accidentalMark))
    } else if container.contains(.other) {
        self = .other(try decode(.other))
    } else {
        throw DecodingError.typeMismatch(
            Notations.Notation.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Notations.Notation.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .tied:
        try container.encodeNil(forKey: .tied)
    case .slur:
        try container.encodeNil(forKey: .slur)
    case .tuplet:
        try container.encodeNil(forKey: .tuplet)
    case .glissando:
        try container.encodeNil(forKey: .glissando)
    case .slide:
        try container.encodeNil(forKey: .slide)
    case .ornaments:
        try container.encodeNil(forKey: .ornaments)
    case .technical:
        try container.encodeNil(forKey: .technical)
    case .articulations:
        try container.encodeNil(forKey: .articulations)
    case .dynamics:
        try container.encodeNil(forKey: .dynamics)
    case .fermata:
        try container.encodeNil(forKey: .fermata)
    case .arpeggiate:
        try container.encodeNil(forKey: .arpeggiate)
    case .nonArpeggiate:
        try container.encodeNil(forKey: .nonArpeggiate)
    case .accidentalMark:
        try container.encodeNil(forKey: .accidentalMark)
    case .other:
        try container.encodeNil(forKey: .other)
    }
}
// sourcery:end

// sourcery:inline:Notations.Notation.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.tied) {
        _ = try container.decodeNil(forKey: .tied)
        self = .tied
    } else if container.contains(.slur) {
        _ = try container.decodeNil(forKey: .slur)
        self = .slur
    } else if container.contains(.tuplet) {
        _ = try container.decodeNil(forKey: .tuplet)
        self = .tuplet
    } else if container.contains(.glissando) {
        _ = try container.decodeNil(forKey: .glissando)
        self = .glissando
    } else if container.contains(.slide) {
        _ = try container.decodeNil(forKey: .slide)
        self = .slide
    } else if container.contains(.ornaments) {
        _ = try container.decodeNil(forKey: .ornaments)
        self = .ornaments
    } else if container.contains(.technical) {
        _ = try container.decodeNil(forKey: .technical)
        self = .technical
    } else if container.contains(.articulations) {
        _ = try container.decodeNil(forKey: .articulations)
        self = .articulations
    } else if container.contains(.dynamics) {
        _ = try container.decodeNil(forKey: .dynamics)
        self = .dynamics
    } else if container.contains(.fermata) {
        _ = try container.decodeNil(forKey: .fermata)
        self = .fermata
    } else if container.contains(.arpeggiate) {
        _ = try container.decodeNil(forKey: .arpeggiate)
        self = .arpeggiate
    } else if container.contains(.nonArpeggiate) {
        _ = try container.decodeNil(forKey: .nonArpeggiate)
        self = .nonArpeggiate
    } else if container.contains(.accidentalMark) {
        _ = try container.decodeNil(forKey: .accidentalMark)
        self = .accidentalMark
    } else if container.contains(.other) {
        _ = try container.decodeNil(forKey: .other)
        self = .other
    } else {
        throw DecodingError.typeMismatch(
            Notations.Notation.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Note.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .fontFamily:
        try container.encodeNil(forKey: .fontFamily)
    case .fontStyle:
        try container.encodeNil(forKey: .fontStyle)
    case .fontSize:
        try container.encodeNil(forKey: .fontSize)
    case .fontWeight:
        try container.encodeNil(forKey: .fontWeight)
    case .color:
        try container.encodeNil(forKey: .color)
    case .printStyle:
        try container.encodeNil(forKey: .printStyle)
    case .printObject:
        try container.encodeNil(forKey: .printObject)
    case .printDot:
        try container.encodeNil(forKey: .printDot)
    case .printSpacing:
        try container.encodeNil(forKey: .printSpacing)
    case .printLyric:
        try container.encodeNil(forKey: .printLyric)
    case .dynamics:
        try container.encodeNil(forKey: .dynamics)
    case .endDynamics:
        try container.encodeNil(forKey: .endDynamics)
    case .attack:
        try container.encodeNil(forKey: .attack)
    case .release:
        try container.encodeNil(forKey: .release)
    case .timeOnly:
        try container.encodeNil(forKey: .timeOnly)
    case .pizzicato:
        try container.encodeNil(forKey: .pizzicato)
    case .instrument:
        try container.encodeNil(forKey: .instrument)
    case .footnote:
        try container.encodeNil(forKey: .footnote)
    case .level:
        try container.encodeNil(forKey: .level)
    case .voice:
        try container.encodeNil(forKey: .voice)
    case .type:
        try container.encodeNil(forKey: .type)
    case .dots:
        try container.encodeNil(forKey: .dots)
    case .accidental:
        try container.encodeNil(forKey: .accidental)
    case .timeModification:
        try container.encodeNil(forKey: .timeModification)
    case .stem:
        try container.encodeNil(forKey: .stem)
    case .notehead:
        try container.encodeNil(forKey: .notehead)
    case .noteheadText:
        try container.encodeNil(forKey: .noteheadText)
    case .staff:
        try container.encodeNil(forKey: .staff)
    case .beams:
        try container.encodeNil(forKey: .beams)
    case .notations:
        try container.encodeNil(forKey: .notations)
    case .lyrics:
        try container.encodeNil(forKey: .lyrics)
    case .play:
        try container.encodeNil(forKey: .play)
    case .grace:
        try container.encodeNil(forKey: .grace)
    case .cue:
        try container.encodeNil(forKey: .cue)
    case .chord:
        try container.encodeNil(forKey: .chord)
    case .duration:
        try container.encodeNil(forKey: .duration)
    case .tie:
        try container.encodeNil(forKey: .tie)
    case .pitch:
        try container.encodeNil(forKey: .pitch)
    case .rest:
        try container.encodeNil(forKey: .rest)
    case .unpitched:
        try container.encodeNil(forKey: .unpitched)
    }
}
// sourcery:end

// sourcery:inline:Note.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.fontFamily) {
        _ = try container.decodeNil(forKey: .fontFamily)
        self = .fontFamily
    } else if container.contains(.fontStyle) {
        _ = try container.decodeNil(forKey: .fontStyle)
        self = .fontStyle
    } else if container.contains(.fontSize) {
        _ = try container.decodeNil(forKey: .fontSize)
        self = .fontSize
    } else if container.contains(.fontWeight) {
        _ = try container.decodeNil(forKey: .fontWeight)
        self = .fontWeight
    } else if container.contains(.color) {
        _ = try container.decodeNil(forKey: .color)
        self = .color
    } else if container.contains(.printStyle) {
        _ = try container.decodeNil(forKey: .printStyle)
        self = .printStyle
    } else if container.contains(.printObject) {
        _ = try container.decodeNil(forKey: .printObject)
        self = .printObject
    } else if container.contains(.printDot) {
        _ = try container.decodeNil(forKey: .printDot)
        self = .printDot
    } else if container.contains(.printSpacing) {
        _ = try container.decodeNil(forKey: .printSpacing)
        self = .printSpacing
    } else if container.contains(.printLyric) {
        _ = try container.decodeNil(forKey: .printLyric)
        self = .printLyric
    } else if container.contains(.dynamics) {
        _ = try container.decodeNil(forKey: .dynamics)
        self = .dynamics
    } else if container.contains(.endDynamics) {
        _ = try container.decodeNil(forKey: .endDynamics)
        self = .endDynamics
    } else if container.contains(.attack) {
        _ = try container.decodeNil(forKey: .attack)
        self = .attack
    } else if container.contains(.release) {
        _ = try container.decodeNil(forKey: .release)
        self = .release
    } else if container.contains(.timeOnly) {
        _ = try container.decodeNil(forKey: .timeOnly)
        self = .timeOnly
    } else if container.contains(.pizzicato) {
        _ = try container.decodeNil(forKey: .pizzicato)
        self = .pizzicato
    } else if container.contains(.instrument) {
        _ = try container.decodeNil(forKey: .instrument)
        self = .instrument
    } else if container.contains(.footnote) {
        _ = try container.decodeNil(forKey: .footnote)
        self = .footnote
    } else if container.contains(.level) {
        _ = try container.decodeNil(forKey: .level)
        self = .level
    } else if container.contains(.voice) {
        _ = try container.decodeNil(forKey: .voice)
        self = .voice
    } else if container.contains(.type) {
        _ = try container.decodeNil(forKey: .type)
        self = .type
    } else if container.contains(.dots) {
        _ = try container.decodeNil(forKey: .dots)
        self = .dots
    } else if container.contains(.accidental) {
        _ = try container.decodeNil(forKey: .accidental)
        self = .accidental
    } else if container.contains(.timeModification) {
        _ = try container.decodeNil(forKey: .timeModification)
        self = .timeModification
    } else if container.contains(.stem) {
        _ = try container.decodeNil(forKey: .stem)
        self = .stem
    } else if container.contains(.notehead) {
        _ = try container.decodeNil(forKey: .notehead)
        self = .notehead
    } else if container.contains(.noteheadText) {
        _ = try container.decodeNil(forKey: .noteheadText)
        self = .noteheadText
    } else if container.contains(.staff) {
        _ = try container.decodeNil(forKey: .staff)
        self = .staff
    } else if container.contains(.beams) {
        _ = try container.decodeNil(forKey: .beams)
        self = .beams
    } else if container.contains(.notations) {
        _ = try container.decodeNil(forKey: .notations)
        self = .notations
    } else if container.contains(.lyrics) {
        _ = try container.decodeNil(forKey: .lyrics)
        self = .lyrics
    } else if container.contains(.play) {
        _ = try container.decodeNil(forKey: .play)
        self = .play
    } else if container.contains(.grace) {
        _ = try container.decodeNil(forKey: .grace)
        self = .grace
    } else if container.contains(.cue) {
        _ = try container.decodeNil(forKey: .cue)
        self = .cue
    } else if container.contains(.chord) {
        _ = try container.decodeNil(forKey: .chord)
        self = .chord
    } else if container.contains(.duration) {
        _ = try container.decodeNil(forKey: .duration)
        self = .duration
    } else if container.contains(.tie) {
        _ = try container.decodeNil(forKey: .tie)
        self = .tie
    } else if container.contains(.pitch) {
        _ = try container.decodeNil(forKey: .pitch)
        self = .pitch
    } else if container.contains(.rest) {
        _ = try container.decodeNil(forKey: .rest)
        self = .rest
    } else if container.contains(.unpitched) {
        _ = try container.decodeNil(forKey: .unpitched)
        self = .unpitched
    } else {
        throw DecodingError.typeMismatch(
            Note.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Note.Kind.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .normal(value):
        try container.encode(value, forKey: .normal)
    case let .cue(value):
        try container.encode(value, forKey: .cue)
    case let .grace(value):
        try container.encode(value, forKey: .grace)
    }
}
// sourcery:end

// sourcery:inline:Note.Kind.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.normal) {
        self = .normal(try decode(.normal))
    } else if container.contains(.cue) {
        self = .cue(try decode(.cue))
    } else if container.contains(.grace) {
        self = .grace(try decode(.grace))
    } else {
        throw DecodingError.typeMismatch(
            Note.Kind.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Notehead.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .filled:
        try container.encodeNil(forKey: .filled)
    case .parentheses:
        try container.encodeNil(forKey: .parentheses)
    case .color:
        try container.encodeNil(forKey: .color)
    }
}
// sourcery:end

// sourcery:inline:Notehead.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.filled) {
        _ = try container.decodeNil(forKey: .filled)
        self = .filled
    } else if container.contains(.parentheses) {
        _ = try container.decodeNil(forKey: .parentheses)
        self = .parentheses
    } else if container.contains(.color) {
        _ = try container.decodeNil(forKey: .color)
        self = .color
    } else {
        throw DecodingError.typeMismatch(
            Notehead.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:NoteheadText.Kind.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .displayText(value):
        try container.encode(value, forKey: .displayText)
    case let .accidentalText(value):
        try container.encode(value, forKey: .accidentalText)
    }
}
// sourcery:end

// sourcery:inline:NoteheadText.Kind.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.displayText) {
        self = .displayText(try decode(.displayText))
    } else if container.contains(.accidentalText) {
        self = .accidentalText(try decode(.accidentalText))
    } else {
        throw DecodingError.typeMismatch(
            NoteheadText.Kind.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:NoteheadText.Kind.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .displayText:
        try container.encodeNil(forKey: .displayText)
    case .accidentalText:
        try container.encodeNil(forKey: .accidentalText)
    }
}
// sourcery:end

// sourcery:inline:NoteheadText.Kind.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.displayText) {
        _ = try container.decodeNil(forKey: .displayText)
        self = .displayText
    } else if container.contains(.accidentalText) {
        _ = try container.decodeNil(forKey: .accidentalText)
        self = .accidentalText
    } else {
        throw DecodingError.typeMismatch(
            NoteheadText.Kind.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:OctaveShift.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .type:
        try container.encodeNil(forKey: .type)
    case .number:
        try container.encodeNil(forKey: .number)
    case .size:
        try container.encodeNil(forKey: .size)
    }
}
// sourcery:end

// sourcery:inline:OctaveShift.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.type) {
        _ = try container.decodeNil(forKey: .type)
        self = .type
    } else if container.contains(.number) {
        _ = try container.decodeNil(forKey: .number)
        self = .number
    } else if container.contains(.size) {
        _ = try container.decodeNil(forKey: .size)
        self = .size
    } else {
        throw DecodingError.typeMismatch(
            OctaveShift.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Offset.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .sound:
        try container.encodeNil(forKey: .sound)
    }
}
// sourcery:end

// sourcery:inline:Offset.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.sound) {
        _ = try container.decodeNil(forKey: .sound)
        self = .sound
    } else {
        throw DecodingError.typeMismatch(
            Offset.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Ornament.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .delayedInvertedTurn(value):
        try container.encode(value, forKey: .delayedInvertedTurn)
    case let .delayedTurn(value):
        try container.encode(value, forKey: .delayedTurn)
    case let .invertedMordent(value):
        try container.encode(value, forKey: .invertedMordent)
    case let .invertedTurn(value):
        try container.encode(value, forKey: .invertedTurn)
    case let .mordent(value):
        try container.encode(value, forKey: .mordent)
    case let .otherOrnament(value):
        try container.encode(value, forKey: .otherOrnament)
    case let .shake(value):
        try container.encode(value, forKey: .shake)
    case let .tremolo(value):
        try container.encode(value, forKey: .tremolo)
    case let .trillMark(value):
        try container.encode(value, forKey: .trillMark)
    case let .turn(value):
        try container.encode(value, forKey: .turn)
    case let .verticalTurn(value):
        try container.encode(value, forKey: .verticalTurn)
    case let .wavyLine(value):
        try container.encode(value, forKey: .wavyLine)
    }
}
// sourcery:end

// sourcery:inline:Ornament.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.delayedInvertedTurn) {
        self = .delayedInvertedTurn(try decode(.delayedInvertedTurn))
    } else if container.contains(.delayedTurn) {
        self = .delayedTurn(try decode(.delayedTurn))
    } else if container.contains(.invertedMordent) {
        self = .invertedMordent(try decode(.invertedMordent))
    } else if container.contains(.invertedTurn) {
        self = .invertedTurn(try decode(.invertedTurn))
    } else if container.contains(.mordent) {
        self = .mordent(try decode(.mordent))
    } else if container.contains(.otherOrnament) {
        self = .otherOrnament(try decode(.otherOrnament))
    } else if container.contains(.shake) {
        self = .shake(try decode(.shake))
    } else if container.contains(.tremolo) {
        self = .tremolo(try decode(.tremolo))
    } else if container.contains(.trillMark) {
        self = .trillMark(try decode(.trillMark))
    } else if container.contains(.turn) {
        self = .turn(try decode(.turn))
    } else if container.contains(.verticalTurn) {
        self = .verticalTurn(try decode(.verticalTurn))
    } else if container.contains(.wavyLine) {
        self = .wavyLine(try decode(.wavyLine))
    } else {
        throw DecodingError.typeMismatch(
            Ornament.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Ornament.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .delayedInvertedTurn:
        try container.encodeNil(forKey: .delayedInvertedTurn)
    case .delayedTurn:
        try container.encodeNil(forKey: .delayedTurn)
    case .invertedMordent:
        try container.encodeNil(forKey: .invertedMordent)
    case .invertedTurn:
        try container.encodeNil(forKey: .invertedTurn)
    case .mordent:
        try container.encodeNil(forKey: .mordent)
    case .otherOrnament:
        try container.encodeNil(forKey: .otherOrnament)
    case .shake:
        try container.encodeNil(forKey: .shake)
    case .tremolo:
        try container.encodeNil(forKey: .tremolo)
    case .trillMark:
        try container.encodeNil(forKey: .trillMark)
    case .turn:
        try container.encodeNil(forKey: .turn)
    case .verticalTurn:
        try container.encodeNil(forKey: .verticalTurn)
    case .wavyLine:
        try container.encodeNil(forKey: .wavyLine)
    }
}
// sourcery:end

// sourcery:inline:Ornament.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.delayedInvertedTurn) {
        _ = try container.decodeNil(forKey: .delayedInvertedTurn)
        self = .delayedInvertedTurn
    } else if container.contains(.delayedTurn) {
        _ = try container.decodeNil(forKey: .delayedTurn)
        self = .delayedTurn
    } else if container.contains(.invertedMordent) {
        _ = try container.decodeNil(forKey: .invertedMordent)
        self = .invertedMordent
    } else if container.contains(.invertedTurn) {
        _ = try container.decodeNil(forKey: .invertedTurn)
        self = .invertedTurn
    } else if container.contains(.mordent) {
        _ = try container.decodeNil(forKey: .mordent)
        self = .mordent
    } else if container.contains(.otherOrnament) {
        _ = try container.decodeNil(forKey: .otherOrnament)
        self = .otherOrnament
    } else if container.contains(.shake) {
        _ = try container.decodeNil(forKey: .shake)
        self = .shake
    } else if container.contains(.tremolo) {
        _ = try container.decodeNil(forKey: .tremolo)
        self = .tremolo
    } else if container.contains(.trillMark) {
        _ = try container.decodeNil(forKey: .trillMark)
        self = .trillMark
    } else if container.contains(.turn) {
        _ = try container.decodeNil(forKey: .turn)
        self = .turn
    } else if container.contains(.verticalTurn) {
        _ = try container.decodeNil(forKey: .verticalTurn)
        self = .verticalTurn
    } else if container.contains(.wavyLine) {
        _ = try container.decodeNil(forKey: .wavyLine)
        self = .wavyLine
    } else {
        throw DecodingError.typeMismatch(
            Ornament.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Ornaments.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .accidentalMarks:
        try container.encodeNil(forKey: .accidentalMarks)
    }
}
// sourcery:end

// sourcery:inline:Ornaments.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.accidentalMarks) {
        _ = try container.decodeNil(forKey: .accidentalMarks)
        self = .accidentalMarks
    } else {
        throw DecodingError.typeMismatch(
            Ornaments.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:PageMargins.Kind.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .odd:
        try container.encodeNil(forKey: .odd)
    case .even:
        try container.encodeNil(forKey: .even)
    case .both:
        try container.encodeNil(forKey: .both)
    }
}
// sourcery:end

// sourcery:inline:PageMargins.Kind.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.odd) {
        _ = try container.decodeNil(forKey: .odd)
        self = .odd
    } else if container.contains(.even) {
        _ = try container.decodeNil(forKey: .even)
        self = .even
    } else if container.contains(.both) {
        _ = try container.decodeNil(forKey: .both)
        self = .both
    } else {
        throw DecodingError.typeMismatch(
            PageMargins.Kind.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:PartGroup.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .type:
        try container.encodeNil(forKey: .type)
    case .number:
        try container.encodeNil(forKey: .number)
    case .name:
        try container.encodeNil(forKey: .name)
    case .nameDisplay:
        try container.encodeNil(forKey: .nameDisplay)
    case .abbreviation:
        try container.encodeNil(forKey: .abbreviation)
    case .abbreviationDisplay:
        try container.encodeNil(forKey: .abbreviationDisplay)
    case .symbol:
        try container.encodeNil(forKey: .symbol)
    case .barline:
        try container.encodeNil(forKey: .barline)
    case .time:
        try container.encodeNil(forKey: .time)
    case .editorial:
        try container.encodeNil(forKey: .editorial)
    }
}
// sourcery:end

// sourcery:inline:PartGroup.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.type) {
        _ = try container.decodeNil(forKey: .type)
        self = .type
    } else if container.contains(.number) {
        _ = try container.decodeNil(forKey: .number)
        self = .number
    } else if container.contains(.name) {
        _ = try container.decodeNil(forKey: .name)
        self = .name
    } else if container.contains(.nameDisplay) {
        _ = try container.decodeNil(forKey: .nameDisplay)
        self = .nameDisplay
    } else if container.contains(.abbreviation) {
        _ = try container.decodeNil(forKey: .abbreviation)
        self = .abbreviation
    } else if container.contains(.abbreviationDisplay) {
        _ = try container.decodeNil(forKey: .abbreviationDisplay)
        self = .abbreviationDisplay
    } else if container.contains(.symbol) {
        _ = try container.decodeNil(forKey: .symbol)
        self = .symbol
    } else if container.contains(.barline) {
        _ = try container.decodeNil(forKey: .barline)
        self = .barline
    } else if container.contains(.time) {
        _ = try container.decodeNil(forKey: .time)
        self = .time
    } else if container.contains(.editorial) {
        _ = try container.decodeNil(forKey: .editorial)
        self = .editorial
    } else {
        throw DecodingError.typeMismatch(
            PartGroup.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:PartList.Item.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .group(value):
        try container.encode(value, forKey: .group)
    case let .part(value):
        try container.encode(value, forKey: .part)
    }
}
// sourcery:end

// sourcery:inline:PartList.Item.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.group) {
        self = .group(try decode(.group))
    } else if container.contains(.part) {
        self = .part(try decode(.part))
    } else {
        throw DecodingError.typeMismatch(
            PartList.Item.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:PartList.Item.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .group:
        try container.encodeNil(forKey: .group)
    case .part:
        try container.encodeNil(forKey: .part)
    }
}
// sourcery:end

// sourcery:inline:PartList.Item.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.group) {
        _ = try container.decodeNil(forKey: .group)
        self = .group
    } else if container.contains(.part) {
        _ = try container.decodeNil(forKey: .part)
        self = .part
    } else {
        throw DecodingError.typeMismatch(
            PartList.Item.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:PartName.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .printObject:
        try container.encodeNil(forKey: .printObject)
    case .justify:
        try container.encodeNil(forKey: .justify)
    }
}
// sourcery:end

// sourcery:inline:PartName.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.printObject) {
        _ = try container.decodeNil(forKey: .printObject)
        self = .printObject
    } else if container.contains(.justify) {
        _ = try container.decodeNil(forKey: .justify)
        self = .justify
    } else {
        throw DecodingError.typeMismatch(
            PartName.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Partwise.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .parts:
        try container.encodeNil(forKey: .parts)
    }
}
// sourcery:end

// sourcery:inline:Partwise.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.parts) {
        _ = try container.decodeNil(forKey: .parts)
        self = .parts
    } else {
        throw DecodingError.typeMismatch(
            Partwise.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Partwise.Measure.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .number:
        try container.encodeNil(forKey: .number)
    case .text:
        try container.encodeNil(forKey: .text)
    case .implicit:
        try container.encodeNil(forKey: .implicit)
    case .nonControlling:
        try container.encodeNil(forKey: .nonControlling)
    case .width:
        try container.encodeNil(forKey: .width)
    case .optionalUniqueID:
        try container.encodeNil(forKey: .optionalUniqueID)
    case .musicData:
        try container.encodeNil(forKey: .musicData)
    }
}
// sourcery:end

// sourcery:inline:Partwise.Measure.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.number) {
        _ = try container.decodeNil(forKey: .number)
        self = .number
    } else if container.contains(.text) {
        _ = try container.decodeNil(forKey: .text)
        self = .text
    } else if container.contains(.implicit) {
        _ = try container.decodeNil(forKey: .implicit)
        self = .implicit
    } else if container.contains(.nonControlling) {
        _ = try container.decodeNil(forKey: .nonControlling)
        self = .nonControlling
    } else if container.contains(.width) {
        _ = try container.decodeNil(forKey: .width)
        self = .width
    } else if container.contains(.optionalUniqueID) {
        _ = try container.decodeNil(forKey: .optionalUniqueID)
        self = .optionalUniqueID
    } else if container.contains(.musicData) {
        _ = try container.decodeNil(forKey: .musicData)
        self = .musicData
    } else {
        throw DecodingError.typeMismatch(
            Partwise.Measure.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Partwise.Part.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .id:
        try container.encodeNil(forKey: .id)
    case .measures:
        try container.encodeNil(forKey: .measures)
    }
}
// sourcery:end

// sourcery:inline:Partwise.Part.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.id) {
        _ = try container.decodeNil(forKey: .id)
        self = .id
    } else if container.contains(.measures) {
        _ = try container.decodeNil(forKey: .measures)
        self = .measures
    } else {
        throw DecodingError.typeMismatch(
            Partwise.Part.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:PedalTuning.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .step:
        try container.encodeNil(forKey: .step)
    case .alter:
        try container.encodeNil(forKey: .alter)
    }
}
// sourcery:end

// sourcery:inline:PedalTuning.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.step) {
        _ = try container.decodeNil(forKey: .step)
        self = .step
    } else if container.contains(.alter) {
        _ = try container.decodeNil(forKey: .alter)
        self = .alter
    } else {
        throw DecodingError.typeMismatch(
            PedalTuning.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Percussion.Kind.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .beater(value):
        try container.encode(value, forKey: .beater)
    case let .effect(value):
        try container.encode(value, forKey: .effect)
    case let .glass(value):
        try container.encode(value, forKey: .glass)
    case let .membrane(value):
        try container.encode(value, forKey: .membrane)
    case let .metal(value):
        try container.encode(value, forKey: .metal)
    case let .other(value):
        try container.encode(value, forKey: .other)
    case let .pitched(value):
        try container.encode(value, forKey: .pitched)
    case let .stick(value):
        try container.encode(value, forKey: .stick)
    case let .stickLocation(value):
        try container.encode(value, forKey: .stickLocation)
    case let .timpani(value):
        try container.encode(value, forKey: .timpani)
    case let .wood(value):
        try container.encode(value, forKey: .wood)
    }
}
// sourcery:end

// sourcery:inline:Percussion.Kind.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.beater) {
        self = .beater(try decode(.beater))
    } else if container.contains(.effect) {
        self = .effect(try decode(.effect))
    } else if container.contains(.glass) {
        self = .glass(try decode(.glass))
    } else if container.contains(.membrane) {
        self = .membrane(try decode(.membrane))
    } else if container.contains(.metal) {
        self = .metal(try decode(.metal))
    } else if container.contains(.other) {
        self = .other(try decode(.other))
    } else if container.contains(.pitched) {
        self = .pitched(try decode(.pitched))
    } else if container.contains(.stick) {
        self = .stick(try decode(.stick))
    } else if container.contains(.stickLocation) {
        self = .stickLocation(try decode(.stickLocation))
    } else if container.contains(.timpani) {
        self = .timpani(try decode(.timpani))
    } else if container.contains(.wood) {
        self = .wood(try decode(.wood))
    } else {
        throw DecodingError.typeMismatch(
            Percussion.Kind.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Percussion.Kind.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .beater:
        try container.encodeNil(forKey: .beater)
    case .effect:
        try container.encodeNil(forKey: .effect)
    case .glass:
        try container.encodeNil(forKey: .glass)
    case .membrane:
        try container.encodeNil(forKey: .membrane)
    case .metal:
        try container.encodeNil(forKey: .metal)
    case .other:
        try container.encodeNil(forKey: .other)
    case .pitched:
        try container.encodeNil(forKey: .pitched)
    case .stick:
        try container.encodeNil(forKey: .stick)
    case .stickLocation:
        try container.encodeNil(forKey: .stickLocation)
    case .timpani:
        try container.encodeNil(forKey: .timpani)
    case .wood:
        try container.encodeNil(forKey: .wood)
    }
}
// sourcery:end

// sourcery:inline:Percussion.Kind.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.beater) {
        _ = try container.decodeNil(forKey: .beater)
        self = .beater
    } else if container.contains(.effect) {
        _ = try container.decodeNil(forKey: .effect)
        self = .effect
    } else if container.contains(.glass) {
        _ = try container.decodeNil(forKey: .glass)
        self = .glass
    } else if container.contains(.membrane) {
        _ = try container.decodeNil(forKey: .membrane)
        self = .membrane
    } else if container.contains(.metal) {
        _ = try container.decodeNil(forKey: .metal)
        self = .metal
    } else if container.contains(.other) {
        _ = try container.decodeNil(forKey: .other)
        self = .other
    } else if container.contains(.pitched) {
        _ = try container.decodeNil(forKey: .pitched)
        self = .pitched
    } else if container.contains(.stick) {
        _ = try container.decodeNil(forKey: .stick)
        self = .stick
    } else if container.contains(.stickLocation) {
        _ = try container.decodeNil(forKey: .stickLocation)
        self = .stickLocation
    } else if container.contains(.timpani) {
        _ = try container.decodeNil(forKey: .timpani)
        self = .timpani
    } else if container.contains(.wood) {
        _ = try container.decodeNil(forKey: .wood)
        self = .wood
    } else {
        throw DecodingError.typeMismatch(
            Percussion.Kind.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:PitchUnpitchedOrRest.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .pitch(value):
        try container.encode(value, forKey: .pitch)
    case let .unpitched(value):
        try container.encode(value, forKey: .unpitched)
    case let .rest(value):
        try container.encode(value, forKey: .rest)
    }
}
// sourcery:end

// sourcery:inline:PitchUnpitchedOrRest.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.pitch) {
        self = .pitch(try decode(.pitch))
    } else if container.contains(.unpitched) {
        self = .unpitched(try decode(.unpitched))
    } else if container.contains(.rest) {
        self = .rest(try decode(.rest))
    } else {
        throw DecodingError.typeMismatch(
            PitchUnpitchedOrRest.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:PitchUnpitchedOrRest.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .pitch:
        try container.encodeNil(forKey: .pitch)
    case .unpitched:
        try container.encodeNil(forKey: .unpitched)
    case .rest:
        try container.encodeNil(forKey: .rest)
    }
}
// sourcery:end

// sourcery:inline:PitchUnpitchedOrRest.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.pitch) {
        _ = try container.decodeNil(forKey: .pitch)
        self = .pitch
    } else if container.contains(.unpitched) {
        _ = try container.decodeNil(forKey: .unpitched)
        self = .unpitched
    } else if container.contains(.rest) {
        _ = try container.decodeNil(forKey: .rest)
        self = .rest
    } else {
        throw DecodingError.typeMismatch(
            PitchUnpitchedOrRest.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Play.Kind.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .ipa(value):
        try container.encode(value, forKey: .ipa)
    case let .mute(value):
        try container.encode(value, forKey: .mute)
    case let .semiPitched(value):
        try container.encode(value, forKey: .semiPitched)
    case let .otherPlay(value):
        try container.encode(value, forKey: .otherPlay)
    }
}
// sourcery:end

// sourcery:inline:Play.Kind.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.ipa) {
        self = .ipa(try decode(.ipa))
    } else if container.contains(.mute) {
        self = .mute(try decode(.mute))
    } else if container.contains(.semiPitched) {
        self = .semiPitched(try decode(.semiPitched))
    } else if container.contains(.otherPlay) {
        self = .otherPlay(try decode(.otherPlay))
    } else {
        throw DecodingError.typeMismatch(
            Play.Kind.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Play.Kind.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .ipa:
        try container.encodeNil(forKey: .ipa)
    case .mute:
        try container.encodeNil(forKey: .mute)
    case .semiPitched:
        try container.encodeNil(forKey: .semiPitched)
    case .otherPlay:
        try container.encodeNil(forKey: .otherPlay)
    }
}
// sourcery:end

// sourcery:inline:Play.Kind.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.ipa) {
        _ = try container.decodeNil(forKey: .ipa)
        self = .ipa
    } else if container.contains(.mute) {
        _ = try container.decodeNil(forKey: .mute)
        self = .mute
    } else if container.contains(.semiPitched) {
        _ = try container.decodeNil(forKey: .semiPitched)
        self = .semiPitched
    } else if container.contains(.otherPlay) {
        _ = try container.decodeNil(forKey: .otherPlay)
        self = .otherPlay
    } else {
        throw DecodingError.typeMismatch(
            Play.Kind.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Position.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .defaultX:
        try container.encodeNil(forKey: .defaultX)
    case .defaultY:
        try container.encodeNil(forKey: .defaultY)
    case .relativeX:
        try container.encodeNil(forKey: .relativeX)
    case .relativeY:
        try container.encodeNil(forKey: .relativeY)
    }
}
// sourcery:end

// sourcery:inline:Position.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.defaultX) {
        _ = try container.decodeNil(forKey: .defaultX)
        self = .defaultX
    } else if container.contains(.defaultY) {
        _ = try container.decodeNil(forKey: .defaultY)
        self = .defaultY
    } else if container.contains(.relativeX) {
        _ = try container.decodeNil(forKey: .relativeX)
        self = .relativeX
    } else if container.contains(.relativeY) {
        _ = try container.decodeNil(forKey: .relativeY)
        self = .relativeY
    } else {
        throw DecodingError.typeMismatch(
            Position.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Print.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .pageLayout:
        try container.encodeNil(forKey: .pageLayout)
    case .systemLayout:
        try container.encodeNil(forKey: .systemLayout)
    case .staffLayout:
        try container.encodeNil(forKey: .staffLayout)
    case .measureLayout:
        try container.encodeNil(forKey: .measureLayout)
    case .measureNumbering:
        try container.encodeNil(forKey: .measureNumbering)
    case .partNameDisplay:
        try container.encodeNil(forKey: .partNameDisplay)
    case .partAbbreviationDisplay:
        try container.encodeNil(forKey: .partAbbreviationDisplay)
    case .staffSpacing:
        try container.encodeNil(forKey: .staffSpacing)
    case .newSystem:
        try container.encodeNil(forKey: .newSystem)
    case .newPage:
        try container.encodeNil(forKey: .newPage)
    case .blankPage:
        try container.encodeNil(forKey: .blankPage)
    case .pageNumber:
        try container.encodeNil(forKey: .pageNumber)
    }
}
// sourcery:end

// sourcery:inline:Print.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.pageLayout) {
        _ = try container.decodeNil(forKey: .pageLayout)
        self = .pageLayout
    } else if container.contains(.systemLayout) {
        _ = try container.decodeNil(forKey: .systemLayout)
        self = .systemLayout
    } else if container.contains(.staffLayout) {
        _ = try container.decodeNil(forKey: .staffLayout)
        self = .staffLayout
    } else if container.contains(.measureLayout) {
        _ = try container.decodeNil(forKey: .measureLayout)
        self = .measureLayout
    } else if container.contains(.measureNumbering) {
        _ = try container.decodeNil(forKey: .measureNumbering)
        self = .measureNumbering
    } else if container.contains(.partNameDisplay) {
        _ = try container.decodeNil(forKey: .partNameDisplay)
        self = .partNameDisplay
    } else if container.contains(.partAbbreviationDisplay) {
        _ = try container.decodeNil(forKey: .partAbbreviationDisplay)
        self = .partAbbreviationDisplay
    } else if container.contains(.staffSpacing) {
        _ = try container.decodeNil(forKey: .staffSpacing)
        self = .staffSpacing
    } else if container.contains(.newSystem) {
        _ = try container.decodeNil(forKey: .newSystem)
        self = .newSystem
    } else if container.contains(.newPage) {
        _ = try container.decodeNil(forKey: .newPage)
        self = .newPage
    } else if container.contains(.blankPage) {
        _ = try container.decodeNil(forKey: .blankPage)
        self = .blankPage
    } else if container.contains(.pageNumber) {
        _ = try container.decodeNil(forKey: .pageNumber)
        self = .pageNumber
    } else {
        throw DecodingError.typeMismatch(
            Print.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:PrintStyle.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .color:
        try container.encodeNil(forKey: .color)
    }
}
// sourcery:end

// sourcery:inline:PrintStyle.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.color) {
        _ = try container.decodeNil(forKey: .color)
        self = .color
    } else {
        throw DecodingError.typeMismatch(
            PrintStyle.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:PrintStyleAlign.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .hAlign:
        try container.encodeNil(forKey: .hAlign)
    case .vAlign:
        try container.encodeNil(forKey: .vAlign)
    }
}
// sourcery:end

// sourcery:inline:PrintStyleAlign.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.hAlign) {
        _ = try container.decodeNil(forKey: .hAlign)
        self = .hAlign
    } else if container.contains(.vAlign) {
        _ = try container.decodeNil(forKey: .vAlign)
        self = .vAlign
    } else {
        throw DecodingError.typeMismatch(
            PrintStyleAlign.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Rest.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .measure:
        try container.encodeNil(forKey: .measure)
    case .displayStep:
        try container.encodeNil(forKey: .displayStep)
    case .displayOctave:
        try container.encodeNil(forKey: .displayOctave)
    }
}
// sourcery:end

// sourcery:inline:Rest.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.measure) {
        _ = try container.decodeNil(forKey: .measure)
        self = .measure
    } else if container.contains(.displayStep) {
        _ = try container.decodeNil(forKey: .displayStep)
        self = .displayStep
    } else if container.contains(.displayOctave) {
        _ = try container.decodeNil(forKey: .displayOctave)
        self = .displayOctave
    } else {
        throw DecodingError.typeMismatch(
            Rest.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Rights.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .type:
        try container.encodeNil(forKey: .type)
    }
}
// sourcery:end

// sourcery:inline:Rights.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.type) {
        _ = try container.decodeNil(forKey: .type)
        self = .type
    } else {
        throw DecodingError.typeMismatch(
            Rights.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Root.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .step:
        try container.encodeNil(forKey: .step)
    case .alter:
        try container.encodeNil(forKey: .alter)
    }
}
// sourcery:end

// sourcery:inline:Root.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.step) {
        _ = try container.decodeNil(forKey: .step)
        self = .step
    } else if container.contains(.alter) {
        _ = try container.decodeNil(forKey: .alter)
        self = .alter
    } else {
        throw DecodingError.typeMismatch(
            Root.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:RootAlter.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .printObject:
        try container.encodeNil(forKey: .printObject)
    case .location:
        try container.encodeNil(forKey: .location)
    }
}
// sourcery:end

// sourcery:inline:RootAlter.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.printObject) {
        _ = try container.decodeNil(forKey: .printObject)
        self = .printObject
    } else if container.contains(.location) {
        _ = try container.decodeNil(forKey: .location)
        self = .location
    } else {
        throw DecodingError.typeMismatch(
            RootAlter.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:RootStep.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .text:
        try container.encodeNil(forKey: .text)
    }
}
// sourcery:end

// sourcery:inline:RootStep.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.text) {
        _ = try container.decodeNil(forKey: .text)
        self = .text
    } else {
        throw DecodingError.typeMismatch(
            RootStep.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Scordatura.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .accords:
        try container.encodeNil(forKey: .accords)
    }
}
// sourcery:end

// sourcery:inline:Scordatura.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.accords) {
        _ = try container.decodeNil(forKey: .accords)
        self = .accords
    } else {
        throw DecodingError.typeMismatch(
            Scordatura.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:ScoreInstrument.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .id:
        try container.encodeNil(forKey: .id)
    case .instrumentName:
        try container.encodeNil(forKey: .instrumentName)
    case .instrumentAbbreviation:
        try container.encodeNil(forKey: .instrumentAbbreviation)
    case .sound:
        try container.encodeNil(forKey: .sound)
    case .soloOrEnsemble:
        try container.encodeNil(forKey: .soloOrEnsemble)
    case .virtualInstrument:
        try container.encodeNil(forKey: .virtualInstrument)
    }
}
// sourcery:end

// sourcery:inline:ScoreInstrument.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.id) {
        _ = try container.decodeNil(forKey: .id)
        self = .id
    } else if container.contains(.instrumentName) {
        _ = try container.decodeNil(forKey: .instrumentName)
        self = .instrumentName
    } else if container.contains(.instrumentAbbreviation) {
        _ = try container.decodeNil(forKey: .instrumentAbbreviation)
        self = .instrumentAbbreviation
    } else if container.contains(.sound) {
        _ = try container.decodeNil(forKey: .sound)
        self = .sound
    } else if container.contains(.soloOrEnsemble) {
        _ = try container.decodeNil(forKey: .soloOrEnsemble)
        self = .soloOrEnsemble
    } else if container.contains(.virtualInstrument) {
        _ = try container.decodeNil(forKey: .virtualInstrument)
        self = .virtualInstrument
    } else {
        throw DecodingError.typeMismatch(
            ScoreInstrument.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:ScoreInstrument.SoloEnsemble.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .solo:
        try container.encodeNil(forKey: .solo)
    case let .ensemble(value):
        try container.encode(value, forKey: .ensemble)
    }
}
// sourcery:end

// sourcery:inline:ScoreInstrument.SoloEnsemble.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.solo) {
        _ = try container.decodeNil(forKey: .solo)
        self = .solo
    } else if container.contains(.ensemble) {
        self = .ensemble(try decode(.ensemble))
    } else {
        throw DecodingError.typeMismatch(
            ScoreInstrument.SoloEnsemble.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:ScoreInstrument.SoloEnsemble.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .solo:
        try container.encodeNil(forKey: .solo)
    case .ensemble:
        try container.encodeNil(forKey: .ensemble)
    }
}
// sourcery:end

// sourcery:inline:ScoreInstrument.SoloEnsemble.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.solo) {
        _ = try container.decodeNil(forKey: .solo)
        self = .solo
    } else if container.contains(.ensemble) {
        _ = try container.decodeNil(forKey: .ensemble)
        self = .ensemble
    } else {
        throw DecodingError.typeMismatch(
            ScoreInstrument.SoloEnsemble.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:ScorePart.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .id:
        try container.encodeNil(forKey: .id)
    case .identification:
        try container.encodeNil(forKey: .identification)
    case .name:
        try container.encodeNil(forKey: .name)
    case .nameDisplay:
        try container.encodeNil(forKey: .nameDisplay)
    case .partAbbreviation:
        try container.encodeNil(forKey: .partAbbreviation)
    case .partAbbreviationDisplay:
        try container.encodeNil(forKey: .partAbbreviationDisplay)
    case .group:
        try container.encodeNil(forKey: .group)
    case .scoreInstrument:
        try container.encodeNil(forKey: .scoreInstrument)
    case .midiDevice:
        try container.encodeNil(forKey: .midiDevice)
    case .midiInstrument:
        try container.encodeNil(forKey: .midiInstrument)
    }
}
// sourcery:end

// sourcery:inline:ScorePart.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.id) {
        _ = try container.decodeNil(forKey: .id)
        self = .id
    } else if container.contains(.identification) {
        _ = try container.decodeNil(forKey: .identification)
        self = .identification
    } else if container.contains(.name) {
        _ = try container.decodeNil(forKey: .name)
        self = .name
    } else if container.contains(.nameDisplay) {
        _ = try container.decodeNil(forKey: .nameDisplay)
        self = .nameDisplay
    } else if container.contains(.partAbbreviation) {
        _ = try container.decodeNil(forKey: .partAbbreviation)
        self = .partAbbreviation
    } else if container.contains(.partAbbreviationDisplay) {
        _ = try container.decodeNil(forKey: .partAbbreviationDisplay)
        self = .partAbbreviationDisplay
    } else if container.contains(.group) {
        _ = try container.decodeNil(forKey: .group)
        self = .group
    } else if container.contains(.scoreInstrument) {
        _ = try container.decodeNil(forKey: .scoreInstrument)
        self = .scoreInstrument
    } else if container.contains(.midiDevice) {
        _ = try container.decodeNil(forKey: .midiDevice)
        self = .midiDevice
    } else if container.contains(.midiInstrument) {
        _ = try container.decodeNil(forKey: .midiInstrument)
        self = .midiInstrument
    } else {
        throw DecodingError.typeMismatch(
            ScorePart.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Slash.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .type:
        try container.encodeNil(forKey: .type)
    case .useDots:
        try container.encodeNil(forKey: .useDots)
    case .useStems:
        try container.encodeNil(forKey: .useStems)
    case .slashType:
        try container.encodeNil(forKey: .slashType)
    case .slashDot:
        try container.encodeNil(forKey: .slashDot)
    }
}
// sourcery:end

// sourcery:inline:Slash.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.type) {
        _ = try container.decodeNil(forKey: .type)
        self = .type
    } else if container.contains(.useDots) {
        _ = try container.decodeNil(forKey: .useDots)
        self = .useDots
    } else if container.contains(.useStems) {
        _ = try container.decodeNil(forKey: .useStems)
        self = .useStems
    } else if container.contains(.slashType) {
        _ = try container.decodeNil(forKey: .slashType)
        self = .slashType
    } else if container.contains(.slashDot) {
        _ = try container.decodeNil(forKey: .slashDot)
        self = .slashDot
    } else {
        throw DecodingError.typeMismatch(
            Slash.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Slide.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .type:
        try container.encodeNil(forKey: .type)
    case .number:
        try container.encodeNil(forKey: .number)
    case .lineType:
        try container.encodeNil(forKey: .lineType)
    }
}
// sourcery:end

// sourcery:inline:Slide.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.type) {
        _ = try container.decodeNil(forKey: .type)
        self = .type
    } else if container.contains(.number) {
        _ = try container.decodeNil(forKey: .number)
        self = .number
    } else if container.contains(.lineType) {
        _ = try container.decodeNil(forKey: .lineType)
        self = .lineType
    } else {
        throw DecodingError.typeMismatch(
            Slide.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Stem.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    case .color:
        try container.encodeNil(forKey: .color)
    }
}
// sourcery:end

// sourcery:inline:Stem.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else if container.contains(.color) {
        _ = try container.decodeNil(forKey: .color)
        self = .color
    } else {
        throw DecodingError.typeMismatch(
            Stem.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:StyleText.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .value:
        try container.encodeNil(forKey: .value)
    }
}
// sourcery:end

// sourcery:inline:StyleText.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.value) {
        _ = try container.decodeNil(forKey: .value)
        self = .value
    } else {
        throw DecodingError.typeMismatch(
            StyleText.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Technique.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .arrow(value):
        try container.encode(value, forKey: .arrow)
    case let .bend(value):
        try container.encode(value, forKey: .bend)
    case let .doubleTongue(value):
        try container.encode(value, forKey: .doubleTongue)
    case let .downBow(value):
        try container.encode(value, forKey: .downBow)
    case let .fingering(value):
        try container.encode(value, forKey: .fingering)
    case let .fingernails(value):
        try container.encode(value, forKey: .fingernails)
    case let .fret(value):
        try container.encode(value, forKey: .fret)
    case let .hammerOn(value):
        try container.encode(value, forKey: .hammerOn)
    case let .handbell(value):
        try container.encode(value, forKey: .handbell)
    case let .harmonic(value):
        try container.encode(value, forKey: .harmonic)
    case let .heel(value):
        try container.encode(value, forKey: .heel)
    case let .openString(value):
        try container.encode(value, forKey: .openString)
    case let .otherTechnical(value):
        try container.encode(value, forKey: .otherTechnical)
    case let .pluck(value):
        try container.encode(value, forKey: .pluck)
    case let .pullOff(value):
        try container.encode(value, forKey: .pullOff)
    case let .snapPizzicato(value):
        try container.encode(value, forKey: .snapPizzicato)
    case let .stopped(value):
        try container.encode(value, forKey: .stopped)
    case let .string(value):
        try container.encode(value, forKey: .string)
    case let .tap(value):
        try container.encode(value, forKey: .tap)
    case let .thumbPosition(value):
        try container.encode(value, forKey: .thumbPosition)
    case let .toe(value):
        try container.encode(value, forKey: .toe)
    case let .tripleTongue(value):
        try container.encode(value, forKey: .tripleTongue)
    case let .upBow(value):
        try container.encode(value, forKey: .upBow)
    }
}
// sourcery:end

// sourcery:inline:Technique.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.arrow) {
        self = .arrow(try decode(.arrow))
    } else if container.contains(.bend) {
        self = .bend(try decode(.bend))
    } else if container.contains(.doubleTongue) {
        self = .doubleTongue(try decode(.doubleTongue))
    } else if container.contains(.downBow) {
        self = .downBow(try decode(.downBow))
    } else if container.contains(.fingering) {
        self = .fingering(try decode(.fingering))
    } else if container.contains(.fingernails) {
        self = .fingernails(try decode(.fingernails))
    } else if container.contains(.fret) {
        self = .fret(try decode(.fret))
    } else if container.contains(.hammerOn) {
        self = .hammerOn(try decode(.hammerOn))
    } else if container.contains(.handbell) {
        self = .handbell(try decode(.handbell))
    } else if container.contains(.harmonic) {
        self = .harmonic(try decode(.harmonic))
    } else if container.contains(.heel) {
        self = .heel(try decode(.heel))
    } else if container.contains(.openString) {
        self = .openString(try decode(.openString))
    } else if container.contains(.otherTechnical) {
        self = .otherTechnical(try decode(.otherTechnical))
    } else if container.contains(.pluck) {
        self = .pluck(try decode(.pluck))
    } else if container.contains(.pullOff) {
        self = .pullOff(try decode(.pullOff))
    } else if container.contains(.snapPizzicato) {
        self = .snapPizzicato(try decode(.snapPizzicato))
    } else if container.contains(.stopped) {
        self = .stopped(try decode(.stopped))
    } else if container.contains(.string) {
        self = .string(try decode(.string))
    } else if container.contains(.tap) {
        self = .tap(try decode(.tap))
    } else if container.contains(.thumbPosition) {
        self = .thumbPosition(try decode(.thumbPosition))
    } else if container.contains(.toe) {
        self = .toe(try decode(.toe))
    } else if container.contains(.tripleTongue) {
        self = .tripleTongue(try decode(.tripleTongue))
    } else if container.contains(.upBow) {
        self = .upBow(try decode(.upBow))
    } else {
        throw DecodingError.typeMismatch(
            Technique.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
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
    case .stopped:
        try container.encodeNil(forKey: .stopped)
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
    } else if container.contains(.stopped) {
        _ = try container.decodeNil(forKey: .stopped)
        self = .stopped
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
// sourcery:inline:Tie.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .type:
        try container.encodeNil(forKey: .type)
    case .timeOnly:
        try container.encodeNil(forKey: .timeOnly)
    }
}
// sourcery:end

// sourcery:inline:Tie.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.type) {
        _ = try container.decodeNil(forKey: .type)
        self = .type
    } else if container.contains(.timeOnly) {
        _ = try container.decodeNil(forKey: .timeOnly)
        self = .timeOnly
    } else {
        throw DecodingError.typeMismatch(
            Tie.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Tied.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .type:
        try container.encodeNil(forKey: .type)
    case .number:
        try container.encodeNil(forKey: .number)
    case .lineType:
        try container.encodeNil(forKey: .lineType)
    case .dashedFormatting:
        try container.encodeNil(forKey: .dashedFormatting)
    case .position:
        try container.encodeNil(forKey: .position)
    case .placement:
        try container.encodeNil(forKey: .placement)
    case .orientation:
        try container.encodeNil(forKey: .orientation)
    case .bezier:
        try container.encodeNil(forKey: .bezier)
    case .color:
        try container.encodeNil(forKey: .color)
    }
}
// sourcery:end

// sourcery:inline:Tied.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.type) {
        _ = try container.decodeNil(forKey: .type)
        self = .type
    } else if container.contains(.number) {
        _ = try container.decodeNil(forKey: .number)
        self = .number
    } else if container.contains(.lineType) {
        _ = try container.decodeNil(forKey: .lineType)
        self = .lineType
    } else if container.contains(.dashedFormatting) {
        _ = try container.decodeNil(forKey: .dashedFormatting)
        self = .dashedFormatting
    } else if container.contains(.position) {
        _ = try container.decodeNil(forKey: .position)
        self = .position
    } else if container.contains(.placement) {
        _ = try container.decodeNil(forKey: .placement)
        self = .placement
    } else if container.contains(.orientation) {
        _ = try container.decodeNil(forKey: .orientation)
        self = .orientation
    } else if container.contains(.bezier) {
        _ = try container.decodeNil(forKey: .bezier)
        self = .bezier
    } else if container.contains(.color) {
        _ = try container.decodeNil(forKey: .color)
        self = .color
    } else {
        throw DecodingError.typeMismatch(
            Tied.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Time.Kind.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .measured(value):
        try container.encode(value, forKey: .measured)
    case let .unmeasured(value):
        try container.encode(value, forKey: .unmeasured)
    }
}
// sourcery:end

// sourcery:inline:Time.Kind.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.measured) {
        self = .measured(try decode(.measured))
    } else if container.contains(.unmeasured) {
        self = .unmeasured(try decode(.unmeasured))
    } else {
        throw DecodingError.typeMismatch(
            Time.Kind.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Time.Kind.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .measured:
        try container.encodeNil(forKey: .measured)
    case .unmeasured:
        try container.encodeNil(forKey: .unmeasured)
    }
}
// sourcery:end

// sourcery:inline:Time.Kind.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.measured) {
        _ = try container.decodeNil(forKey: .measured)
        self = .measured
    } else if container.contains(.unmeasured) {
        _ = try container.decodeNil(forKey: .unmeasured)
        self = .unmeasured
    } else {
        throw DecodingError.typeMismatch(
            Time.Kind.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Time.Measured.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .signature:
        try container.encodeNil(forKey: .signature)
    case .interchangeable:
        try container.encodeNil(forKey: .interchangeable)
    }
}
// sourcery:end

// sourcery:inline:Time.Measured.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.signature) {
        _ = try container.decodeNil(forKey: .signature)
        self = .signature
    } else if container.contains(.interchangeable) {
        _ = try container.decodeNil(forKey: .interchangeable)
        self = .interchangeable
    } else {
        throw DecodingError.typeMismatch(
            Time.Measured.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Time.Signature.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .beats:
        try container.encodeNil(forKey: .beats)
    case .beatType:
        try container.encodeNil(forKey: .beatType)
    }
}
// sourcery:end

// sourcery:inline:Time.Signature.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.beats) {
        _ = try container.decodeNil(forKey: .beats)
        self = .beats
    } else if container.contains(.beatType) {
        _ = try container.decodeNil(forKey: .beatType)
        self = .beatType
    } else {
        throw DecodingError.typeMismatch(
            Time.Signature.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Time.Unmeasured.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .symbol:
        try container.encodeNil(forKey: .symbol)
    }
}
// sourcery:end

// sourcery:inline:Time.Unmeasured.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.symbol) {
        _ = try container.decodeNil(forKey: .symbol)
        self = .symbol
    } else {
        throw DecodingError.typeMismatch(
            Time.Unmeasured.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:TimeModification.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .actualNotes:
        try container.encodeNil(forKey: .actualNotes)
    case .normalNotes:
        try container.encodeNil(forKey: .normalNotes)
    case .normalType:
        try container.encodeNil(forKey: .normalType)
    case .normalDot:
        try container.encodeNil(forKey: .normalDot)
    }
}
// sourcery:end

// sourcery:inline:TimeModification.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.actualNotes) {
        _ = try container.decodeNil(forKey: .actualNotes)
        self = .actualNotes
    } else if container.contains(.normalNotes) {
        _ = try container.decodeNil(forKey: .normalNotes)
        self = .normalNotes
    } else if container.contains(.normalType) {
        _ = try container.decodeNil(forKey: .normalType)
        self = .normalType
    } else if container.contains(.normalDot) {
        _ = try container.decodeNil(forKey: .normalDot)
        self = .normalDot
    } else {
        throw DecodingError.typeMismatch(
            TimeModification.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Timewise.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .measures:
        try container.encodeNil(forKey: .measures)
    }
}
// sourcery:end

// sourcery:inline:Timewise.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.measures) {
        _ = try container.decodeNil(forKey: .measures)
        self = .measures
    } else {
        throw DecodingError.typeMismatch(
            Timewise.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Timewise.Measure.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .parts:
        try container.encodeNil(forKey: .parts)
    case .number:
        try container.encodeNil(forKey: .number)
    case .text:
        try container.encodeNil(forKey: .text)
    case .implicit:
        try container.encodeNil(forKey: .implicit)
    case .nonControlling:
        try container.encodeNil(forKey: .nonControlling)
    case .width:
        try container.encodeNil(forKey: .width)
    case .optionalUniqueID:
        try container.encodeNil(forKey: .optionalUniqueID)
    }
}
// sourcery:end

// sourcery:inline:Timewise.Measure.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.parts) {
        _ = try container.decodeNil(forKey: .parts)
        self = .parts
    } else if container.contains(.number) {
        _ = try container.decodeNil(forKey: .number)
        self = .number
    } else if container.contains(.text) {
        _ = try container.decodeNil(forKey: .text)
        self = .text
    } else if container.contains(.implicit) {
        _ = try container.decodeNil(forKey: .implicit)
        self = .implicit
    } else if container.contains(.nonControlling) {
        _ = try container.decodeNil(forKey: .nonControlling)
        self = .nonControlling
    } else if container.contains(.width) {
        _ = try container.decodeNil(forKey: .width)
        self = .width
    } else if container.contains(.optionalUniqueID) {
        _ = try container.decodeNil(forKey: .optionalUniqueID)
        self = .optionalUniqueID
    } else {
        throw DecodingError.typeMismatch(
            Timewise.Measure.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Timewise.Part.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .id:
        try container.encodeNil(forKey: .id)
    }
}
// sourcery:end

// sourcery:inline:Timewise.Part.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.id) {
        _ = try container.decodeNil(forKey: .id)
        self = .id
    } else {
        throw DecodingError.typeMismatch(
            Timewise.Part.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Traversal.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .partwise(value):
        try container.encode(value, forKey: .partwise)
    case let .timewise(value):
        try container.encode(value, forKey: .timewise)
    }
}
// sourcery:end

// sourcery:inline:Traversal.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.partwise) {
        self = .partwise(try decode(.partwise))
    } else if container.contains(.timewise) {
        self = .timewise(try decode(.timewise))
    } else {
        throw DecodingError.typeMismatch(
            Traversal.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Traversal.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .partwise:
        try container.encodeNil(forKey: .partwise)
    case .timewise:
        try container.encodeNil(forKey: .timewise)
    }
}
// sourcery:end

// sourcery:inline:Traversal.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.partwise) {
        _ = try container.decodeNil(forKey: .partwise)
        self = .partwise
    } else if container.contains(.timewise) {
        _ = try container.decodeNil(forKey: .timewise)
        self = .timewise
    } else {
        throw DecodingError.typeMismatch(
            Traversal.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Tremolo.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .marks:
        try container.encodeNil(forKey: .marks)
    case .type:
        try container.encodeNil(forKey: .type)
    case .printStyle:
        try container.encodeNil(forKey: .printStyle)
    case .placement:
        try container.encodeNil(forKey: .placement)
    }
}
// sourcery:end

// sourcery:inline:Tremolo.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.marks) {
        _ = try container.decodeNil(forKey: .marks)
        self = .marks
    } else if container.contains(.type) {
        _ = try container.decodeNil(forKey: .type)
        self = .type
    } else if container.contains(.printStyle) {
        _ = try container.decodeNil(forKey: .printStyle)
        self = .printStyle
    } else if container.contains(.placement) {
        _ = try container.decodeNil(forKey: .placement)
        self = .placement
    } else {
        throw DecodingError.typeMismatch(
            Tremolo.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:TrillSound.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .startNote:
        try container.encodeNil(forKey: .startNote)
    case .trillStep:
        try container.encodeNil(forKey: .trillStep)
    case .twoNoteTurn:
        try container.encodeNil(forKey: .twoNoteTurn)
    case .accelerate:
        try container.encodeNil(forKey: .accelerate)
    case .beats:
        try container.encodeNil(forKey: .beats)
    case .secondBeat:
        try container.encodeNil(forKey: .secondBeat)
    case .lastBeat:
        try container.encodeNil(forKey: .lastBeat)
    }
}
// sourcery:end

// sourcery:inline:TrillSound.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.startNote) {
        _ = try container.decodeNil(forKey: .startNote)
        self = .startNote
    } else if container.contains(.trillStep) {
        _ = try container.decodeNil(forKey: .trillStep)
        self = .trillStep
    } else if container.contains(.twoNoteTurn) {
        _ = try container.decodeNil(forKey: .twoNoteTurn)
        self = .twoNoteTurn
    } else if container.contains(.accelerate) {
        _ = try container.decodeNil(forKey: .accelerate)
        self = .accelerate
    } else if container.contains(.beats) {
        _ = try container.decodeNil(forKey: .beats)
        self = .beats
    } else if container.contains(.secondBeat) {
        _ = try container.decodeNil(forKey: .secondBeat)
        self = .secondBeat
    } else if container.contains(.lastBeat) {
        _ = try container.decodeNil(forKey: .lastBeat)
        self = .lastBeat
    } else {
        throw DecodingError.typeMismatch(
            TrillSound.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Tuplet.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .type:
        try container.encodeNil(forKey: .type)
    case .number:
        try container.encodeNil(forKey: .number)
    case .bracket:
        try container.encodeNil(forKey: .bracket)
    case .showNumber:
        try container.encodeNil(forKey: .showNumber)
    case .showType:
        try container.encodeNil(forKey: .showType)
    case .lineShape:
        try container.encodeNil(forKey: .lineShape)
    case .position:
        try container.encodeNil(forKey: .position)
    case .placement:
        try container.encodeNil(forKey: .placement)
    case .actualNotes:
        try container.encodeNil(forKey: .actualNotes)
    case .normalNotes:
        try container.encodeNil(forKey: .normalNotes)
    }
}
// sourcery:end

// sourcery:inline:Tuplet.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.type) {
        _ = try container.decodeNil(forKey: .type)
        self = .type
    } else if container.contains(.number) {
        _ = try container.decodeNil(forKey: .number)
        self = .number
    } else if container.contains(.bracket) {
        _ = try container.decodeNil(forKey: .bracket)
        self = .bracket
    } else if container.contains(.showNumber) {
        _ = try container.decodeNil(forKey: .showNumber)
        self = .showNumber
    } else if container.contains(.showType) {
        _ = try container.decodeNil(forKey: .showType)
        self = .showType
    } else if container.contains(.lineShape) {
        _ = try container.decodeNil(forKey: .lineShape)
        self = .lineShape
    } else if container.contains(.position) {
        _ = try container.decodeNil(forKey: .position)
        self = .position
    } else if container.contains(.placement) {
        _ = try container.decodeNil(forKey: .placement)
        self = .placement
    } else if container.contains(.actualNotes) {
        _ = try container.decodeNil(forKey: .actualNotes)
        self = .actualNotes
    } else if container.contains(.normalNotes) {
        _ = try container.decodeNil(forKey: .normalNotes)
        self = .normalNotes
    } else {
        throw DecodingError.typeMismatch(
            Tuplet.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Unpitched.CodingKeys.AutoXMLChoiceEncoding
private func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .displayStep:
        try container.encodeNil(forKey: .displayStep)
    case .displayOctave:
        try container.encodeNil(forKey: .displayOctave)
    }
}
// sourcery:end

// sourcery:inline:Unpitched.CodingKeys.AutoXMLChoiceDecoding
private init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.displayStep) {
        _ = try container.decodeNil(forKey: .displayStep)
        self = .displayStep
    } else if container.contains(.displayOctave) {
        _ = try container.decodeNil(forKey: .displayOctave)
        self = .displayOctave
    } else {
        throw DecodingError.typeMismatch(
            Unpitched.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
