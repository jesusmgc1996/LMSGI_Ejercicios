<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/juegoTanques">
        <html>
            <head>
                <title>Tanques</title>
                <style type="text/css">
                    th {
                    color: white;
                    background: blue;
                    }
                </style>
            </head>
            <body>
                <xsl:apply-templates select="jugadasDescritas"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="jugadasDescritas">
        <table border="1" align="center" width="75%">
            <tr>
                <th>Jugada</th>
                <th colspan="2">Tanque</th>
                <th>Descripción</th>
            </tr>
            <xsl:for-each select="jugada">
                <tr>
                    <xsl:if test="position() mod 2 = 1">
                        <xsl:attribute name="style">background: #b1d5f0;</xsl:attribute>
                    </xsl:if>
                    <td><xsl:value-of select="position()"/></td>
                    <td><xsl:value-of select="@jugador"/></td>
                    <td align="center">
                        <xsl:call-template name="imagen">
                            <xsl:with-param name="jugador"><xsl:value-of select="@jugador"/></xsl:with-param>
                        </xsl:call-template>
                    </td>
                    <td><xsl:value-of select="@desc"/></td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
    
    <xsl:template name="imagen">
        <xsl:param name="jugador"/>
        <xsl:for-each select="/juegoTanques/tanques/imagenTanque">
            <xsl:if test="$jugador = @jugador">
                <img src="{.}" width="50px"/>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>