<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>

    <!-- ras: Chart Size Variables -->
    <xsl:variable name="Interval" select="60"/>
    <xsl:variable name="barWidth" select="45"/>
    <xsl:variable name="yAxisStart" select="0"/>
    <xsl:variable name="yAxisEnd" select="-300"/>
    <xsl:variable name="xAxisStart" select="30"/>
    <xsl:variable name="xAxisEnd" select="((12 + 1) * $Interval) - ($barWidth div 2)"/>
    <!-- ras: Legend Variables -->
    <xsl:variable name="xLegend" select="$xAxisEnd + 5"/>
    <xsl:variable name="yLegendStart" select="-300"/>
    <xsl:variable name="yLegendInterval" select="26"/>
    <xsl:variable name="legendFontSize" select="16"/>
    <xsl:variable name="legendBoxWidth" select="20"/>
    <xsl:variable name="xSpacing" select="30"/>
    <!-- ras: Variable for collection -->
    <xsl:variable name="nelsonColl" select="collection('../../Nelson_CSG/CSG_XML/XML_OnSite')"/>

    <!-- ras: Template Match for Document Output -->
    <xsl:template match="/">
        <svg width="975" height="500">
            <g transform="translate(10,400)">


                <!-- ras: Y-Axis -->
                <line x1="{$xAxisStart + $xSpacing}" y1="{$yAxisStart + 1}"
                    x2="{$xAxisStart + $xSpacing}" y2="{$yAxisEnd}" stroke="black" stroke-width="1"/>
                <!-- ras: X-Axis -->
                <line x1="{$xAxisStart + $xSpacing}" y1="{$yAxisStart + .5}"
                    x2="{$xAxisEnd + $xSpacing}" y2="{$yAxisStart + .5}" stroke="black"
                    stroke-width="1"/>
                <text x="{$xAxisStart}" y="{$yAxisStart + 50}">* indicates archetype speaks so little, in the series overall, that the percentage value appears as zero</text>

                <!-- ras: Axis Labels -->
                <text x="{$xAxisStart + $xSpacing - 40}" y="{($yAxisEnd + $yAxisStart) div 2}"
                    transform="rotate(-90 {$xAxisStart + $xSpacing - 40},{($yAxisEnd + $yAxisStart) div 2})"
                    style="text-anchor: middle" font-size="14">% of Total Dialogue (String Length of
                    &lt;said&gt;)</text>
                <text x="{(($xAxisStart + $xAxisEnd) div 2) + $xSpacing}" y="{$yAxisStart + 20}"
                    style="text-anchor: middle" font-size="14">Speaker (&lt;said
                    @who="*"&gt;)</text>
                <text x="{$xAxisStart - 30 + $xSpacing}" y="{($yAxisEnd + $yAxisStart) div 2}"
                    font-size="14"> 25% </text>
                <text x="{$xAxisStart - 30 + $xSpacing}" y="{($yAxisEnd + $yAxisStart)}"
                    font-size="14"> 50% </text>

                <!-- ras: Title -->
                <text x="{(($xAxisStart + $xAxisEnd) div 2) + $xSpacing}" y="{$yAxisEnd - 40}"
                    style="text-anchor: middle" font-size="18">Percent of Total Dialogue Spoken per
                    Archetype</text>
                <text x="{(($xAxisStart + $xAxisEnd) div 2) + $xSpacing}" y="{$yAxisEnd - 20}"
                    style="text-anchor: middle" font-size="18">Throughout Collection of Articles</text>



                <!-- ras: Legend -->

                <text x="{$xLegend + ($legendBoxWidth div 2) + $xSpacing + 15}" y="{$yLegendStart}"
                    font-size="20">Legend</text>
                <!-- ras:  Nelson  -->
                <line x1="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y1="{$yLegendStart + $yLegendInterval * 4}"
                    x2="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y2="{$yLegendStart + ($yLegendInterval * 4) - $legendFontSize}" stroke="#A3C9A8"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5 + $xSpacing}"
                    y="{$yLegendStart +$yLegendInterval * 4}" font-size="{$legendFontSize}">Nell
                    Nelson</text>
                <!-- ras: Working Girl  -->
                <line x1="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y1="{$yLegendStart + ($yLegendInterval * 1)}"
                    x2="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y2="{$yLegendStart + ($yLegendInterval * 1) - $legendFontSize}" stroke="pink"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5 + $xSpacing}"
                    y="{$yLegendStart + ($yLegendInterval * 1)}" font-size="{$legendFontSize}"
                    >Working Girl</text>
                <!-- ras: Foreperson -->
                <line x1="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y1="{$yLegendStart + ($yLegendInterval * 5)}"
                    x2="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y2="{$yLegendStart + ($yLegendInterval * 5) - $legendFontSize}" stroke="#725752"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5 + $xSpacing}"
                    y="{$yLegendStart + ($yLegendInterval * 5)}" font-size="{$legendFontSize}"
                    >Foreperson</text>
                <!-- ras: Employer -->
                <line x1="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y1="{$yLegendStart + ($yLegendInterval * 2)}"
                    x2="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y2="{$yLegendStart + ($yLegendInterval * 2) - $legendFontSize}" stroke="#F2DA00"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5 + $xSpacing}"
                    y="{$yLegendStart + ($yLegendInterval * 2)}" font-size="{$legendFontSize}"
                    >Employer</text>
                <!-- ras: Employee -->
                <line x1="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y1="{$yLegendStart + ($yLegendInterval * 6)}"
                    x2="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y2="{$yLegendStart + ($yLegendInterval * 6) - $legendFontSize}" stroke="#C695A6"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5 + $xSpacing}"
                    y="{$yLegendStart + ($yLegendInterval * 6)}" font-size="{$legendFontSize}"
                    >Employee</text>
                <!-- ras: Benefactor -->
                <line x1="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y1="{$yLegendStart + ($yLegendInterval * 8)}"
                    x2="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y2="{$yLegendStart + ($yLegendInterval * 8) - $legendFontSize}" stroke="#29335C"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5 + $xSpacing}"
                    y="{$yLegendStart + ($yLegendInterval * 8)}" font-size="{$legendFontSize}"
                    >Benefactor</text>
                <!-- ras: Messenger -->
                <line x1="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y1="{$yLegendStart + ($yLegendInterval * 9)}"
                    x2="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y2="{$yLegendStart + ($yLegendInterval * 9) - $legendFontSize}" stroke="#00A6ED"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5 + $xSpacing}"
                    y="{$yLegendStart + ($yLegendInterval * 9)}" font-size="{$legendFontSize}"
                    >Messenger</text>
                <!-- ras: Unidentified -->
                <line x1="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y1="{$yLegendStart + ($yLegendInterval * 10)}"
                    x2="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y2="{$yLegendStart + ($yLegendInterval * 10) - $legendFontSize}" stroke="orange"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5 + $xSpacing}"
                    y="{$yLegendStart + ($yLegendInterval * 10)}" font-size="{$legendFontSize}"
                    >Unidentified</text>
                <!-- ras: promMen -->
                <line x1="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y1="{$yLegendStart + ($yLegendInterval * 3)}"
                    x2="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y2="{$yLegendStart + ($yLegendInterval * 3) - $legendFontSize}" stroke="blue"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5 + $xSpacing}"
                    y="{$yLegendStart + ($yLegendInterval * 3)}" font-size="{$legendFontSize}"
                    >Prominent Men</text>
                <!-- ras: promWomen -->
                <line x1="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y1="{$yLegendStart + ($yLegendInterval * 11)}"
                    x2="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y2="{$yLegendStart + ($yLegendInterval * 11) - $legendFontSize}" stroke="red"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5 + $xSpacing}"
                    y="{$yLegendStart + ($yLegendInterval * 11)}" font-size="{$legendFontSize}"
                    >Prominent Women</text>
                <!-- ras: Reporter -->
                <line x1="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y1="{$yLegendStart + ($yLegendInterval * 7)}"
                    x2="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y2="{$yLegendStart + ($yLegendInterval * 7) - $legendFontSize}" stroke="green"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5 + $xSpacing}"
                    y="{$yLegendStart + ($yLegendInterval * 7)}" font-size="{$legendFontSize}"
                    >Reporter</text>
                <!-- ras: Inspector -->
                <line x1="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y1="{$yLegendStart + ($yLegendInterval * 12)}"
                    x2="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y2="{$yLegendStart + ($yLegendInterval * 12) - $legendFontSize}" stroke="#07F957"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5 + $xSpacing}"
                    y="{$yLegendStart + ($yLegendInterval * 12)}" font-size="{$legendFontSize}"
                    >Inspector</text>




                <!-- ras: Drawing Bar Graph -->
                <xsl:variable name="maxYValue" select="sum($nelsonColl//said/string-length())"/>
                <xsl:variable name="percentFontSize" select="12"/>
                <xsl:variable name="nellYMax"
                    select="(sum($nelsonColl//said[@who = '#nellNelson']/string-length())) div $maxYValue"/>
                <xsl:variable name="wgYMax"
                    select="(sum($nelsonColl//said[@who = '#workingGirl']/string-length())) div $maxYValue"/>
                <xsl:variable name="forepersonYMax"
                    select="(sum($nelsonColl//said[@who = '#foreperson']/string-length())) div $maxYValue"/>
                <xsl:variable name="employerYMax"
                    select="(sum($nelsonColl//said[@who = '#employer']/string-length())) div $maxYValue"/>
                <xsl:variable name="employeeYMax"
                    select="(sum($nelsonColl//said[@who = '#employee']/string-length())) div $maxYValue"/>
                <xsl:variable name="benefactorYMax"
                    select="(sum($nelsonColl//said[@who = '#benefactor']/string-length())) div $maxYValue"/>
                <xsl:variable name="messengerYMax"
                    select="(sum($nelsonColl//said[@who = '#messenger']/string-length())) div $maxYValue"/>
                <xsl:variable name="unidentifiedYMax"
                    select="(sum($nelsonColl//said[@who = '#unidentified']/string-length())) div $maxYValue"/>
                <xsl:variable name="promMenYMax"
                    select="(sum($nelsonColl//said[@who = '#promMen']/string-length())) div $maxYValue"/>
                <xsl:variable name="promWomenYMax"
                    select="(sum($nelsonColl//said[@who = '#promWomen']/string-length())) div $maxYValue"/>
                <xsl:variable name="reporterYMax"
                    select="(sum($nelsonColl//said[@who = '#reporter']/string-length())) div $maxYValue"/>
                <xsl:variable name="inspectorYMax"
                    select="(sum($nelsonColl//said[@who = '#inspector']/string-length())) div $maxYValue"/>
                <xsl:variable name="yAxis50" select="$yAxisEnd * 2"/>
                


                <line x1="{$Interval * 4 + $xSpacing}" x2="{$Interval * 4 + $xSpacing}"
                    y1="{$yAxisStart}" y2="{$nellYMax * $yAxis50}" stroke="#A3C9A8"
                    stroke-width="{$barWidth}"/>

                <line x1="{$Interval * 1 + $xSpacing}" x2="{$Interval * 1 + $xSpacing}"
                    y1="{$yAxisStart}" y2="{$wgYMax * $yAxis50}" stroke="pink"
                    stroke-width="{$barWidth}"/>

                <line x1="{$Interval * 5 + $xSpacing}" x2="{$Interval * 5 + $xSpacing}"
                    y1="{$yAxisStart}" y2="{$forepersonYMax * $yAxis50}" stroke="#725752"
                    stroke-width="{$barWidth}"/>

                <line x1="{$Interval * 2 + $xSpacing}" x2="{$Interval * 2 + $xSpacing}"
                    y1="{$yAxisStart}" y2="{$employerYMax * $yAxis50}" stroke="#F2DA00"
                    stroke-width="{$barWidth}"/>

                <line x1="{$Interval * 6 + $xSpacing}" x2="{$Interval * 6 + $xSpacing}"
                    y1="{$yAxisStart}" y2="{$employeeYMax * $yAxis50}" stroke="#C695A6"
                    stroke-width="{$barWidth}"/>

                <line x1="{$Interval * 8 + $xSpacing}" x2="{$Interval * 8 + $xSpacing}"
                    y1="{$yAxisStart}" y2="{$benefactorYMax * $yAxis50}" stroke="#29335C"
                    stroke-width="{$barWidth}"/>

                <line x1="{$Interval * 9 + $xSpacing}" x2="{$Interval * 9 + $xSpacing}"
                    y1="{$yAxisStart}" y2="{$messengerYMax * $yAxis50}" stroke="#00A6ED"
                    stroke-width="{$barWidth}"/>

                <line x1="{$Interval * 10 + $xSpacing}" x2="{$Interval * 10 + $xSpacing}"
                    y1="{$yAxisStart}" y2="{$unidentifiedYMax * $yAxis50}" stroke="orange"
                    stroke-width="{$barWidth}"/>

                <line x1="{$Interval * 3 + $xSpacing}" x2="{$Interval * 3 + $xSpacing}"
                    y1="{$yAxisStart}" y2="{$promMenYMax * $yAxis50}" stroke="blue"
                    stroke-width="{$barWidth}"/>

                <line x1="{$Interval * 11 + $xSpacing}" x2="{$Interval * 11 + $xSpacing}"
                    y1="{$yAxisStart}" y2="{$promWomenYMax * $yAxis50}" stroke="red"
                    stroke-width="{$barWidth}"/>

                <line x1="{$Interval * 7 + $xSpacing}" x2="{$Interval * 7 + $xSpacing}"
                    y1="{$yAxisStart}" y2="{$reporterYMax * $yAxis50}" stroke="green"
                    stroke-width="{$barWidth}"/>
                
                <line x1="{$Interval * 12 + $xSpacing}" x2="{$Interval * 12 + $xSpacing}"
                    y1="{$yAxisStart}" y2="{$inspectorYMax * $yAxis50}" stroke="#07F957"
                    stroke-width="{$barWidth}"/>





                <!-- ras: Dotted line at halfway -->
                <line x1="{$xAxisStart + $xSpacing}" y1="{($yAxisEnd + $yAxisStart) div 2}"
                    x2="{$xAxisEnd + $xSpacing}" y2="{($yAxisEnd + $yAxisStart) div 2}"
                    stroke="grey" stroke-width="2" stroke-dasharray="5, 5"/>


                <!-- ras: Percent labels on bars -->
                <text x="{$Interval * 4 + $xSpacing}" y="{$nellYMax * $yAxis50 - 10}"
                    font-size="{$percentFontSize}" fill="black" text-anchor="middle"
                        ><xsl:value-of select="format-number($nellYMax * 100, '##.#')"/>% </text>
                <text x="{$Interval * 1 + $xSpacing}" y="{$wgYMax * $yAxis50 - 10}"
                    font-size="{$percentFontSize}" fill="black" text-anchor="middle"><xsl:value-of
                        select="format-number($wgYMax * 100, '##.#')"/>% </text>
                <text x="{$Interval * 5 + $xSpacing}" y="{$forepersonYMax * $yAxis50 - 10}"
                    font-size="{$percentFontSize}" fill="black" text-anchor="middle"><xsl:value-of
                        select="format-number($forepersonYMax * 100, '##.#')"/>% </text>
                <text x="{$Interval * 2 + $xSpacing}" y="{$employerYMax * $yAxis50 - 10}"
                    font-size="{$percentFontSize}" fill="black" text-anchor="middle"><xsl:value-of
                        select="format-number($employerYMax * 100, '##.#')"/>% </text>
                <text x="{$Interval * 6 + $xSpacing}" y="{$employeeYMax * $yAxis50 - 10}"
                    font-size="{$percentFontSize}" fill="black" text-anchor="middle"><xsl:value-of
                        select="format-number($employeeYMax * 100, '##.#')"/>% </text>
                <text x="{$Interval * 8 + $xSpacing}" y="{$benefactorYMax * $yAxis50 - 10}"
                    font-size="{$percentFontSize}" fill="black" text-anchor="middle"><xsl:value-of
                        select="format-number($benefactorYMax * 100, '##.#')"/>% </text>
                <text x="{$Interval * 9 + $xSpacing}" y="{$messengerYMax * $yAxis50 - 10}"
                    font-size="{$percentFontSize}" fill="black" text-anchor="middle"><xsl:value-of
                        select="format-number($messengerYMax * 100, '##.##')"/>% </text>
                <text x="{$Interval * 10 + $xSpacing}" y="{$unidentifiedYMax * $yAxis50 - 10}"
                    font-size="{$percentFontSize}" fill="black" text-anchor="middle"><xsl:value-of
                        select="format-number($unidentifiedYMax * 100, '##.##')"/>% </text>
                <text x="{$Interval * 3 + $xSpacing}" y="{$promMenYMax * $yAxis50 - 10}"
                    font-size="{$percentFontSize}" fill="black" text-anchor="middle"><xsl:value-of
                        select="format-number($promMenYMax * 100, '##.#')"/>% </text>
                <text x="{$Interval * 11 + $xSpacing}" y="{$promWomenYMax * $yAxis50 - 10}"
                    font-size="{$percentFontSize}" fill="black" text-anchor="middle">* <xsl:value-of
                        select="format-number($promWomenYMax * 100, '##.##########')"/>% </text>
                <text x="{$Interval * 7 + $xSpacing}" y="{$reporterYMax * $yAxis50 - 10}"
                    font-size="{$percentFontSize}" fill="black" text-anchor="middle"><xsl:value-of
                        select="format-number($reporterYMax * 100, '##.#')"/>% </text>
                <text x="{$Interval * 12 + $xSpacing}" y="{$inspectorYMax * $yAxis50 - 10}"
                    font-size="{$percentFontSize}" fill="black" text-anchor="middle">* <xsl:value-of
                        select="format-number($inspectorYMax * 100, '##.##########')"/>% </text>
            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>
