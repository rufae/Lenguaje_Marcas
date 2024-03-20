<?xml version='1.0' encoding="utf-8"?>
<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <HTML>
            <HEAD>
                <TITTLE>Hoj1Cine</TITTLE>
            </HEAD>
            <BODY style="margin: 30px">
                <CENTER><H1>Listado de Películas</H1></CENTER>
                <TABLE border="1">
                    <xsl:apply-templates select="Cine/Películas/Película">
                        <xsl:sort select="Título"/>
                    </xsl:apply-templates>
                </TABLE>
            </BODY>
        </HTML>
    </xsl:template>

    <xsl:template match="Cine/Películas/Película">
        <TR bgcolor="YELLOW" style="text-align: center">
            <TD>Título</TD>
            <TD>Director</TD>
            <TD>Duración</TD>
            <TD>Metraje</TD>
        </TR>
        <TR align="CENTER">
            <TD><xsl:value-of select="Título"/></TD>
            <TD><xsl:value-of select="Director"/></TD>
            <TD><xsl:value-of select="Duración"/></TD>
            <TD COLSPAN="4">
                <xsl:if test="Duración &lt; 90">
                Corto
                </xsl:if>
                <xsl:if test="Duración &lt; 120 and Duración &gt; 90">
                    Medio
                </xsl:if>
                <xsl:if test="Duración &gt;= 120">
                    Largo
                </xsl:if>
            </TD>
        </TR>
        <TR bgcolor="YELLOW" style="text-align: center">
            <TD COLSPAN="4">Argumento</TD>
        </TR>
        <TR bgcolor="CYAN" style="text-align: center">
            <TD COLSPAN="4"><xsl:apply-templates select="Argumento"/></TD>
        </TR>

    </xsl:template>
</xsl:stylesheet>