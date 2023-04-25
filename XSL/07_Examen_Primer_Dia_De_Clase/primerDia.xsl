<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/primerDia1DAW">
        <html>
            <head>
                <style type="text/css">
                    body {
                    font-family: Arial;
                    font-size: 12px;
                    }
                </style>
            </head>
            <body>
                <div style="width: 1000px; margin: 0 auto;">
                    <table border="1">
                        <tr>
                            <td></td>
                            <td>8:30-9:30</td>
                            <td>9:30-10:30</td>
                            <td>10:30-11:30</td>
                            <td>12:00-13:00</td>
                            <td>13:00-14:00</td>
                            <td>14:00-15:00</td>
                        </tr>
                        <xsl:for-each select="horario/dia">
                            <tr>
                                <td><xsl:value-of select="@desc"/></td>
                                <xsl:for-each select="hora">
                                    <xsl:sort select="@orden" order="ascending"/>
                                    <td>
                                        <xsl:if test="position() mod 2 = 1">
                                            <xsl:attribute name="style">background: #B2CFFF;</xsl:attribute>
                                        </xsl:if>
                                        <xsl:value-of select="."/>
                                    </td>
                                </xsl:for-each>
                            </tr>
                        </xsl:for-each>
                    </table>
                    <table border="1">
                        <xsl:call-template name="bucleForFila">
                            <xsl:with-param name="i">0</xsl:with-param>
                        </xsl:call-template>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 10">
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
        <xsl:if test="$j &lt;= 7">
            <xsl:call-template name="celda">
                <xsl:with-param name="x"><xsl:value-of select="$j + 1"/></xsl:with-param>
                <xsl:with-param name="y"><xsl:value-of select="$i + 1"/></xsl:with-param>
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
        <td>
            <xsl:for-each select="estructuraAula/bloque">
                <xsl:if test="@x = $x and @y = $y">
                    <xsl:attribute name="style"> 
                        <xsl:call-template name="color">
                            <xsl:with-param name="tipo"><xsl:value-of select="@tipo"/></xsl:with-param>
                        </xsl:call-template>
                    </xsl:attribute>
                    <xsl:value-of select="@tipo"/>
                </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="alumnado/alumno">
                <xsl:if test="@x = $x and @y = $y">
                    <xsl:attribute name="style">
                        <xsl:if test="@sexo = 'H'">
                            background: #baffc5;
                        </xsl:if>
                        <xsl:if test="@sexo = 'M'">
                            background: #fffbd3;
                        </xsl:if> 
                    </xsl:attribute>
                    <xsl:call-template name="alumno">
                        <xsl:with-param name="sexo"><xsl:value-of select="@sexo"/></xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="."/>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>
    
    <xsl:template name="color">
        <xsl:param name="tipo"/>
        <xsl:for-each select="/primerDia1DAW/estructuraAula/color">
            <xsl:if test="$tipo = @tipo">
                background: #<xsl:value-of select="."/>;
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="alumno">
        <xsl:param name="sexo"/>
        <xsl:for-each select="/primerDia1DAW/alumnado/imagen">
            <xsl:if test="$sexo = @sexo">
                <img src="{.}" width="30px"/>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>