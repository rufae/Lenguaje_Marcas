<?xml version="1.0" encoding="utf-8"?>
<!-- fop -xml Cine.xml -xsl CineFO.xsl -pdf CineFO.pdf -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:template match="/Cine">
        <fo:root>

            <fo:layout-master-set>
                <fo:simple-page-master master-name="Cine" page-height="29.7cm" page-width="21.0cm" margin="2cm">

                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="Cine">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="24"
                              text-align="center">Listado de Películas
                    </fo:block>
                    <fo:table border="2px solid black" width="100%" text-align="center">

                        <fo:table-body>

                            <xsl:apply-templates
                                    select="/Cine/Películas/Película">

                                <xsl:sort select="Título"/>

                            </xsl:apply-templates>
                        </fo:table-body>

                    </fo:table>
                </fo:flow>
            </fo:page-sequence>

        </fo:root>

    </xsl:template>

    <xsl:template match="/Cine/Películas/Película">

        <fo:table-row background-color="yellow" text-align="center"
                      border="2px solid black">

            <fo:table-cell border="2px solid black">
                <fo:block>Título</fo:block>
            </fo:table-cell>

            <fo:table-cell border="2px solid black">
                <fo:block>Director</fo:block>
            </fo:table-cell>

            <fo:table-cell border="2px solid black">
                <fo:block>Duración</fo:block>
            </fo:table-cell>

            <fo:table-cell border="2px solid black">
                <fo:block>Metraje</fo:block>
            </fo:table-cell>

        </fo:table-row>

        <fo:table-row text-align="center" border="2px solid black">

            <fo:table-cell border="2px solid black">
                <fo:block><xsl:value-of select="Título"/></fo:block>
            </fo:table-cell>

            <fo:table-cell border="2px solid black">
                <fo:block><xsl:value-of select="Director"/></fo:block>
            </fo:table-cell>

            <fo:table-cell border="2px solid black">
                <fo:block><xsl:value-of select="Duración"/></fo:block>
            </fo:table-cell>

            <fo:table-cell border="2px solid black">

                <xsl:choose>
                    <xsl:when test="Duración &lt;90"><fo:block>Corto</fo:block></xsl:when>
                    <xsl:when test="Duración &gt; 90 and Duración &lt;120"><fo:block>Mediana</fo:block></xsl:when>
                    <xsl:when test="Duración &gt;120"><fo:block>Largo</fo:block></xsl:when>
                </xsl:choose>

                <fo:block> </fo:block>

            </fo:table-cell>

        </fo:table-row>

        <fo:table-row text-align="center" border="2px solid black">

            <fo:table-cell background-color="yellow" border="2px solid black" number-columns-spanned="4">

                <fo:block>
                    Argumento
                </fo:block>
                
            </fo:table-cell>

        </fo:table-row>

        <fo:table-row text-align="center" border="2px solid black">

            <fo:table-cell background-color="cyan" border="2px solid black" number-columns-spanned="4">
                <fo:block>
                    <xsl:value-of select="Argumento"/>
                </fo:block>
            </fo:table-cell>

        </fo:table-row>

    </xsl:template>
</xsl:stylesheet>