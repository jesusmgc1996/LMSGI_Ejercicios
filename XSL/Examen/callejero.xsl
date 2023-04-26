<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>

  <xsl:template match="/callejero">
    <html>
      <head>
        <style>
          body {
          font-family: Arial;
          font-size: 11px;
          }
          th {
          background: #1e3356;
          color: #FFFFFF;
          }
          #tablaCallejero {
          color: #eff4fc;
          }
          #tablaCallejero td {
          width:50px;
          height:77.3px;
          }
        </style>
      </head>
      <body>
        <center>
          <h1>Ciudad: <xsl:value-of select="@ciudad"/> - Barrio: <xsl:value-of select="@barrio"/> - Provincia:
            <xsl:value-of select="@provincia"/> - Código postal: <xsl:value-of select="@cod_postal"/></h1>
          <table border="1">
            <tr>
              <th>Nombre</th>
              <th>Imagen</th>
              <th>Calle</th>
              <th>Calles anexas</th>
            </tr>
            <xsl:apply-templates select="monumentos"/>
          </table>
        </center>
        <p/>
        <center>
          <table border="1" width="43.2%" style="background: url('{/callejero/imagen}') no-repeat;" id="tablaCallejero">
            <xsl:call-template name="bucleForFila">
              <xsl:with-param name="i">1</xsl:with-param>
            </xsl:call-template>
          </table>
        </center>
        <p/>
        <center>
          <table border="1">
            <tr>
              <th>Nombre</th>
              <th>Dirección</th>
              <th>Imagen</th>
            </tr>
            <xsl:apply-templates select="patrocinadores"/>
          </table>
        </center>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="monumentos">
    <xsl:for-each select="monumento">
      <tr>
        <xsl:choose>
          <xsl:when test="position() = 1">
            <xsl:attribute name="style">background:#97befc;</xsl:attribute>
          </xsl:when>
          <xsl:when test="position() = 2">
            <xsl:attribute name="style">background:#affabe;</xsl:attribute>
          </xsl:when>
          <xsl:when test="position() = 3">
            <xsl:attribute name="style">background:#bef5f7;</xsl:attribute>
          </xsl:when>
        </xsl:choose>
        <td><xsl:value-of select="@nombre"/></td>
        <td>
          <xsl:call-template name="imagen">
            <xsl:with-param name="id"><xsl:value-of select="@imagen"/></xsl:with-param>
          </xsl:call-template>
        </td>
        <td><xsl:value-of select="@calle"/></td>
        <td>
          <xsl:call-template name="callesAnexas">
            <xsl:with-param name="calle"><xsl:value-of select="@calle"/></xsl:with-param>
          </xsl:call-template>
        </td>
      </tr>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template name="imagen">
    <xsl:param name="id"/>
    <img width="50px" src="{/callejero/Imagenes/imagen[@id=$id]}"/>
  </xsl:template>
  
  <xsl:template name="callesAnexas">
    <xsl:param name="calle"/>
    <xsl:for-each select="/callejero/callejero/calle">
      <xsl:if test="@nombre=$calle">
        <xsl:value-of select="@anexas"/>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template name="bucleForFila">
    <xsl:param name="i"/>
    <xsl:if test="$i &lt;= 6">
      <tr>
        <xsl:call-template name="bucleForColumna">
          <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
          <xsl:with-param name="j">1</xsl:with-param>
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
    <xsl:if test="$j &lt;= 6">
      <xsl:call-template name="celda">
        <xsl:with-param name="x"><xsl:value-of select="$i"/></xsl:with-param>
        <xsl:with-param name="y"><xsl:value-of select="$j"/></xsl:with-param>
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
      <xsl:for-each select="monumentos/monumento">
        <xsl:if test="coordX = $x and coordY = $y">
          <xsl:call-template name="imagen">
            <xsl:with-param name="id"><xsl:value-of select="@imagen"/></xsl:with-param>
          </xsl:call-template>
        </xsl:if>
      </xsl:for-each>
    </td>
  </xsl:template>
  
  <xsl:template match="patrocinadores">
    <xsl:for-each select="Patrocinador">
      <tr>
        <td><xsl:value-of select="@nombre"/></td>
        <td><xsl:value-of select="direccion"/></td>
        <td>
          <xsl:call-template name="imagen">
            <xsl:with-param name="id"><xsl:value-of select="imagen/@id"/></xsl:with-param>
          </xsl:call-template>
        </td>
      </tr>
    </xsl:for-each>
  </xsl:template>
  
</xsl:stylesheet>
