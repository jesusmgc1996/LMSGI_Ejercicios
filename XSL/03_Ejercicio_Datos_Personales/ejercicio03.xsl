<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/alumno">
        <html>
            <head>
                <title>Alumnos</title>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <table border="1">
                    <tr>
                        <td>DNI:</td>
                        <td><xsl:value-of select="@dni"/></td>
                    </tr>
                    <tr>
                        <td>Nombre:</td>
                        <td><xsl:value-of select="nombre"/></td>
                    </tr>
                    <tr>
                        <td>Dirección:</td>
                        <td><xsl:apply-templates select="direccion"/></td>
                    </tr>
                    <tr>
                        <td>Teléfono:</td>
                        <td><xsl:apply-templates select="telefono"/></td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="direccion">
        <table border="1">
            <tr>
                <td>Calle:</td>
                <td><xsl:value-of select="calle"/></td>
            </tr>
            <tr>
                <td>Número:</td>
                <td><xsl:value-of select="numero"/></td>
            </tr>
            <tr>
                <td>Ciudad:</td>
                <td><xsl:value-of select="ciudad"/></td>
            </tr>
            <tr>
                <td>Provincia:</td>
                <td><xsl:value-of select="provincia"/></td>
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