<%@page import="hibernate.Downfile"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.dlpu.eva.service.*"%>
<%@ page import="com.dlpu.eva.common.*"%>
<%@ page import="com.dlpu.eva.global.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<title>大连工业大学教务处本科教学工作审核评估网</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<meta http-equiv="description" content="大连工业大学教务处本科教学工作审核评估网" />

<link rel="stylesheet" type="text/css" href="<%=basePath%>css/index.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/lrtk.css" />
<script language="javascript" src="<%=basePath%>js/tool/iframeh.js"></script>
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
<body
  onload="MM_preloadImages('img/big_menu_02XX.jpg','img/big_menu_03XX.jpg','img/big_menu_04XX.jpg','img/big_menu_05XX.jpg')">
  <div class="body">
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
        <form action="<%=basePath%>content/search.jsp" method="post">
          <div id="shoushuo">
            <div id="shousuo_left">
              <input id="shousuo" name="word" type="text"
                value="—Search Products—" size="30" />
            </div>
            <div id="shousuo_right">
              <button id="shousuoanniu" name="" type="submit"></button>
            </div>
          </div>
        </form>
      </div>
    </div>
    <div class="clear"></div>
    <div id="index_main1">
      <div id="index_mian1_left">


        <div id="index_box1">
          <div class="title">
            <div class="title_title">会议/公告</div>
            <div class="bar">
              <a
                href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_NOTICE);%>&m=<%out.println(Global.L_NOTICE2);%>&p=1"><img
                src="img/bar.gif" alt="more" /></a>
            </div>
          </div>

          <div id="index_box_main">
            <ul>
              <%
                final int NOTICENUM_1 = 4;//主页的工作通知数量
                final int NOTICENUM_2 = 4;//主页的会议通知数量
                NoticeService nos = new NoticeService();
                ArrayList<NoticeTitle> nota2 = nos.GetNoticeTitles(NOTICENUM_2, 1,
                    2);
                for (NoticeTitle not : nota2) {
                
                  if(not.getNoticetitle().length()<=11){
                  out.println("<li><a href=\"" + basePath
                      + "content/content.jsp?type=c&c=" + Global.T_NOTICE
                      + "&m=" + Global.L_NOTICE1 + "&id=" + not.getNoticeid()
                      + "\" title=\"" + not.getNoticetitle() + "\">"
                      + not.getNoticetitle()
                      + "</a><span class=\"text_right\">["
                      + not.getNoticetime().substring(2, 10)
                      + "]</span></li>");
                   }else{
                   	  out.println("<li><a href=\"" + basePath
                      + "content/content.jsp?type=c&c=" + Global.T_NOTICE
                      + "&m=" + Global.L_NOTICE1 + "&id=" + not.getNoticeid()
                      + "\" title=\"" + not.getNoticetitle() + "\">"
                      + not.getNoticetitle().substring(0, 11)+"..."
                      + "</a><span class=\"text_right\">["
                      + not.getNoticetime().substring(2, 10)
                      + "]</span></li>");
                   }
                }
              %>


            </ul>
          </div>
        </div>
        <div id="index_box1">
          <div class="title">
            <div class="title_title">工作通知</div>
            <div class="bar">
              <a
                href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_NOTICE);%>&m=<%out.println(Global.L_NOTICE1);%>&p=1"><img
                src="img/bar.gif" alt="more" /></a>
            </div>
          </div>

          <div id="index_box_main">
            <ul>
              <%
                ArrayList<NoticeTitle> nota = nos
                    .GetNoticeTitles(NOTICENUM_1, 1, 1);
                for (NoticeTitle not : nota) {
                  if(not.getNoticetitle().length()<=11){
                  	 out.println("<li><a href=\"" + basePath
                      + "content/content.jsp?type=c&c=" + Global.T_NOTICE
                      + "&m=" + Global.L_NOTICE1 + "&id=" + not.getNoticeid()
                      + "\" title=\"" + not.getNoticetitle() + "\">"
                      + not.getNoticetitle()
                      + "</a><span class=\"text_right\">["
                      + not.getNoticetime().substring(2, 10)
                      + "]</span></li>");
                  }else{
                  	out.println("<li><a href=\"" + basePath
                      + "content/content.jsp?type=c&c=" + Global.T_NOTICE
                      + "&m=" + Global.L_NOTICE1 + "&id=" + not.getNoticeid()
                      + "\" title=\"" + not.getNoticetitle() + "\">"
                      + not.getNoticetitle().substring(0, 11)+"..."
                      + "</a><span class=\"text_right\">["
                      + not.getNoticetime().substring(2, 10)
                      + "]</span></li>");
                  }
                 
                }
              %>
            </ul>
          </div>
        </div>



      </div>

      <div id="title_mian1_middle">

        <div id="index_box3">
          <div class="title">
            <div class="title_title">新闻动态</div>
            <div class="bar">
              <a
                href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_NEWS);%>&m=<%out.println(Global.L_NEWS);%>&p=1"><img
                src="img/bar.gif" alt="more" /></a>
            </div>
          </div>
          <%
            final int NEWSPICTURENUM = 5;//最多显示的新闻图片数目
            NewsService ns = new NewsService();
            ArrayList<NewsPicture> npa = ns.GetNewsPictures(NEWSPICTURENUM);
          %>
          <div id="index_box_main2">
            <ul>
              <%
                final int NEWSTITLENUM = 9;//最多显示的新闻标题数
                //NewsService ns = new NewsService();
                ArrayList<NewsTitle> nta = ns.GetNewsTitle(NEWSTITLENUM, 1);

                for (NewsTitle nt : nta) {
                  if(nt.getNewstitle().length()<=25){
                  out.println("<li><a href=\"" + basePath
                      + "content/content.jsp?type=c&c=" + Global.T_NEWS
                      + "&m=" + Global.L_NEWS + "&id=" + nt.getNewsid()
                      + "\" title=\"" + nt.getNewstitle() + "\">"
                      + nt.getNewstitle()
                      + "</a><span class=\"text_right\">["
                      + nt.getNewstime().substring(2, 10) + "]</span></li>");
                  }else{
                  	out.println("<li><a href=\"" + basePath
                      + "content/content.jsp?type=c&c=" + Global.T_NEWS
                      + "&m=" + Global.L_NEWS + "&id=" + nt.getNewsid()
                      + "\" title=\"" + nt.getNewstitle() + "\">"
                      + nt.getNewstitle().substring(0, 25)+"..."
                      + "</a><span class=\"text_right\">["
                      + nt.getNewstime().substring(2, 10) + "]</span></li>");
                  }

                }
              %>
            </ul>
          </div>
        </div>

      </div>

      <div id="title_mian1_middle2">
        <div class="title">
          <div class="title_title">图片新闻</div>
          
        </div>

        <div id="pic_news">
          <div class="slide_container">
            <ul class="rslides" id="slider">
            
              <%
                for (NewsPicture np : npa) {
                  out.println("<li><a href=\"" + basePath
                      + "content/content.jsp?type=c&c=" + Global.T_NEWS
                      + "&m=" + Global.L_NEWS + "&id=" + np.getPictureid()
                      + "\" target1`=\"_blank\"><img src=\"" + basePath
                      + "evafile/" + Global.NEWSFILE_STRING + "/"
                      + np.getPictureurl() + "\" /><p class=\"caption\">"+np.getPicturetitle()+"</p></a></li>");
                }
              %>
  

            </ul>
          </div>

      </div>
      </div>

      <div id="big_menu_box">
        <div id="big_menu_box_1"></div>
        <div id="big_menu_box_2">
          <a
            href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_DATASYSTEM);%>&m=<%out.println(Global.L_DATASYSTEM);%>&p=1"
            onmouseout="MM_swapImgRestore()"
            onmouseover="MM_swapImage('Image10','','img/big_menu_02XX.jpg',1)"><img
            src="img/big_menu_02.jpg" name="Image10" width="268" height="45"
            border="0" id="Image10" /></a>
        </div>
        <div id="big_menu_box_3">
          <a
            href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_MYEVA);%>&m=<%out.println(Global.L_MYEVA);%>&p=1"
            onmouseout="MM_swapImgRestore()"
            onmouseover="MM_swapImage('Image9','','img/big_menu_03XX.jpg',1)"><img
            src="img/big_menu_03.jpg" name="Image9" width="268" height="45"
            border="0" id="Image9" /></a>
        </div>
        <div id="big_menu_box_4">
          <a
            href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_MATERIAL);%>&m=<%out.println(Global.L_MATERIAL);%>&p=1"
            onmouseout="MM_swapImgRestore()"
            onmouseover="MM_swapImage('Image11','','img/big_menu_04XX.jpg',1)"><img
            src="img/big_menu_04.jpg" name="Image11" width="268" height="45"
            border="0" id="Image11" /></a>
        </div>
        <div id="big_menu_box_5">
          <a
            href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_WORK);%>&m=<%out.println(Global.L_WORK);%>&p=1"
            onmouseout="MM_swapImgRestore()"
            onmouseover="MM_swapImage('Image12','','img/big_menu_05XX.jpg',1)"><img
            src="img/big_menu_05.jpg" name="Image12" width="268" height="44"
            border="0" id="Image12" /></a>
        </div>
      </div>
    </div>
    <div class="clear"></div>
    <div id="index_main2">
      <div id="index_mian2_left">
        <div id="index_box4">
          <div class="title2">
            <div class="title_title">评估简报</div>
            <div class="bar">
              <a
                href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_BULLETIN);%>&m=<%out.println(Global.L_BULLETIN);%>&p=1"><img
                src="img/bar.gif" alt="more" /></a>
            </div>
          </div>

          <div id="index_box_main1">
            <ul>
              <%
                final int BULLETININPAGE = 6;//主页的评估简报的数目
                BulletinService bs = new BulletinService();
                ArrayList<BulletinTitle> bts = bs.getBulletinTitles(BULLETININPAGE,
                    1);
                for (BulletinTitle bt : bts) {
                  if(bt.getBulletintitle().length()<=11){
                  	out.println("<li>");
                    out.println("<a href=\"" + basePath
                      + "content/content.jsp?type=c&c=" + Global.T_BULLETIN
                      + "&m=" + Global.L_BULLETIN + "&id="
                      + bt.getBulletinid() + "\" title=\"" + bt.getBulletintitle() + "\">" + bt.getBulletintitle()
                      + "</a><span class=\"text_right\">"
                      + bt.getBulletindate().substring(2, 10) + "</span>");
                     out.println("</li>");
                  }else{
                  	out.println("<li>");
                    out.println("<a href=\"" + basePath
                      + "content/content.jsp?type=c&c=" + Global.T_BULLETIN
                      + "&m=" + Global.L_BULLETIN + "&id="
                      + bt.getBulletinid() + "\" title=\"" + bt.getBulletintitle() + "\">" 
                      + bt.getBulletintitle().substring(0, 11)+"..."
                      + "</a><span class=\"text_right\">"
                      +"[" +bt.getBulletindate().substring(2, 10) +"]"+ "</span>");
                     out.println("</li>");
                  }
                  
                }
              %>
            </ul>
          </div>
        </div>
        <div id="index_box5">
          <div class="title2">
            <div class="title_title">质量报告</div>
            <div class="bar">
              <a
                href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_QUA);%>&m=<%out.println(Global.L_QUA);%>&p=1"><img
                src="img/bar.gif" alt="more" /></a>
            </div>
          </div>
          <div class="clear"></div>
          <div id="index_box_main">
            <ul>
              <%
                final int QUAINPAGE = 6;//主页的质量报告的数目
                QualityService qs = new QualityService();
                ArrayList<QualityTitle> qta = qs.getQualityTitles(QUAINPAGE, 1);
                for (QualityTitle qt : qta) {
				if(qt.getQuatitle().length() <=11){
					out.println("<li>");
                    out.println("<a href=\"" + basePath
                      + "content/content.jsp?type=c&c=" + Global.T_QUA
                      + "&m=" + Global.L_QUA + "&id=" + qt.getQuaid()
                      + "\" title=\"" + qt.getQuatitle() + "\">"
                      + qt.getQuatitle() + "</a><span class=\"text_right\">["
                      + qt.getQuadate().substring(2, 10) + "]</span>");
                    out.println("</li>");
				}else{	
				    out.println("<li>");
                    out.println("<a href=\"" + basePath
                      + "content/content.jsp?type=c&c=" + Global.T_QUA
                      + "&m=" + Global.L_QUA + "&id=" + qt.getQuaid()
                      + "\" title=\"" + qt.getQuatitle() + "\">"
                      + qt.getQuatitle().substring(0, 11)+"..." + "</a><span class=\"text_right\">["
                      + qt.getQuadate().substring(2, 10) + "]</span>");
                    out.println("</li>");
				}
                  

                }
              %>
            </ul>
          </div>
        </div>
      </div>

      <div id="title_mian2_middle">

        <div id="index_box6">
          <div class="title2">
            <div class="title_title">学校文件</div>
            <div class="bar">
              <a
                href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_SC_F);%>&m=<%out.println(Global.L_SC_F);%>&p=1"><img
                src="img/bar.gif" alt="more" /></a>
            </div>
          </div>

          <div id="index_box_main6">
            <ul>
              <%
                final int SCHOOLFILEINPAGE = 10;//主页的学校文件的数目
                SchoolfileService ss = new SchoolfileService();
                ArrayList<SchoolFIleTitle> sfits = ss.getSchoolfileTitles(
                    SCHOOLFILEINPAGE, 1);
                for (SchoolFIleTitle sfit : sfits) {
				 if(sfit.getSchoolfiletitle().length() <=25){
				 	out.println("<li>");
                    out.println("<a href=\"" + basePath
                      + "content/contento.jsp?type=c&c=" + Global.T_SC_F
                      + "&m=" + Global.L_SC_F + "&id="
                      + sfit.getSchoolfileid() + " \" title=\""
                      + sfit.getSchoolfiletitle() + "\">"
                      + sfit.getSchoolfiletitle()
                      + "</a><span class=\"text_right\">["
                      + sfit.getSchoolfiletime().substring(2, 10)
                      + "]</span>");
                    out.println("</li>");
				 }else{
				 	out.println("<li>");
                    out.println("<a href=\"" + basePath
                      + "content/contento.jsp?type=c&c=" + Global.T_SC_F
                      + "&m=" + Global.L_SC_F + "&id="
                      + sfit.getSchoolfileid() + " \" title=\""
                      + sfit.getSchoolfiletitle() + "\">"
                      + sfit.getSchoolfiletitle().substring(0, 25)+"..."
                      + "</a><span class=\"text_right\">["
                      + sfit.getSchoolfiletime().substring(2, 10)
                      + "]</span>");
                    out.println("</li>");
				 }
                  

                }
              %>
            </ul>
          </div>
        </div>
      </div>

      <div id="title_mian1_middle7">
        <div id="index_box8">
          <div class="title2">
            <div class="title_title">下载专区</div>
            <div class="bar">
              <a
                href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_DOWNFILE);%>&m=<%out.println(Global.L_DOWNFILE);%>&p=1"><img
                src="img/bar.gif" alt="more" /></a>
            </div>
          </div>

          <div id="index_box_main4">
            <ul>
              <%
                final int EVAINPAGE = 10;
                final int DOWNFILEINPAGE = 10;//主页的文件下载的数目
                DownfileService dfs = new DownfileService();
                ArrayList<Downfile> ds = dfs.getDownfile(EVAINPAGE, 1);
                for (Downfile e : ds) {
                  if(e.getFilename().length()<=15){
                  	out.println("<li>");
                    out.println("<a href=\"" + basePath + "evafile/"
                      + Global.FILEDOWNLOAD_STRING + "/" + e.getFileurl()
                      + "\" target=\"_blank\" title=\"" + e.getFilename()
                      + "\">" + e.getFilename() + "</a>");
                    out.println("</li>");
                  }else{
                  	out.println("<li>");
                    out.println("<a href=\"" + basePath + "evafile/"
                      + Global.FILEDOWNLOAD_STRING + "/" + e.getFileurl()
                      + "\" target=\"_blank\" title=\"" + e.getFilename()
                      + "\">" + e.getFilename().substring(0, 15)+"..." + "</a>");
                    out.println("</li>");
                  }
                  
                }
              %>
            </ul>
          </div>
        </div>
      </div>
      <div id="big_menu_box2">
        <div id="index_box9">
          <div class="title2">
            <div class="title_title">政策精神</div>
            <div class="bar">
              <a
                href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_POLICY);%>&m=<%out.println(Global.L_POLICY);%>&p=1"><img
                src="img/bar.gif" alt="more" /></a>
            </div>
          </div>

          <div id="index_box_main7">
            <ul>
              <%
                final int POLICYINPAGE = 5;//主页的政策精神的数目
                PolicyService ps = new PolicyService();
                ArrayList<PolicyTitle> pta = ps.GetPolicyTitle(POLICYINPAGE, 1);
                for (PolicyTitle pt : pta) {
                  if(pt.getPolicyTitle().length()<=12){
                  	out.println("<li>");
                    out.println("<a href=\"" + basePath
                      + "content/content.jsp?type=c&c=" + Global.T_POLICY
                      + "&m=" + Global.L_POLICY + "&id=" + pt.getPolicyId()
                      + "\" title=\"" + pt.getPolicyTitle() + "\">"
                      + pt.getPolicyTitle()
                      + "</a><span class=\"text_right\">["
                      + pt.getPolicyTime().substring(2, 10) + "]</span>");
                    out.println("</li>");
                  }else{
                  	out.println("<li>");
                    out.println("<a href=\"" + basePath
                      + "content/content.jsp?type=c&c=" + Global.T_POLICY
                      + "&m=" + Global.L_POLICY + "&id=" + pt.getPolicyId()
                      + "\" title=\"" + pt.getPolicyTitle() + "\">"
                      + pt.getPolicyTitle().substring(0, 12)+"..."
                      + "</a><span class=\"text_right\">["
                      + pt.getPolicyTime().substring(2, 10) + "]</span>");
                    out.println("</li>");
                  }
                  
                }
              %>
            </ul>
          </div>
        </div>
      </div>


      <div id="big_menu_box2">
        <div id="index_box9">
          <div class="title2">
            <div class="title_title">专业评估</div>
            <div class="bar">
              <a
                href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_EVA);%>&m=<%out.println(Global.L_EVA);%>&p=1"><img
                src="img/bar.gif" alt="more" /></a>
            </div>
          </div>

          <div id="index_box_main5">
            <ul>
              <%
                final int PAGE = 6;//主页的专业评估的数目
                EvaService es = new EvaService();
                ArrayList<EvaTitle> ets = es.getEvaTitles(PAGE, 1);
                for (EvaTitle et : ets) {
                if(et.getEvatitle().length()<=18){
                	out.println("<li>");
                    out.println("<a href=\"" + basePath
                      + "content/content.jsp?type=c&c=" + Global.T_EVA
                      + "&m=" + Global.L_EVA + "&id=" + et.getEvaid() + "\" title=\"" + et.getEvatitle()
                      + "\">"
                      + et.getEvatitle() + "</a>");
                    out.println("</li>");
                }else{
                	out.println("<li>");
                    out.println("<a href=\"" + basePath
                      + "content/content.jsp?type=c&c=" + Global.T_EVA
                      + "&m=" + Global.L_EVA + "&id=" + et.getEvaid() + "\" title=\"" + et.getEvatitle()
                      + "\">"
                      + et.getEvatitle().substring(0, 18)+"..." + "</a>");
                    out.println("</li>");
                }
                  
                }
              %>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="clear"></div>
    <div id="foot">
      大连工业大学 教务处 版权所有| <a href="<%=basePath%>loging/loginpage.jsp">管理员入口</a>|
    </div>

  </div>
  <script src="<%=basePath%>js/responsiveslides.min.js"></script>
  <script src="<%=basePath%>js/slide.js"></script>
</body>

</html>


