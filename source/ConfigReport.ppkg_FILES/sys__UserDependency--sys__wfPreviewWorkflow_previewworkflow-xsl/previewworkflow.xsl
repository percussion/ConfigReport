<?xml version='1.0' encoding='UTF-8'?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY % HTMLlat1 SYSTEM "/Rhythmyx/DTD/HTMLlat1x.ent">
		%HTMLlat1;
	<!ENTITY % HTMLsymbol SYSTEM "/Rhythmyx/DTD/HTMLsymbolx.ent">
		%HTMLsymbol;
	<!ENTITY % HTMLspecial SYSTEM "/Rhythmyx/DTD/HTMLspecialx.ent">
		%HTMLspecial;
]>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="psxi18n" xmlns:psxi18n="urn:www.percussion.com/i18n" >
  <xsl:variable name="this" select="/"/>
<xsl:output method="xml"/>

  <xsl:template match="/">
    <html>
      <head>
        <meta name="generator" content="Percussion XSpLit Version 3.0"/>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
        <title>Rhythmyx Workflow Editor - Preview Workflow</title>
         <script>function load_main(whereto){window.opener.location=whereto}</script>
      </head>
<style>
div
{
    COLOR: #008000;
    FONT-FAMILY: 'sans-serif';
    FONT-SIZE: 10pt;
    FONT-WEIGHT: bold;
    POSITION:absolute;
    Z-INDEX: 1
}

a.workflow
{
    COLOR: #000000;
}

a.state
{
    COLOR: #CC0000;
}

a.transition
{
    COLOR: #CC0000;
}

span
{
    COLOR: #ff0000;
    FONT-FAMILY: 'sans-serif';
    FONT-SIZE: 10pt;
    FONT-WEIGHT: bold;
    Z-INDEX: 1
}
</style>

      <body bgcolor="#ffffff" onLoad="javascript:self.focus();">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
          		<xsl:apply-templates select="previewworkflow/workflow" mode="mode0"/>
						</td>
					</tr><tr><td>&nbsp;</td></tr></table>

      </body>

    </html>

  </xsl:template>

  <xsl:template match="*">
    <xsl:choose>
      <xsl:when test="text()">
        <xsl:choose>
          <xsl:when test="@no-escaping">
            <xsl:value-of select="." disable-output-escaping="yes"/>
          </xsl:when>

          <xsl:otherwise>
            <xsl:value-of select="."/>
          </xsl:otherwise>

        </xsl:choose>

      </xsl:when>

      <xsl:otherwise>&nbsp;</xsl:otherwise>

    </xsl:choose>

    <xsl:if test="not(position()=last())">
      <br id="XSpLit"/>
    </xsl:if>

  </xsl:template>

  <xsl:template match="attribute::*">
    <xsl:value-of select="."/>
    <xsl:if test="not(position()=last())">
      <br id="XSpLit"/>
    </xsl:if>

  </xsl:template>

  <xsl:template match="previewworkflow/workflow" mode="mode0">
<xsl:apply-templates select="transitions" mode="div"/>
    <xsl:for-each select="transitions">
      <table border="0" cellpadding="0" cellspacing="0" width="800">
<xsl:apply-templates select="." mode="mode10"/>
      </table>
    </xsl:for-each>
    <xsl:for-each select="states">
      <table border="0" cellpadding="0" cellspacing="0" width="800">
<xsl:apply-templates select="." mode="mode11"/>
      </table>
    </xsl:for-each>
      <table border="0" cellpadding="0" cellspacing="0" width="800">
<tr>
<th align="center">&nbsp;&nbsp;&nbsp;</th>
</tr>
<tr>
<th align="center"><font color="#000000">STATE DIAGRAM</font></th>
</tr>
<tr>
<th align="center"><font size="2" color="gray"><a class="workflow"><xsl:attribute name="href"><xsl:text>javascript:window.opener.location='</xsl:text><xsl:value-of select="@link"/><xsl:text>'; self.close();</xsl:text></xsl:attribute>Workflow name :&nbsp;<xsl:value-of select="@name"/><br id="XSpLit"/>Workflow ID:&nbsp;<xsl:value-of select="@id"/></a></font></th>
</tr>
<tr>
<th align="center"><a><xsl:attribute name="href"><xsl:text>javascript:window.opener.location='</xsl:text><xsl:value-of select="@linknewstate"/><xsl:text>'; self.close();</xsl:text></xsl:attribute><img src="addst.gif" alt="Add new State" border="0"/></a></th>
</tr>
      </table>
  </xsl:template>

  <xsl:template match="transitions" mode="div">
    <xsl:for-each select="transition">
<div>
<xsl:attribute name="style">
<xsl:text>top:</xsl:text><xsl:value-of select="(position()-1)*40+10"/><xsl:text>;left:</xsl:text><xsl:value-of select="@xloc"/>
</xsl:attribute>
<a class="transition"><xsl:attribute name="href"><xsl:text>javascript:window.opener.location='</xsl:text><xsl:value-of select="@link"/><xsl:text>'; self.close();</xsl:text></xsl:attribute>
<xsl:value-of select="@label"/></a>
</div>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="transitions" mode="mode10">
    <xsl:for-each select="transition">
      <tr height="40">
<xsl:apply-templates select="draw" mode="mode20"/>
      </tr>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="draw" mode="mode20">
    <xsl:for-each select=".">
      <td>
					<xsl:attribute name="width"><xsl:value-of select="@width"/></xsl:attribute>
          <img height="40">
						<xsl:attribute name="width"><xsl:value-of select="@width"/></xsl:attribute>
						<xsl:attribute name="src"><xsl:value-of select="@image"/></xsl:attribute>
					</img>
      </td>
    </xsl:for-each>
  </xsl:template>


  <xsl:template match="states" mode="mode11">
      <tr height="40">
<xsl:apply-templates select="." mode="mode21"/>
      </tr>
  </xsl:template>


  <xsl:template match="*" mode="mode21">
    <xsl:for-each select="state">
      <th>
	 <xsl:attribute name="width"><xsl:value-of select="@width"/></xsl:attribute>
<span>
<a class="state"><xsl:attribute name="href"><xsl:text>javascript:window.opener.location='</xsl:text><xsl:value-of select="@link"/><xsl:text>'; self.close();</xsl:text></xsl:attribute><xsl:value-of select="@name"/></a>
<br id="XSpLit"/>
<a><xsl:attribute name="href"><xsl:text>javascript:window.opener.location='</xsl:text><xsl:value-of select="@linknewtransition"/><xsl:text>'; self.close();</xsl:text></xsl:attribute>
<img src="addtr.gif" border="0" alt="Add new Transition"/></a>
<a><xsl:attribute name="href"><xsl:text>javascript:window.opener.location='</xsl:text><xsl:value-of select="@linknewagingtransition"/><xsl:text>'; self.close();</xsl:text></xsl:attribute>
<img src="addagetr.gif" border="0" alt="Add new Aging Transition"/></a>
</span>
      </th>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
