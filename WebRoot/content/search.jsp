<%@page import="com.dlpu.eva.common.NoticeTitle"%>
<%@page import="com.dlpu.eva.global.Global"%>
<%@page import="com.dlpu.eva.common.NewsTitle"%>
<%@page import="com.dlpu.eva.service.SearchService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<title>查询结果</title>
<!-- jquery easyui -->
<link href="<%=basePath%>css/mian.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/index.css" rel="stylesheet" type="text/css" />
<link rel="Stylesheet" type="text/css"
	href="<%=basePath%>jquery-easyui-1.4/themes/icon.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/mycss/content.css">
<link rel="Stylesheet" type="text/css"
	href="<%=basePath%>jquery-easyui-1.4/themes/default/easyui.css" />
<script type="text/javascript"
	src="<%=basePath%>jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>jquery-easyui-1.4/jquery.easyui.min.js"></script>
	
<style type="text/css">
<!--
body {
	background-color: #666666;
}

a:link {
	color: #FFFFFF;
	text-decoration: none;
}

a:visited {
	color: #FFFFFF;
	text-decoration: none;
}

a:hover {
	color: #FFFFFF;
	text-decoration: none;
}

a:active {
	color: #FFFFFF;
	text-decoration: none;
}
.ztys{
	color:black !important;
}
-->
</style>

<script type="text/javascript">
<!--
	function MM_swapImgRestore() { //v3.0
		var i, x, a = document.MM_sr;
		for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++)
			x.src = x.oSrc;
	}
	function MM_preloadImages() { //v3.0
		var d = document;
		if (d.images) {
			if (!d.MM_p)
				d.MM_p = new Array();
			var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
			for (i = 0; i < a.length; i++)
				if (a[i].indexOf("#") != 0) {
					d.MM_p[j] = new Image;
					d.MM_p[j++].src = a[i];
				}
		}
	}

	function MM_findObj(n, d) { //v4.01
		var p, i, x;
		if (!d)
			d = document;
		if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
			d = parent.frames[n.substring(p + 1)].document;
			n = n.substring(0, p);
		}
		if (!(x = d[n]) && d.all)
			x = d.all[n];
		for (i = 0; !x && i < d.forms.length; i++)
			x = d.forms[i][n];
		for (i = 0; !x && d.layers && i < d.layers.length; i++)
			x = MM_findObj(n, d.layers[i].document);
		if (!x && d.getElementById)
			x = d.getElementById(n);
		return x;
	}

	function MM_swapImage() { //v3.0
		var i, j = 0, x, a = MM_swapImage.arguments;
		document.MM_sr = new Array;
		for (i = 0; i < (a.length - 2); i += 3)
			if ((x = MM_findObj(a[i])) != null) {
				document.MM_sr[j++] = x;
				if (!x.oSrc)
					x.oSrc = x.src;
				x.src = a[i + 2];
			}
	}
//-->
</script>
<script src="js/AC_RunActiveContent.js" type="text/javascript"></script>
</head>

<body onload="MM_preloadImages('img/big_menu_02XX.jpg','img/big_menu_03XX.jpg','img/big_menu_04XX.jpg','img/big_menu_05XX.jpg')">
	<div id="index_title">	
		<div id="index_title_01"></div>
		<div id="index_title_02">
			<div id="index_menu">
				<div class="index_menu"
					onmouseover="this.className='index_menu_blue'"
					onmouseout="this.className='index_menu'">
					<a
						href="<%=basePath%>content/content.jsp?type=c&c=<%out.println(Global.T_TISSUE);%>&m=<%out.println(Global.L_TISSUE1);%>&id=1">组织机构</a>
				</div>
				<div class="index_menu"
					onmouseover="this.className='index_menu_blue'"
					onmouseout="this.className='index_menu'">
					<a
						href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_NOTICE);%>&m=<%out.println(Global.L_NOTICE1);%>&p=1">重要通知</a>
				</div>
				<div class="index_menu"
					onmouseover="this.className='index_menu_blue'"
					onmouseout="this.className='index_menu'">
					<a
						href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_POLICY);%>&m=<%out.println(Global.L_POLICY);%>&p=1">政策精神</a>
				</div>
				<div class="index_menu"
					onmouseover="this.className='index_menu_blue'"
					onmouseout="this.className='index_menu'">
					<a
						href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_EVA);%>&m=<%out.println(Global.L_EVA);%>&p=1">专业评估</a>
				</div>
				<div class="index_menu_c"
					onmouseover="this.className='index_menu_blue_c'"
					onmouseout="this.className='index_menu_c'">
					<a
						href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_DATASYSTEM);%>&m=<%out.println(Global.L_DATASYSTEM);%>&p=1">本科教学状态数据库</a>
				</div>
				<div class="index_menu"
					onmouseover="this.className='index_menu_blue'"
					onmouseout="this.className='index_menu'">
					<a
						href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_QUA);%>&m=<%out.println(Global.L_QUA);%>&p=1">质量报告</a>
				</div>
			</div>
		</div>

		<div id="index_title_03"></div>
		<div id="index_title_04">
			<div id="flash">
				<script type="text/javascript">
					AC_FL_RunContent(
							'codebase',
							'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0',
							'width',
							'500',
							'height',
							'75',
							'src',
							'swf/001',
							'quality',
							'high',
							'pluginspage',
							'http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash',
							'wmode', 'transparent', 'movie', 'swf/001'); //end AC code
				</script>
				<noscript>
					<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
						codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0"
						width="500" height="75">
						<param name="movie" value="swf/001.swf" />
						<param name="quality" value="high" />
						<param name="wmode" value="transparent" />
						<embed src="swf/001.swf" width="500" height="75" quality="high"
							pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash"
							type="application/x-shockwave-flash" wmode="transparent"></embed>
					</object>
				</noscript>
			</div>
		</div>
		
		<div id="index_title_05">
				<form action="<%=basePath %>content/search.jsp" method="post">
				<div id="shoushuo">
					<div id="shousuo_left">
						<input id="shousuo" name="word" type="text"
							value="—Search Products—" size="30" />
					</div>
					<div id="shousuo_right">
						<button id="shousuoanniu" name="" type="submit" ></button>
					</div>
				</div>
			</form>
			</div>
		<table border="0" align="center" width="1000px" cellpadding="0"
			cellspacing="0" bgcolor="#FFFFFF">
			<tr>
				<td align="center">查询结果如下：</td>
			</tr>
			<tr>
				<td height="400px" valign="top">
					<table border="0" align="center" width="1280px" cellpadding="0"
						cellspacing="0" class="table table-bordered">
						<%
							String word = request.getParameter("word");
							if (word == null) {
								word = "";
							}
							if (!word.equals("")) {
								SearchService ss = new SearchService();
								ArrayList<NewsTitle> nts = ss.SearchNews(word);
								for (NewsTitle nt : nts) {
									out.println("<tr>");
									out.println("<td align=\"left\" style=\"font-size:14px\" height=\"25px\">");
									out.println("<img src=\"" + basePath
											+ "img/leftleader/ico.gif\"/>");
									out.println("<a  class=\"ztys\"  href=\"" + basePath
											+ "content/content.jsp?type=c&c=" + Global.T_NEWS
											+ "&m=" + Global.L_NEWS + "&id=" + nt.getNewsid()
											+ "\">" + nt.getNewstitle() + "&nbsp;"
											+ nt.getNewstime() + "</a>");
									out.println("<div style=\"width:100%; height:2px; border-top:1px solid #999; clear:both;\"></div>");
									out.println("</td>");
									out.println("</tr>");
								}

								ArrayList<NoticeTitle> nots = ss.SearchNotice1(word);
								for (NoticeTitle nt : nots) {
									out.println("<tr>");
									out.println("<td align=\"left\"  style=\"font-size:14px\" height=\"25px\">");
									out.println("<img src=\"" + basePath
											+ "img/leftleader/ico.gif\"/>");
									out.println("<a class=\"ztys\" href=\"" + basePath
											+ "content/content.jsp?type=c&c=" + Global.T_NOTICE
											+ "&m=" + Global.L_NOTICE1 + "&id="
											+ nt.getNoticeid() + "\">" + nt.getNoticetitle()
											+ "&nbsp;" + nt.getNoticetime() + "</a>");
									out.println("<div style=\"width:100%; height:2px; border-top:1px solid #999; clear:both;\"></div>");
									out.println("</td>");
									out.println("</tr>");
								}

								ArrayList<NoticeTitle> nots2 = ss.SearchNotice2(word);
								for (NoticeTitle nt : nots2) {
									out.println("<tr>");
									out.println("<td align=\"left\" class=\"ztys\" style=\"font-size:14px\" height=\"25px\">");
									out.println("<img src=\"" + basePath
											+ "img/leftleader/ico.gif\"/>");
									out.println("<a class=\"ztys\" href=\"" + basePath
											+ "content/content.jsp?type=c&c=" + Global.T_NOTICE
											+ "&m=" + Global.L_NOTICE2 + "&id="
											+ nt.getNoticeid() + "\">" + nt.getNoticetitle()
											+ "&nbsp;" + nt.getNoticetime() + "</a>");
									out.println("<div style=\"width:100%; height:2px; border-top:1px solid #999; clear:both;\"></div>");
									out.println("</td>");
									out.println("</tr>");
								}
							} else {
								out.println("<tr><td align=\"center\"><h1>请输入搜索内容</h1></td></tr>");
							}
						%>
					</table>
				</td>
			</tr>
			
		</table>
</body>
</html>
