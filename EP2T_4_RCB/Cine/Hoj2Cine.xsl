<?xml version='1.0' encoding="utf-8"?>
<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <HTML>
            <HEAD>
                <TITTLE>Hoj2Cine</TITTLE>
            </HEAD>
            <BODY style="margin: 30px">
                <CENTER><H1>Listado de Películas</H1></CENTER>
                    <xsl:apply-templates select="Cine/Películas/Película">
                        <xsl:sort select="Título"/>
                    </xsl:apply-templates>
            </BODY>
        </HTML>
    </xsl:template>

    <xsl:template match="Cine/Películas/Película">
        <xsl:if test="@Género = 'Drama'">
            <hr/>
            <h3>Datos de la película: <xsl:value-of select="Título"/></h3>
            <hr/>
            <h3 style="font-weight: normal"> Director: <xsl:value-of select="Director"/></h3>
            <h3 style="font-weight: normal"> Duración: <xsl:value-of select="Duración"/>
                <xsl:if test="Duración &lt; 90">
                    (Corto)
                </xsl:if>
                <xsl:if test="Duración &lt; 120 and Duración &gt; 90">
                    (Medio)
                </xsl:if>
                <xsl:if test="Duración &gt;= 120">
                    (Largo)
                </xsl:if>
            </h3>
            <h3 style="font-weight: normal"> Argumento: <xsl:value-of select="Argumento"/></h3>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>