<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/periodico">
        <html>
            <head>
                <title><xsl:value-of select="@nombre"/></title>
                <style type="text/css">
                    body {
                    font-family: Arial;
                    font-size: 12px;
                    }
                    ul
                    {
                    margin-top: 10px;
                    margin-left: 0px;
                    }
                    #menu li
                    {
                    margin-left: 0px;
                    display: inline;
                    list-style-type: none;
                    padding: 10px 50px;
                    }
                    .noticia {
                    padding: 10px 5px;
                    float: left; 
                    width: 338px;
                    }
                    .noticia img {
                    width: 338px;
                    }
                    .noticiaDobleAncho {
                    padding: 10px 5px;
                    float: left; 
                    width: 690px;
                    }
                    .noticiaDobleAncho img {
                    width: 690px;
                    }
                    .fechaNoticia {
                    color: #A3A34B;
                    }
                    .comentariosNoticia {
                    color: #A3A34B;
                    padding-left: 20px;
                    }
                    .divPublicidad {
                    padding: 10px 5px;
                    float: right; 
                    width: 280px;                    
                    }
                    .divPublicidad img {
                    width: 200px;
                    }
                </style>
            </head>
            <body>
                <div style="width: 1000px; margin: 0 auto;">
                    <div style="width: 1000px;">
                        <img src="{@logo}" width="997" height="115" />
                    </div>
                    <div id="menu" style="width: 1000px; margin: 0px; padding: 0px;">
                        <ul>
                            <xsl:for-each select="menu/enlace">
                                <li>
                                    <xsl:if test="position() mod 2 = 1">
                                        <xsl:attribute name="style">background: #DDE640;</xsl:attribute>
                                    </xsl:if>
                                    <xsl:if test="position() mod 2 = 0">
                                        <xsl:attribute name="style">background: #F27E2B;</xsl:attribute>
                                    </xsl:if>
                                    <a href="{@href}"><xsl:value-of select="."/></a>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                    <div style="width: 700px; float: left;">
                        <xsl:for-each select="noticias/noticia">
                            <div>
                                <xsl:if test="@dobleAncho = 's'">
                                    <xsl:attribute name="class">noticiaDobleAncho</xsl:attribute>
                                </xsl:if>
                                <xsl:if test="@dobleAncho = 'n'">
                                    <xsl:attribute name="class">noticia</xsl:attribute>
                                </xsl:if>
                                <h2><xsl:value-of select="titular"/></h2>
                                <h4><xsl:value-of select="subtitular"/></h4>
                                <img src="{@imagen}"/>
                                <br/>
                                <span class="fechaNoticia">Publicado el <xsl:value-of select="@fecha"/></span>
                                <span class="comentariosNoticia"><xsl:value-of select="@comentarios"/> comentarios</span>
                            </div>
                        </xsl:for-each>
                    </div>
                    <div style="width: 295px; float: right;">
                        <xsl:for-each select="publicidad/anuncio">
                            <xsl:sort select="@orden" order="ascending"/>
                            <div class="divPublicidad">
                                <img width="280px" src="{@imagen}"/>
                            </div>
                        </xsl:for-each>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>