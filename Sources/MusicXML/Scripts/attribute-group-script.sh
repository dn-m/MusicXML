groups="BendSound|\
Bezier|\
DashedFormatting|\
Font|\
PlacementPrintStyle|\
Position|\
Printout|\
PrintStyle|\
PrintStyleAlign|\
PrintStyleAlignObject|\
PrintStyleTrillSound|\
TextDecoration|\
TrillSound"
if [[ -z $(grep 'Attribute Groups' "$1") ]] ; then
    gsed -n -r "
/public let.*($groups).*/ {
    H
}
/public let.*($groups).*/ !{
    /Initializers/ {
        x
        i\
\ \ \ \ // MARK: Attribute Groups
        p;x
        i\

        p
}
    /Initializers/ !{
        p
    }
}" "$1"
fi
