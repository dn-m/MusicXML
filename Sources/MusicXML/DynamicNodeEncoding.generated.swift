// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// sourcery:inline:Accidental.DynamicNodeEncoding
extension Accidental: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.cautionary:
            return .attribute
        case CodingKeys.editorial:
            return .attribute
        case CodingKeys.parentheses:
            return .attribute
        case CodingKeys.bracket:
            return .attribute
        case CodingKeys.size:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:AccidentalMark.DynamicNodeEncoding
extension AccidentalMark: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.placement:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:AccidentalText.DynamicNodeEncoding
extension AccidentalText: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.justify:
            return .attribute
        case CodingKeys.hAlign:
            return .attribute
        case CodingKeys.vAlign:
            return .attribute
        case CodingKeys.underline:
            return .attribute
        case CodingKeys.overline:
            return .attribute
        case CodingKeys.lineThrough:
            return .attribute
        case CodingKeys.rotation:
            return .attribute
        case CodingKeys.letterSpacing:
            return .attribute
        case CodingKeys.lineHeight:
            return .attribute
        case CodingKeys.direction:
            return .attribute
        case CodingKeys.enclosure:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end









// sourcery:inline:BarStyleColor.DynamicNodeEncoding
extension BarStyleColor: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.color:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end




// sourcery:inline:BassAlter.DynamicNodeEncoding
extension BassAlter: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.printObject:
            return .attribute
        case CodingKeys.location:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:BassStep.DynamicNodeEncoding
extension BassStep: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.text:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:Beam.DynamicNodeEncoding
extension Beam: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end


// sourcery:inline:Beater.DynamicNodeEncoding
extension Beater: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.tip:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end






// sourcery:inline:BreathMark.DynamicNodeEncoding
extension BreathMark: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.placement:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end


// sourcery:inline:Clef.DynamicNodeEncoding
extension Clef: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.number:
            return .attribute
        case CodingKeys.additional:
            return .attribute
        case CodingKeys.size:
            return .attribute
        case CodingKeys.afterBarline:
            return .attribute
        case CodingKeys.printObject:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:Creator.DynamicNodeEncoding
extension Creator: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end


// sourcery:inline:Credit.Words.DynamicNodeEncoding
extension Credit.Words: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end





// sourcery:inline:DegreeAlter.DynamicNodeEncoding
extension DegreeAlter: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.plusMinus:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:DegreeType.DynamicNodeEncoding
extension DegreeType: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.text:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:DegreeValue.DynamicNodeEncoding
extension DegreeValue: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.symbol:
            return .attribute
        case CodingKeys.text:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end


// sourcery:inline:Distance.DynamicNodeEncoding
extension Distance: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.type:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end





// sourcery:inline:Ending.DynamicNodeEncoding
extension Ending: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.number:
            return .attribute
        case CodingKeys.type:
            return .attribute
        case CodingKeys.printObject:
            return .attribute
        case CodingKeys.endLength:
            return .attribute
        case CodingKeys.textX:
            return .attribute
        case CodingKeys.textY:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end


// sourcery:inline:Feature.DynamicNodeEncoding
extension Feature: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.type:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:Fermata.DynamicNodeEncoding
extension Fermata: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.type:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end



// sourcery:inline:Fingering.DynamicNodeEncoding
extension Fingering: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.substitution:
            return .attribute
        case CodingKeys.alternate:
            return .attribute
        case CodingKeys.placement:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:FirstFret.DynamicNodeEncoding
extension FirstFret: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.text:
            return .attribute
        case CodingKeys.location:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end


// sourcery:inline:FormattedText.DynamicNodeEncoding
extension FormattedText: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.justify:
            return .attribute
        case CodingKeys.hAlign:
            return .attribute
        case CodingKeys.vAlign:
            return .attribute
        case CodingKeys.underline:
            return .attribute
        case CodingKeys.overline:
            return .attribute
        case CodingKeys.lineThrough:
            return .attribute
        case CodingKeys.rotation:
            return .attribute
        case CodingKeys.letterSpacing:
            return .attribute
        case CodingKeys.lineHeight:
            return .attribute
        case CodingKeys.direction:
            return .attribute
        case CodingKeys.enclosure:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end




// sourcery:inline:Fret.DynamicNodeEncoding
extension Fret: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.color:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:Glissando.DynamicNodeEncoding
extension Glissando: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.type:
            return .attribute
        case CodingKeys.number:
            return .attribute
        case CodingKeys.lineType:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end


// sourcery:inline:GroupBarline.DynamicNodeEncoding
extension GroupBarline: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.color:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:GroupName.DynamicNodeEncoding
extension GroupName: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.justify:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:GroupSymbol.DynamicNodeEncoding
extension GroupSymbol: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.color:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end


// sourcery:inline:HammerOnPullOff.DynamicNodeEncoding
extension HammerOnPullOff: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.type:
            return .attribute
        case CodingKeys.number:
            return .attribute
        case CodingKeys.placement:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:Handbell.DynamicNodeEncoding
extension Handbell: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.placement:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end





// sourcery:inline:Header.DynamicNodeEncoding
extension Header: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end



// sourcery:inline:HoleClosed.DynamicNodeEncoding
extension HoleClosed: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.location:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end






// sourcery:inline:Inversion.DynamicNodeEncoding
extension Inversion: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end


// sourcery:inline:Key.AlteredTone.DynamicNodeEncoding
extension Key.AlteredTone: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end

// sourcery:inline:Key.Traditional.DynamicNodeEncoding
extension Key.Traditional: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end

// sourcery:inline:KeyOctave.DynamicNodeEncoding
extension KeyOctave: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.number:
            return .attribute
        case CodingKeys.cancel:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:Kind.DynamicNodeEncoding
extension Kind: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.useSymbols:
            return .attribute
        case CodingKeys.text:
            return .attribute
        case CodingKeys.stackDegrees:
            return .attribute
        case CodingKeys.parenthesesDegrees:
            return .attribute
        case CodingKeys.bracketDegrees:
            return .attribute
        case CodingKeys.hAlign:
            return .attribute
        case CodingKeys.vAlign:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end




// sourcery:inline:LineWidth.DynamicNodeEncoding
extension LineWidth: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.type:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end




// sourcery:inline:Lyric.Verbal.DynamicNodeEncoding
extension Lyric.Verbal: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end


// sourcery:inline:LyricLanguage.DynamicNodeEncoding
extension LyricLanguage: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.number:
            return .attribute
        case CodingKeys.name:
            return .attribute
        case CodingKeys.language:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:MIDIDevice.DynamicNodeEncoding
extension MIDIDevice: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.port:
            return .attribute
        case CodingKeys.id:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:MIDIInstrument.DynamicNodeEncoding
extension MIDIInstrument: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.id:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end



// sourcery:inline:MeasureNumbering.DynamicNodeEncoding
extension MeasureNumbering: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end




// sourcery:inline:Metronome.Complicated.DynamicNodeEncoding
extension Metronome.Complicated: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end

// sourcery:inline:Metronome.Regular.DynamicNodeEncoding
extension Metronome.Regular: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end

// sourcery:inline:MetronomeBeam.DynamicNodeEncoding
extension MetronomeBeam: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.number:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end


// sourcery:inline:MetronomeTuplet.DynamicNodeEncoding
extension MetronomeTuplet: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.type:
            return .attribute
        case CodingKeys.bracket:
            return .attribute
        case CodingKeys.showNumber:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end


// sourcery:inline:MiscellaneousField.DynamicNodeEncoding
extension MiscellaneousField: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.name:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:Mordent.DynamicNodeEncoding
extension Mordent: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.long:
            return .attribute
        case CodingKeys.approach:
            return .attribute
        case CodingKeys.departure:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:MultipleRest.DynamicNodeEncoding
extension MultipleRest: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.useSymbols:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:MusicXML.String.DynamicNodeEncoding
extension MusicXML.String: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.placement:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end





// sourcery:inline:Note.Cue.DynamicNodeEncoding
extension Note.Cue: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end

// sourcery:inline:Note.Grace.DynamicNodeEncoding
extension Note.Grace: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end

// sourcery:inline:Note.Normal.DynamicNodeEncoding
extension Note.Normal: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end

// sourcery:inline:NoteSize.DynamicNodeEncoding
extension NoteSize: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.type:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:NoteType.DynamicNodeEncoding
extension NoteType: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.size:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:Notehead.DynamicNodeEncoding
extension Notehead: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.filled:
            return .attribute
        case CodingKeys.parentheses:
            return .attribute
        case CodingKeys.color:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end



// sourcery:inline:Offset.DynamicNodeEncoding
extension Offset: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.sound:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end



// sourcery:inline:OtherAppearance.DynamicNodeEncoding
extension OtherAppearance: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.type:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:OtherDirection.DynamicNodeEncoding
extension OtherDirection: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.printObject:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end


// sourcery:inline:OtherNotation.DynamicNodeEncoding
extension OtherNotation: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.type:
            return .attribute
        case CodingKeys.number:
            return .attribute
        case CodingKeys.printObject:
            return .attribute
        case CodingKeys.placement:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:OtherPlay.DynamicNodeEncoding
extension OtherPlay: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.type:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end





// sourcery:inline:PartName.DynamicNodeEncoding
extension PartName: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.printObject:
            return .attribute
        case CodingKeys.justify:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:PartSymbol.DynamicNodeEncoding
extension PartSymbol: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.topStaff:
            return .attribute
        case CodingKeys.bottomStaff:
            return .attribute
        case CodingKeys.color:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end


// sourcery:inline:Partwise.Measure.DynamicNodeEncoding
extension Partwise.Measure: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.attributes:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:Partwise.Part.DynamicNodeEncoding
extension Partwise.Part: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.id:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end



// sourcery:inline:PerMinute.DynamicNodeEncoding
extension PerMinute: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end




// sourcery:inline:PlacementText.DynamicNodeEncoding
extension PlacementText: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.placement:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end



// sourcery:inline:PrincipleVoice.DynamicNodeEncoding
extension PrincipleVoice: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.type:
            return .attribute
        case CodingKeys.symbol:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end









// sourcery:inline:Rights.DynamicNodeEncoding
extension Rights: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.type:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end


// sourcery:inline:RootAlter.DynamicNodeEncoding
extension RootAlter: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.printObject:
            return .attribute
        case CodingKeys.location:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:RootStep.DynamicNodeEncoding
extension RootStep: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.text:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end





// sourcery:inline:ScoreInstrument.DynamicNodeEncoding
extension ScoreInstrument: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.id:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:ScorePart.DynamicNodeEncoding
extension ScorePart: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.id:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:ScorePart.MIDI.DynamicNodeEncoding
extension ScorePart.MIDI: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end


// sourcery:inline:Slash.Item.DynamicNodeEncoding
extension Slash.Item: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end

// sourcery:inline:Slide.DynamicNodeEncoding
extension Slide: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.type:
            return .attribute
        case CodingKeys.number:
            return .attribute
        case CodingKeys.lineType:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end



// sourcery:inline:Sound.MIDI.DynamicNodeEncoding
extension Sound.MIDI: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end




// sourcery:inline:Stem.DynamicNodeEncoding
extension Stem: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.color:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end




// sourcery:inline:StyleText.DynamicNodeEncoding
extension StyleText: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end







// sourcery:inline:TextElementData.DynamicNodeEncoding
extension TextElementData: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.color:
            return .attribute
        case CodingKeys.textRotation:
            return .attribute
        case CodingKeys.letterSpacing:
            return .attribute
        case CodingKeys.direction:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:TextFontColor.DynamicNodeEncoding
extension TextFontColor: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.color:
            return .attribute
        case CodingKeys.textRotation:
            return .attribute
        case CodingKeys.letterSpacing:
            return .attribute
        case CodingKeys.dir:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end




// sourcery:inline:Time.DynamicNodeEncoding
extension Time: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.number:
            return .attribute
        case CodingKeys.symbol:
            return .attribute
        case CodingKeys.separator:
            return .attribute
        case CodingKeys.hAlign:
            return .attribute
        case CodingKeys.vAlign:
            return .attribute
        case CodingKeys.printObject:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:Time.Measured.DynamicNodeEncoding
extension Time.Measured: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end

// sourcery:inline:Time.Signature.DynamicNodeEncoding
extension Time.Signature: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end

// sourcery:inline:Time.Unmeasured.DynamicNodeEncoding
extension Time.Unmeasured: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end



// sourcery:inline:Timewise.Measure.DynamicNodeEncoding
extension Timewise.Measure: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.attributes:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end

// sourcery:inline:Timewise.Part.DynamicNodeEncoding
extension Timewise.Part: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end






// sourcery:inline:TupletNumber.DynamicNodeEncoding
extension TupletNumber: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.color:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end


// sourcery:inline:TupletType.DynamicNodeEncoding
extension TupletType: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.color:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end






