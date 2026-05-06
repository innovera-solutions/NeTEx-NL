<sch:pattern id="DRG.ServiceFrame.DestinationDisplayVariant" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <!-- A: Compleetheid - alle 4 lengtevarianten moeten aanwezig zijn (op DestinationDisplay niveau) -->
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:destinationDisplays/ntx:DestinationDisplay/ntx:variants">
        <sch:assert test="ntx:DestinationDisplayVariant[ntx:Extensions/ntx:MaxLength='BISON:DisplayTextLength:16']">DestinationDisplayVariant voor lengtevariant 'BISON:DisplayTextLength:16' is verplicht</sch:assert>
        <sch:assert test="ntx:DestinationDisplayVariant[ntx:Extensions/ntx:MaxLength='BISON:DisplayTextLength:19']">DestinationDisplayVariant voor lengtevariant 'BISON:DisplayTextLength:19' is verplicht</sch:assert>
        <sch:assert test="ntx:DestinationDisplayVariant[ntx:Extensions/ntx:MaxLength='BISON:DisplayTextLength:21']">DestinationDisplayVariant voor lengtevariant 'BISON:DisplayTextLength:21' is verplicht</sch:assert>
        <sch:assert test="ntx:DestinationDisplayVariant[ntx:Extensions/ntx:MaxLength='BISON:DisplayTextLength:24']">DestinationDisplayVariant voor lengtevariant 'BISON:DisplayTextLength:24' is verplicht</sch:assert>
    </sch:rule>

    <!-- B: Correctheid + Extensions.A - op variant niveau -->
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:destinationDisplays/ntx:DestinationDisplay/ntx:variants/ntx:DestinationDisplayVariant">
        <sch:let name="max-length" value="number(substring-after(ntx:Extensions/ntx:MaxLength, 'BISON:DisplayTextLength:'))"/>

        <!-- Cardinality -->
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>

        <!-- B: Lengte van tekst kleiner of gelijk aan opgegeven maximale lengte -->
        <sch:assert test="string-length(normalize-space(ntx:Name)) &lt;= $max-length">Tekst van Name is langer dan de opgegeven maximale lengte</sch:assert>

        <!-- Extensions.A: MaxLength moet een BISON-enumeratie referentie zijn -->
        <sch:assert test="ntx:Extensions/ntx:MaxLength[starts-with(., 'BISON:DisplayTextLength:')]">De MaxLength moet een verwijzing zijn naar een BISON-enumeratie (bijv. 'BISON:DisplayTextLength:16'), niet een getal</sch:assert>
    </sch:rule>
</sch:pattern>