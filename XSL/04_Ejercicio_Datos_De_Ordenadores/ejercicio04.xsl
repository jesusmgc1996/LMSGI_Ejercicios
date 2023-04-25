<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/ordenadores">
        <html>
            <head>
                <title>Ordenadores</title>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <table border="1">
                    <tr class="tituloTabla">
                        <td colspan="2">Ordenadores:</td>
                    </tr>
                    <xsl:apply-templates/>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="ordenador">
        <tr>
            <td>Procesador:</td>
            <td><xsl:apply-templates select="procesador"/></td>
        </tr>
        <tr>
            <td>RAM:</td>
            <td><xsl:apply-templates select="RAM"/></td>
        </tr>
        <tr>
            <td>ROM:</td>
            <td><xsl:apply-templates select="ROM"/></td>
        </tr>
        <tr>
            <td>HDD:</td>
            <td><xsl:apply-templates select="HDD"/></td>
        </tr>
        <tr>
            <td>Transporte:</td>
            <td><xsl:apply-templates select="transporte"/></td>
        </tr>
    </xsl:template>
    
    <xsl:template match="procesador">
        <table border="1">
            <tr>
                <td>Modelo:</td>
                <td><xsl:value-of select="."/></td>
            </tr>
            <tr>
                <td>Generación:</td>
                <td><xsl:value-of select="@generacion"/></td>
            </tr>
        </table>
    </xsl:template>
    
    <xsl:template match="RAM">
        <table border="1">
            <tr>
                <td>Tipo:</td>
                <td><xsl:value-of select="tipo"/></td>
            </tr>
            <tr>
                <td>Capacidad:</td>
                <td><xsl:value-of select="capacidad"/></td>
            </tr>
        </table>
    </xsl:template>
    
    <xsl:template match="ROM">
        <table border="1">
            <tr>
                <td>Tipo:</td>
                <td><xsl:value-of select="tipo"/></td>
            </tr>
            <tr>
                <td>Capacidad:</td>
                <td><xsl:value-of select="capacidad"/></td>
            </tr>
        </table>
    </xsl:template>
    
    <xsl:template match="HDD">
        <table border="1">
            <tr>
                <td>Tipo:</td>
                <td><xsl:value-of select="tipo"/></td>
            </tr>
            <tr>
                <td>Capacidad:</td>
                <td><xsl:value-of select="capacidad"/></td>
            </tr>
        </table>
    </xsl:template>
    
    <xsl:template match="transporte">
        <table border="1">
            <tr>
                <td>Localidad:</td>
                <td><xsl:value-of select="localidad"/></td>
            </tr>
            <tr>
                <td>Fecha de salida:</td>
                <td><xsl:value-of select="localidad/@fechaSalida"/></td>
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