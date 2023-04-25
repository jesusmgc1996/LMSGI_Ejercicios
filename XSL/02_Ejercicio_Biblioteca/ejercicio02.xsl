<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/biblioteca">
        <html>
            <head>
                <title>Biblioteca</title>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <table border="1">
                    <tr class="tituloTabla">
                        <td colspan="2">Libros:</td>
                    </tr>
                    <xsl:apply-templates>
                        <xsl:sort select="fechaPublicacion/@año" order="ascending"/>
                    </xsl:apply-templates>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="libro">
        <tr>
            <td>Título:</td>
            <td><xsl:value-of select="titulo"/></td>
        </tr>
        <tr>
            <td>Fecha de publicación:</td>
            <td><xsl:value-of select="fechaPublicacion/@año"/></td>
        </tr>
        <tr>
            <td>Autor:</td>
            <td><xsl:value-of select="autor"/></td>
        </tr>
        <tr>
            <td>Fecha de nacimiento:</td>
            <td><xsl:value-of select="autor/@fechaNacimiento"/></td>
        </tr>
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