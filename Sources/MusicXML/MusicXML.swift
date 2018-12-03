enum MusicXML {

    struct Score: Equatable {
        enum Traversal: Equatable {
            case timeWise(TimeWise)
            case partWise(PartWise)
        }
        let traverse: Traversal
        init(traverse: Traversal) {
            self.traverse = traverse
        }
    }

    struct ScorePart: Equatable {
        let id: String
        let name: String
        init(id: String, name: String) {
            self.id = id
            self.name = name
        }
    }

    struct Part: Equatable {
        let id: String
        let measures: [Measure]
        init(id: String, measures: [Measure]) {
            self.id = id
            self.measures = measures
        }
    }

    struct TimeWise: Equatable { }

    struct PartWise: Equatable {
        let partList: [ScorePart]
        let parts: [Part]

        init(partList: [ScorePart], parts: [Part]) {
            self.partList = partList
            self.parts = parts
        }
    }

    struct Key: Equatable {
        let fifths: Int
        init(fifths: Int) {
            self.fifths = fifths
        }
    }

    // FIXME: Use SpelledPitch
    struct Pitch: Equatable {
        let step: String
        let octave: Int
        // TODO: alter
        init(step: String, octave: Int) {
            self.step = step
            self.octave = octave
        }
    }

    struct Clef: Equatable {
        let sign: String
        let line: Int
        init(sign: String, line: Int) {
            self.sign = sign
            self.line = line
        }
    }

    // "<type>"
    enum DurationType: String {
        case whole
    }

    struct Note: Equatable {
        let pitch: Pitch
        let duration: Int // amount of "divisions"
        let type: DurationType
        init(pitch: Pitch, duration: Int, type: DurationType) {
            self.pitch = pitch
            self.duration = duration
            self.type = type
        }
    }

    struct Measure: Equatable {

        enum Attribute: Equatable {
            case divisions(Int)
            case key(Key)
            case time(Int,Int) // beats, subdivision
            case clef(Clef)
        }

        let number: Int
        let attributes: [Attribute]
        let notes: [Note]

        init(number: Int, attributes: [Attribute], notes: [Note]) {
            self.number = number
            self.attributes = attributes
            self.notes = notes
        }
    }

    /// - Returns: The "Hello, World" example from: https://www.musicxml.com/tutorial/hello-world/.
    static func helloWorld() -> Score {
        return Score(
            traverse: .partWise(
                PartWise(
                    partList: [
                        ScorePart(
                            id: "P1",
                            name: "Music"
                        )
                    ],
                    parts: [
                        Part(
                            id: "P1",
                            measures: [
                                Measure(
                                    number: 1,
                                    attributes: [
                                        .divisions(1),
                                        .key(Key(fifths: 0)),
                                        .time(4,4),
                                        .clef(Clef(sign: "G", line: 2)) // treble
                                    ],
                                    notes: [
                                        Note(
                                            pitch: Pitch(step: "C", octave: 4),
                                            duration: 4,
                                            type: .whole
                                        )
                                    ]
                                )
                            ]
                        )
                    ]
                )
            )
        )
    }
}
