<?xml version='1.0' encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <HTML>
            <HEAD>
                <TITLE>Hoj5Cine</TITLE>
            </HEAD>
            <BODY>
                <CENTER>
                    <H1>Listado de Películas</H1>
                </CENTER>

                <xsl:apply-templates select="Cine/Películas/Película[@Género= 'Comedia' and Título[@Idioma= 'Francés']]">
                </xsl:apply-templates>
            </BODY>
        </HTML>
    </xsl:template>

    <xsl:template match="Cine/Películas/Película[@Género= 'Comedia' and Título[@Idioma= 'Francés']]">

        <xsl:if test="Duración &gt; 120">

            <hr/>
            <h3 style="font-weight: normal;"><b>Datos de la película: </b><xsl:value-of select="Título"/></h3>
            <h3 style="font-weight: normal"> <b>Director: </b><xsl:value-of select="Director"/></h3>
            <hr/>
        </xsl:if>

    </xsl:template>
</xsl:stylesheet>