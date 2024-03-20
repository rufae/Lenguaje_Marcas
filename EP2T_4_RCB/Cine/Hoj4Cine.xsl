<?xml version='1.0' encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <HTML>
            <HEAD>
                <TITLE>Hoj4Cine</TITLE>
            </HEAD>
            <BODY>
                <CENTER>
                    <H1>Listado de Películas</H1>
                </CENTER>
                <xsl:apply-templates select="Cine/Películas/Película">
                </xsl:apply-templates>
                <hr/>
            </BODY>
        </HTML>
    </xsl:template>

    <xsl:template match="Cine/Películas/Película">
        <xsl:if test="Intérprete = Director">
            <hr/>
            <br/>
            <h3>Datos de la película: <xsl:value-of select="Título"/></h3>
            <br/>
            <hr/>
            <br/>
            <h3 style="font-weight: normal"> Director: <xsl:value-of select="Director"/> (<xsl:value-of select="Director/@País"/>)</h3>
            <br/>
            <h3 style="font-weight: normal"> Intérprete: <xsl:value-of select="Intérprete"/></h3>
            <br/>
            <h3 style="font-weight: normal"> Argumento: <xsl:apply-templates select="Argumento"/> </h3>
            <br/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>