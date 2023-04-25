<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/navidad">
        <html>
            <head>
                <title>Comida de Navidad</title>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="almuerzo">
        <table border="1">
            <tr class="tituloTabla">
                <td colspan="2">Menú:</td>
            </tr>
            <tr>
                <td>Primer plato:</td>
                <td><xsl:value-of select="primerPlato"/></td>
            </tr>
            <tr>
                <td>Segundo plato:</td>
                <td><xsl:value-of select="segundoPlato"/></td>
            </tr>
            <tr>
                <td>Postre:</td>
                <td><xsl:value-of select="postre"/></td>
            </tr>
            <tr>
                <td>Bebida:</td>
                <td><xsl:value-of select="bebida"/></td>
            </tr>
            <tr>
                <td>Sobremesa:</td>
                <td><xsl:apply-templates select="sobremesa"/></td>
            </tr>
        </table>
    </xsl:template>
    
    <xsl:template match="sobremesa">
        <table border = "1">
            <tr>
                <td>Primera copa:</td>
                <td><xsl:value-of select="primeraCopa"/></td>
            </tr>
            <tr>
                <td>Segunda copa:</td>
                <td><xsl:value-of select="segundaCopa"/></td>
            </tr>
            <tr>
                <td>Tercera copa:</td>
                <td><xsl:value-of select="terceraCopa"/></td>
            </tr>
        </table>
    </xsl:template>
    
    <xsl:template name="css">
        <style type="text/css">
            body {
            margin: 50px;
            padding: 0px;
            background: #FFFFFF;
            font-family: 'Open Sans', sans-serif;
            font-size: 11pt;
            color: #000000;
            text-align:center;
            }
            
            .tituloTabla {
            font-weight: bold;   
            text-align: center;
            }
        </style>
    </xsl:template>
    
</xsl:stylesheet>