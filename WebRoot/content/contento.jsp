<%@page import="com.dlpu.eva.time.TimeFormat"%>
<%@page import="java.sql.Time"%>
<%@page import="com.dlpu.eva.global.Global"%>
<%@ page import="com.dlpu.eva.service.*"%>
<%@ page import="hibernate.*"%>
<%@ page import="com.dlpu.eva.common.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大连工业大学教务处本科教学评估网</title>
<link href="<%=basePath%>css/mian_red.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/index_red.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/lrtk.css"  rel="stylesheet" type="text/css" />
<script language="javascript" src="<%=basePath%>js/tool/iframeh.js"></script>
<script type="text/javascript"
	src="<%=basePath%>jquery-easyui-1.4/jquery.min.js"></script>
<style type="text/css">
<!--
body {
}
a:link {
	color: #666666;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #666666;
}
a:hover {
	text-decoration: none;
	color: #FF0000;
}
a:active {
	text-decoration: none;
	color: #666666;
}
-->
#spimg {
	width: 246px;
	height: 180px;
}
</style>
<script type="text/javascript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>


<%
	response.setCharacterEncoding("UTF-8");
  final int NUMINPAGE = 20;//每页的条目数

  //判断当前界面类型(l:文章列表 | c:文章内容)
  boolean isList = false;//是否是文章列表
  boolean isContent = false;//是否是文章内容
  int currentPage = 1;//默认当前为第一页
  int totalnum = 0;//一个类型的内容总条目数
  int totalpage = 1;//文章列表的最大页数  
  int currentId = 0;//默认的当前文章ID
  String currentConType = Global.SCHOOLFILE_STRING;
  String currentMenue = "";//当前的左导航选项
  
  SchoolfileService ss;
  NewsService ns;
  NoticeService nos;

  //声明对应的内容类
  
  Schoolfile s = new Schoolfile();
  News n = new News();
  OneNotice on = new OneNotice();
  Notice no = new Notice();
  ArrayList<Noticefile> nfs = new ArrayList<Noticefile>();
  
  //基本载入
  String getConType = request.getParameter("c");
  if (getConType == null) {//参数错误
    response.sendRedirect(basePath + "shpg.jsp?error_c");
    return;
  } else {
    currentConType = getConType;
    //启动对应的Service类   
    ss = new SchoolfileService();
    ns = new NewsService();
    nos = new NoticeService();
  }
  
  String getMenue = request.getParameter("m");
  if (getMenue == null) {//参数错误
    response.sendRedirect(basePath + "shpg.jsp?error_m");
    return;
  } else {
    currentMenue = getMenue;
  }
  String getType = request.getParameter("type");
  if (getType == null) {//参数错误
    response.sendRedirect(basePath + "shpg.jsp?error_type");
    return;
  } else if (getType.equals("l")) {//文章列表
    isList = true;
    String getPage = request.getParameter("p");
    if (getPage == null) {//页面参数缺失则默认跳转到第一页
      response.sendRedirect(basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1");
      return;
    } else {//检查页数是否正确
      if (Integer.parseInt(getPage) <= 0) {//页数过小则跳转到第一页
        response.sendRedirect(basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1");
        return;
      } else {//检查页数是否超过最大数值
        if(currentConType.equals(Global.T_SC_F)){//学校文件
          totalnum = ss.GetSchoolfileNum();
        } 
        
        if(totalnum == 0){//防止循环从定向
          totalnum = 1;
        }

        totalpage = 0;//总共的页数
        if (totalnum % NUMINPAGE == 0) {
          totalpage = totalnum / NUMINPAGE;
        } else {
          totalpage = totalnum / NUMINPAGE + 1;
        }
        if (Integer.parseInt(getPage) > totalpage) {//超出了最大页数
          response.sendRedirect(basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=" + totalpage);//跳转到最后一页
          return;
        }
        currentPage = Integer.parseInt(getPage);
      }
    }
  } else if (getType.equals("c")) {//文章内容
    isContent = true;
    String getId = request.getParameter("id");
    if (getId == null) {
      response.sendRedirect(basePath + "shpg.jsp?error_type");
      return;
    }
    if (currentConType.equals(Global.T_SC_F)) {//学校文件
      s = ss.GetSchoolfileById(getId);
      if (s.getFileid() == null) {//获取的id不存在
        response.sendRedirect(basePath + "error/error.jsp?error=id");
        return;
      }
    }
  }
%>


</head>

<body onload="MM_preloadImages('img/big_menu_02XX.jpg')">
<div id="line"></div>
<div id="mian_body">
  <div id="mian_logo">
			<div id="mian_right_menu">
				<a target="_blank" href="http://dlpu.edu.cn/"> 工大首页 </a>| <a
					target="_blank" href="http://jiaowu.dlpu.edu.cn/"> 教务在线 </a>| <a
					onclick="javascript:addFavorite2()"> 加入收藏 </a>| <a
					onclick="SetHome(this,window.location)"> 设为首页 </a>
			</div>
		</div>
  <div id="mian_menu">

  <div id="main_menu_left">
				<table height="55" width="700" bgcolor="#FA9D41">
					<tr>
						<td class="main_menu"
							onmouseover="this.className='main_menu_yellow'"
							onmouseout="this.className='main_menu'">
							<div align="center">
								<a href="<%=basePath%>shpg.jsp"> <span class="heitimenuzi">首页</span></a>
							</div>
						</td>

						<td class="main_menu"
							onmouseover="this.className='main_menu_yellow'"
							onmouseout="this.className='main_menu'">
							<div align="center">
								<a
									href="<%=basePath%>content/content.jsp?type=c&c=<%out.println(Global.T_TISSUE);%>&m=<%out.println(Global.L_TISSUE1);%>&id=1">
									<span class="heitimenuzi">组织机构</span>
								</a>
							</div>
						</td>

						<td class="main_menu"
							onmouseover="this.className='main_menu_yellow'"
							onmouseout="this.className='main_menu'">
							<div align="center">
								<a
									href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_NOTICE);%>&m=<%out.println(Global.L_NOTICE1);%>&p=1">
									<span class="heitimenuzi">重要通知</span>
								</a>
							</div>
						</td>

						<td class="main_menu"
							onmouseover="this.className='main_menu_yellow'"
							onmouseout="this.className='main_menu'">
							<div align="center">
								<a
									href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_POLICY);%>&m=<%out.println(Global.L_POLICY);%>&p=1">
									<span class="heitimenuzi">政策精神</span>
								</a>
							</div>
						</td>


						<td class="main_menu"
							onmouseover="this.className='main_menu_yellow'"
							onmouseout="this.className='main_menu'">
							<div align="center">
								<a
									href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_EVA);%>&m=<%out.println(Global.L_EVA);%>&p=1">
									<span class="heitimenuzi">专业评估</span>
								</a>
							</div>
						</td>

						<td class="main_menu"
							onmouseover="this.className='main_menu_yellow'"
							onmouseout="this.className='main_menu'">
							<div align="center">
								<a
									href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_DATASYSTEM);%>&m=<%out.println(Global.L_DATASYSTEM);%>&p=1">
									<span class="heitimenuzi">本科教学状态数据库</span>
								</a>
							</div>
						</td>

						<td class="main_menu"
							onmouseover="this.className='main_menu_yellow'"
							onmouseout="this.className='main_menu'">
							<div align="center">
								<a
									href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_QUA);%>&m=<%out.println(Global.L_QUA);%>&p=1">
									<span class="heitimenuzi">质量报告</span>
								</a>
							</div>
						</td>
					</tr>
				</table>
			</div>
  
  
  <div id="shoushuo_box">

        <form action="<%=basePath%>content/search.jsp" method="post">
					<div id="shoushuo_left">
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
  
  
   
  
  
  
  <div id="mian_mian">

    <div id="mian_mian_left">
      <div id="daohang">
  您现在的位置/主页》学校文件》学校文件》
					<% if (currentConType.equals(Global.T_SC_F)) {//学校文件
		  if (isList) {
          	out.println("<b>文件列表</b>");
		  } else if (isContent) {
			out.println("<b>文件内容</b>");
    	  }
    }%>
  </div>
    <p>
				<table border="0" align="center" width="100%" cellpadding="0"
					cellspacing="0">
 	<%
 		if (currentConType.equals(Global.T_SC_F)) {//学校文件
														if(isList){
															ArrayList<SchoolFIleTitle> sfits = ss.getSchoolfileTitles(NUMINPAGE, currentPage);
                                                            for (SchoolFIleTitle sfit : sfits) {
                                                                out.println("<tr class=\"listinfo\">");
                                                                out.println("<td align=\"left\" >");
                                                                out.println("<img src=\"" + basePath + "img/titleleft.jpg\"/>");
                                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=c&c=" + currentConType + "&m=" + currentMenue + "&id="
                                                                        + sfit.getSchoolfileid() + "\"><b>" + sfit.getSchoolfiletitle() + "</b></a>");
                                                                out.println("</td>");
                                                                out.println("<td align=\"right\" >");
                                                                out.println("<i>" + sfit.getSchoolfiletime().substring(0, 10) + "</i> &nbsp;");
                                                                out.println("</td>");
                                                                out.println("</tr>");
                                                            }
														}else if(isContent){
															
                                               				
                                               				out.println("<tr>");
                                               				out.println("<td>"); 
                                               				out.println("<h2 id=\"title_hongtou\">"+s.getFilenumber()+"</h2>"); 
                                               				out.println("</td>");
                                               				out.println("</tr>");
                                               				
                                               				out.println("<tr>");
                                               				out.println("<td align=\"center\" valign=\"top\">");
                                               				out.println("<br/><h1 id=\"houtou_timu\"><b id=\"houtou_timu\" align=\"center\" style=\"font-size:20px;\">" + s.getFiletitle() + "</b></h1>");
                                               				//out.println("<div style=\"width:100%; height:2px; border-top:1px solid #999; clear:both;\"></div>");
                                               				out.println("</td>");
                                               				out.println("</tr>");
                                               				out.println("<tr>");
                                               				out.println("<td>");
                                               				out.println("<p>");
                                               				out.println(s.getFilecontent());
                                               				out.println("</p>");
                                               				out.println("</td>");
                                               				out.println("</tr>");
                                               				
                                               				out.println("<tr>");
                                               				out.println("<td valign=\"top\">");
                                               				out.println("附件:<a href=\""+ basePath + "evafile/" + Global.SCHOOLFILE_STRING +"/" + s.getFileurl() + "\">" +"<font style=\"color:blue; font-size:16px!important; text-decoration:underline\">"+ s.getFilename() + "</font>"+"</a>");
                                               				out.println("</td>");
                                               				out.println("</tr>"); 
                                               				
                                               				out.println("<tr>");
                                               				out.println("<td>"); 
                                               				out.println("<div id=\"yinzhang\">"+s.getFiledate().toString().substring(0,4)+"年"+TimeFormat.getYouwant(s.getFiledate().toString().substring(5, 7))+"月"+TimeFormat.getYouwant(s.getFiledate().toString().substring(8, 10))+"日</div>"); 
                                               				out.println("</td>");
                                               				out.println("</tr>");                    				
														}
														}
 	 %>
    </table>
     </p>
    </div>
    
    
    
			
    
    <div id="mian_mian_right">
    <div id="title_mian1_znz222">
  <div class="title">
      <div class="title_title">站点导航</div>
        </div>
  <div id="ttt">
						<%
							if (currentConType.equals(Global.T_SC_F)) {//学校文件
																out.println("<ul>");
																out.println("<li>");
																out.println("<img src=\"" + basePath
																		+ "img/leftleader/ico.gif\"/>");
																out.println("<a href=\"" + basePath
																		+ "content/content.jsp?type=l&c=" + currentConType
																		+ "&m=" + currentMenue + "&p=1\">学校文件</a>");

																out.println("</li>");
																out.println("</ul>");
															}
						 %>

					</div>
  </div>
    <div id="big_menu_box">
    <div id="big_menu_box_1"></div>
    
    <div id="big_menu_box_2">
						<a
							href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_DATASYSTEM);%>&m=<%out.println(Global.L_DATASYSTEM);%>&p=1"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image10','','<%=basePath%>img/big_menu_02XX.jpg',1)"><img
							src="<%=basePath%>img/big_menu_02.jpg" name="Image10" width="268" height="45"
							border="0" id="Image10" /></a>
					</div>
					<div id="big_menu_box_3">
						<a
							href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_MYEVA);%>&m=<%out.println(Global.L_MYEVA);%>&p=1"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image9','','<%=basePath%>img/big_menu_03XX.jpg',1)"><img
							src="<%=basePath%>img/big_menu_03.jpg" name="Image9" width="268" height="45"
							border="0" id="Image9" /></a>
					</div>
					<div id="big_menu_box_4">
						<a
							href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_MATERIAL);%>&m=<%out.println(Global.L_MATERIAL);%>&p=1"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image11','','<%=basePath%>img/big_menu_04XX.jpg',1)"><img
							src="<%=basePath%>img/big_menu_04.jpg" name="Image11" width="268" height="45"
							border="0" id="Image11" /></a>
					</div>
					<div id="big_menu_box_5">
						<a
							href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_WORK);%>&m=<%out.println(Global.L_WORK);%>&p=1"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image12','','<%=basePath%>img/big_menu_05XX.jpg',1)"><img
							src="<%=basePath%>img/big_menu_05.jpg" name="Image12" width="268" height="44"
							border="0" id="Image12" /></a>
					</div>
  </div>
  <%
					final int NEWSPICTURENUM = 4;//最多显示的新闻图片数目
									ns = new NewsService();
									ArrayList<NewsPicture> npa = ns.GetNewsPictures(NEWSPICTURENUM);
				%>
  <div id="title_mian1_znz">
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
  
  
  <div id="index_mian1_left">
  
    <div id="index_box1">
      <div class="title">
      <div class="title_title">会议/公告</div>
        <div class="bar">
        <a href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_NOTICE);%>&m=<%out.println(Global.L_NOTICE2);%>&p=1"><img
									src="<%=basePath%>img/bar.gif" alt="more" /></a>       </div>
      </div> 

      <div id="index_box_main">
        <ul>
          <%
									final int NOTICENUM_1 = 3;//主页的工作通知数量
																					final int NOTICENUM_2 = 3;//主页的会议通知数量
																					nos = new NoticeService();
																					ArrayList<NoticeTitle> nota2 = nos.GetNoticeTitles(NOTICENUM_2, 1,
																							2);
																					for (NoticeTitle not : nota2) {
																						out.println("<li><a href=\"" + basePath
																								+ "content/content.jsp?type=c&c=" + Global.T_NOTICE
																								+ "&m=" + Global.L_NOTICE1 + "&id=" + not.getNoticeid()
																								+ "\" title=\"" + not.getNoticetitle() + "\">"
																								+ not.getNoticetitle() + "</a></li>");
																					}
								%>
        </ul>
      </div>
    </div>
    <div id="index_box1">
      <div class="title">
      <div class="title_title">工作通知</div>
        <div class="bar">
        <a href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_NOTICE);%>&m=<%out.println(Global.L_NOTICE1);%>&p=1"><img
									src="<%=basePath%>img/bar.gif" alt="more" /></a>        </div>
      </div> 

      <div id="index_box_main">
        <ul>
          <%
									ArrayList<NoticeTitle> nota = nos.GetNoticeTitles(NOTICENUM_1, 1, 1);
																					for (NoticeTitle not : nota) {
																						out.println("<li><a href=\"" + basePath
																								+ "content/content.jsp?type=c&c=" + Global.T_NOTICE
																								+ "&m=" + Global.L_NOTICE1 + "&id=" + not.getNoticeid()
																								+ "\" title=\"" + not.getNoticetitle() + "\">"
																								+ not.getNoticetitle() + "</a></li>");
																					}
								%>
        </ul>
      </div>
    </div>
  </div>
    </div>
  </div>
  <div class="clear"></div>
  
  <div id="main_img"></div>
</div>
<div id="foot2">
版权所有 大连工业大学教务处
</div>
<script src="<%=basePath%>js/responsiveslides.min.js"></script>
  <script src="<%=basePath%>js/slide.js"></script>
</body>
</html>

<script>
	function addFavorite2() {
		var url = window.location;
		var title = document.title;
		var ua = navigator.userAgent.toLowerCase();
		if (ua.indexOf("360se") > -1) {
			alert("由于360浏览器功能限制，请按 Ctrl+D 手动收藏！");
		} else if (ua.indexOf("msie 8") > -1) {
			window.external.AddToFavoritesBar(url, title); //IE8
		} else if (document.all) {
			try {
				window.external.addFavorite(url, title);
			} catch (e) {
				alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!');
			}
		} else if (window.sidebar) {
			window.sidebar.addPanel(title, url, "");
		} else {
			alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!');
		}
	}

	function SetHome(obj, vrl) {
		try {
			obj.style.behavior = 'url(#default#homepage)';
			obj.setHomePage(vrl);
		} catch (e) {
			if (window.netscape) {
				try {
					netscape.security.PrivilegeManager
							.enablePrivilege("UniversalXPConnect");
				} catch (e) {
					alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。");
				}
				var prefs = Components.classes['@mozilla.org/preferences-service;1']
						.getService(Components.interfaces.nsIPrefBranch);
				prefs.setCharPref('browser.startup.homepage', vrl);
			}
		}
	}
</script>
