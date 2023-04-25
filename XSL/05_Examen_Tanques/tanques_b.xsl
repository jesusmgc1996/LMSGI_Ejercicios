<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/juegoTanques">
        <html>
            <head>
                <title>Tanques</title>
            </head>
            <body>
                <xsl:for-each select="jugadasGraficas/jugadaGrafica">
                    <table border="1">
                        <xsl:call-template name="bucleForFila">
                            <xsl:with-param name="i">0</xsl:with-param>
                        </xsl:call-template>
                        <br></br>
                    </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 8">
            <tr>
                <xsl:call-template name="bucleForColumna">
                    <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                    <xsl:with-param name="j">0</xsl:with-param>
                </xsl:call-template>
            </tr>
            <xsl:call-template name="bucleForFila">
                <xsl:with-param name="i"><xsl:value-of select="$i + 1"/></xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="bucleForColumna">
        <xsl:param name="i"/>
        <xsl:param name="j"/>
        <xsl:if test="$j &lt;= 8">
            <xsl:call-template name="celda">
                <xsl:with-param name="x"><xsl:value-of select="$j"/></xsl:with-param>
                <xsl:with-param name="y"><xsl:value-of select="$i"/></xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="bucleForColumna">
                <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                <xsl:with-param name="j"><xsl:value-of select="$j + 1"/></xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="celda">
        <xsl:param name="x"/>
        <xsl:param name="y"/>
        <td width="50px" height="50px">
            <xsl:for-each select="posicion">
                <xsl:if test="@x = $x and @y = $y and @tipo = 'pared'">
                    <xsl:attribute name="style">background: #000000;</xsl:attribute>
                </xsl:if>
                <xsl:if test="@x = $x and @y = $y and @tipo = 'tanque'">
                    <xsl:attribute name="style">background: #FF0000;</xsl:attribute>
                </xsl:if>
            </xsl:for-each>
            <xsl:if test="$x = 0 and $y != 0">
                <xsl:attribute name="style">background: #0000FF; text-align: center; color: #FFFFFF;</xsl:attribute>
                <xsl:value-of select="$y"/>
            </xsl:if>
            <xsl:if test="$y = 0 and $x != 0">
                <xsl:attribute name="style">background: #0000FF; text-align: center; color: #FFFFFF;</xsl:attribute>
                <xsl:value-of select="$x"/>
            </xsl:if>
            <xsl:if test="$x = 0 and $y = 0">
                <xsl:attribute name="style">background: #0000FF;</xsl:attribute>
            </xsl:if>
        </td>
    </xsl:template>
    
</xsl:stylesheet>