<?xml version="1.0" encoding="UTF-8"?>
<!-- Copyright IBM Corp. 2014  All Rights Reserved.                    -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="no" omit-xml-declaration="yes" encoding="UTF-8" version="1.0" doctype-public="-//W3C//DTD XHTML 1.1//EN" doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" />
	<xsl:param name="internal" select="'false'" />
	<xsl:param name="language" select="'en-us'" />
	<xsl:param name="direction" select="'ltr'" />
	<xsl:param name="type" select="'lotuslive'" />
	<xsl:template match="/brandinfo">
		<html xml:lang="{$language}" lang="{$language}" dir="{$direction}" xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
				<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
				<title>
					<xsl:value-of select="pagetitle" />
				</title>
				<link rel="stylesheet" type="text/css" href="style.css" />
				<script type="text/javascript">
					<xsl:text disable-output-escaping="yes">/*&lt;![CDATA[*/</xsl:text>				
<![CDATA[
var isDirty = false;
var isHostEnabled = ]]><xsl:value-of select="can_host" /><![CDATA[;
var isJoinEnabled = ]]><xsl:value-of select="can_join" /><![CDATA[;
var hostNotEnabled = "]]><xsl:value-of select="host_not_enabled" /><![CDATA[";
var joinNotEnabled = "]]><xsl:value-of select="join_not_enabled" /><![CDATA[";
var enterConfID = "]]><xsl:value-of select="enter_conf_id_to_join" /><![CDATA[";
]]>
					<xsl:text disable-output-escaping="yes">/*]]&gt;[*/</xsl:text>
				</script>
				<script type="text/javascript" src="index.js">&#160;</script>
			</head>
			<body role="application" onload="init();">
				<div id="container">
					<table cellpadding="0" cellspacing="0" border="0" role="presentation" width="100%">
						<tbody>
							<tr>
								<td>
									<div id="header">
										<xsl:if test="$type != 'lotuslive'">
											<div id="logo">&#160;</div>
										</xsl:if>
									</div>
									<div id="content" role="main">
										<div class="form_group">
											<form id="join_form" action="" method="post" onsubmit="joinMeeting();return false;" aria-labelledby="join_form_label">
												<fieldset>
													<h1 id="join_form_label">
														<xsl:value-of select="join" />
													</h1>
													<table cellpadding="0" cellspacing="0" border="0" role="presentation">
														<tbody>
															<tr>
																<td nowrap="nowrap">
																	<input type="text" class="text" id="join_conference_id" name="join_conference_id" onfocus="inputFieldOnFocus();" onblur="inputFieldOnBlur();" onkeyup="inputOnKeyUp();" value="{enter_conf_id_to_join}">
																		<xsl:if test="can_join = 0">
																			<xsl:attribute name="class">
													<xsl:text>text-disabled</xsl:text>
												</xsl:attribute>
																			<xsl:attribute name="disabled">
														<xsl:text>true</xsl:text>
												</xsl:attribute>
																		</xsl:if>
																	</input>
																	<xsl:text>&#160;</xsl:text>
																	<span id="join_button" class="button-bg">
																		<xsl:if test="can_join = 0">
																			<xsl:attribute name="class">
													<xsl:text>button-bg-disabled</xsl:text>
												</xsl:attribute>
																			<xsl:attribute name="aria-disabled">
																				<xsl:text>true</xsl:text>
																			</xsl:attribute>
																		</xsl:if>
																		<img class="fadingblue" src="fadingblue.png" height="100%" width="100%" alt="" style="display: none;" aria-hidden="true" />
																		<img class="fadinggray" src="fadinggray.png" height="100%" width="100%" alt="" style="display: none;" aria-hidden="true" />
																		<button type="submit" name="join">
																			<xsl:if test="can_join = 0">
																				<xsl:attribute name="class">
														<xsl:text>disabled</xsl:text>
													</xsl:attribute>
																				<xsl:attribute name="disabled">
														<xsl:text>true</xsl:text>
												</xsl:attribute>
																			</xsl:if>
																			<xsl:value-of select="join_meeting" />
																		</button>
																	</span>
																</td>
															</tr>
														</tbody>
													</table>
												</fieldset>
											</form>
										</div>
										<div class="form_group">
											<form id="host_form" action="#host" method="post" onsubmit="hostMeeting();return false;" aria-labelledby="host_form_label">
												<fieldset>
													<h1 id="host_form_label">
														<xsl:value-of select="host" />
													</h1>
													<xsl:if test="$internal = 'true'">
														<div class="option-group">
															<h2>
																<xsl:value-of select="participants" />
															</h2>
															<div role="radiogroup">
																<div class="option">
																	<input id="meeting_type_internal" name="meeting_type" type="radio" value="1" checked="true" />
																	<label for="meeting_type_internal">
																		<xsl:value-of select="meeting_internal_des" />
																		<xsl:text>&#160;</xsl:text>
																		<span>
																			<xsl:value-of select="meeting_internal_type" />
																		</span>
																	</label>
																</div>
																<div class="option">
																	<input id="meeting_type_external" name="meeting_type" class="meeting_radio" type="radio" value="0" />
																	<label for="meeting_type_external">
																		<xsl:value-of select="meeting_external_des" />
																		<xsl:text>&#160;</xsl:text>
																		<span>
																			<xsl:value-of select="meeting_external_type" />
																		</span>
																	</label>
																</div>
															</div>
														</div>
													</xsl:if>
													<table cellpadding="0" cellspacing="0" border="0" role="presentation">
														<tbody>
															<tr>
																<td nowrap="nowrap">
																	<span class="button-bg">
																		<xsl:if test="can_host = 0">
																			<xsl:attribute name="class">
													<xsl:text>button-bg-disabled</xsl:text>
												</xsl:attribute>
																			<xsl:attribute name="aria-disabled">
														<xsl:text>true</xsl:text>
												</xsl:attribute>
																		</xsl:if>
																		<img class="fadingblue" src="fadingblue.png" height="100%" width="100%" style="display: none;" alt="" aria-hidden="true" />
																		<img class="fadinggray" src="fadinggray.png" height="100%" width="100%" style="display: none;" alt="" aria-hidden="true" />
																		<button type="submit" name="host">
																			<xsl:if test="can_host = 0">
																				<xsl:attribute name="class">
														<xsl:text>disabled</xsl:text>
													</xsl:attribute>
																				<xsl:attribute name="disabled">
														<xsl:text>true</xsl:text>
													</xsl:attribute>
																			</xsl:if>
																			<span>
																				<xsl:value-of select="host_meeting" />
																			</span>
																		</button>
																	</span>
																	<span id="meeting_id">
																		<xsl:value-of select="meeting_id" />
																	</span>
																</td>
															</tr>
														</tbody>
													</table>
												</fieldset>
											</form>
											<div>
												<a href="#" onclick="setPreferences();return false;">
													<xsl:value-of select="set_preferences" />
												</a>
											</div>
										</div>
									</div>
									<!--
						<div id="footer"> <p><a href="javascript:
						createAccount()"><xsl:value-of select="create_account" /></a></p>
						</div>
					-->
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
