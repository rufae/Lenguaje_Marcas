<?xml version='1.0' encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <HTML>
            <head>
                <tittle>Hoj3Cine</tittle>
            </head>

            <body style="font-family: Arial; font-size: 1rem; background-color: #EEEEEE;">
                <div class="manolo">
                    <center>
                        <H1>Listado de Películas</H1>
                    </center>
                    <xsl:apply-templates select="Cine/Películas/Película">
                        <xsl:sort select="Título" order="ascending"/>
                    </xsl:apply-templates>
                </div>
            </body>
        </HTML>
    </xsl:template>

    <xsl:template match="Cine/Películas/Película">
        <xsl:if test="Título[@Idioma= 'Francés']" >
            <div style="font-weight: normal; color: white; margin: 0px; padding: 4px; background-color: TEAL;">
                <h3>Datos de la película: <i><xsl:value-of select="Título"/></i></h3>
            </div>

            <h3 style="font-weight: normal"> <b>Director:</b> <xsl:value-of select="Director"/></h3>
            <h3 style="font-weight: normal"> <b>Duración:</b> <xsl:value-of select="Duración"/></h3>
            <hr/>
            <h3 style="font-weight: normal"> <b>Argumento:</b> <xsl:apply-templates select="Argumento"/> </h3>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>