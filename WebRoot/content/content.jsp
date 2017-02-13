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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=basePath%>css/mian.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/index.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/lrtk.css">
<link rel="Stylesheet" type="text/css"
	href="<%=basePath%>jquery-easyui-1.4/themes/icon.css" />
<link rel="Stylesheet" type="text/css"
	href="<%=basePath%>jquery-easyui-1.4/themes/default/easyui.css" />
<script type="text/javascript"
	src="<%=basePath%>jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>jquery-easyui-1.4/jquery.easyui.min.js"></script>
<script language="javascript" src="<%=basePath%>js/tool/iframeh.js"></script>
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
#content_table{
	width:690px;
	table-layout:fixed
}
</style>

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
  String currentConType = Global.T_NEWS;//默认的内容类型为:新闻
  String currentMenue = "";//当前的左导航选项

  //声明所有的Service类
  NewsService ns;
  NoticeService nos;
  PolicyService ps;
  QualityService qs;
  SchoolfileService ss;
  EvaService es;
  BulletinService bs;
  MyevaService ms;
  WorkService ws;
  DatasystemService ds;
  DownfileService dofs;
  MaterialService mas;
  TissueService ts;

  //声明对应的内容类
  News n = new News();
  OneNotice on = new OneNotice();
  Notice no = new Notice();
  ArrayList<Noticefile> nfs = new ArrayList<Noticefile>();
  Policy p = new Policy();
  Quality q = new Quality();
  Schoolfile s = new Schoolfile();
  Eva e = new Eva();
  Bulletin b = new Bulletin();
  Myeva m = new Myeva();
  Work w = new Work();
  Datasystem d = new Datasystem();
  Downfile df = new Downfile();
  Material ma = new Material();
  Tissue t1 = new Tissue();
  Tissue t2 = new Tissue();
  Tissue t3 = new Tissue();

  //基本载入
  String getConType = request.getParameter("c");
  if (getConType == null) {//参数错误
    response.sendRedirect(basePath + "shpg.jsp?error_c");
    return;
  } else {
    currentConType = getConType;
    //启动对应的Service类
    ns = new NewsService();
    nos = new NoticeService();
    ps = new PolicyService();
    qs = new QualityService();
    ss = new SchoolfileService();
    es = new EvaService();
    bs = new BulletinService();
    ms = new MyevaService();
    ws = new WorkService();
    ds = new DatasystemService();
    dofs = new DownfileService();
    mas = new MaterialService();
    ts = new TissueService();
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
        if (currentConType.equals(Global.T_NEWS)) {//获取新闻的条目数
          totalnum = ns.GetNewsNum();//新闻的总数
        } else if (currentConType.equals(Global.T_NOTICE)) {//获取通知的条目数
          if (currentMenue.equals(Global.L_NOTICE1)) {
            totalnum = nos.GetNoticeNum(1);
          } else if (currentMenue.equals(Global.L_NOTICE2)) {
            totalnum = nos.GetNoticeNum(2);
          }
        } else if (currentConType.equals(Global.T_POLICY)) {//政策精神
          totalnum = ps.GetPolicyNum();
        } else if (currentConType.equals(Global.T_QUA)) {//质量报告
        	if(currentMenue.equals(Global.L_QUA)){  //本科教学质量报告
        		totalnum = qs.GetQuaNum(0);
        	}else if(currentMenue.equals(Global.L_QUA1)){//就业质量年度报告
        		totalnum = qs.GetQuaNum(1);
        	}else if(currentMenue.equals(Global.L_QUA2)){//艺术教育年度报告
        		totalnum = qs.GetQuaNum(2);
        	}
          
        } else if(currentConType.equals(Global.T_SC_F)){//学校文件
          totalnum = ss.GetSchoolfileNum();
        } else if(currentConType.equals(Global.T_EVA)){//专业评估
          totalnum = es.GetEvaNum();
        } else if(currentConType.equals(Global.T_BULLETIN)){//评估简报
          totalnum = bs.GetBulletinNum();
        } else if(currentConType.equals(Global.T_MYEVA)){//自评报告
          totalnum = ms.GetMyevaNum();
        } else if(currentConType.equals(Global.T_WORK)){//专家工作
          totalnum = ws.GetWorkNum();
        } else if(currentConType.equals(Global.T_DATASYSTEM)){//数据库
          totalnum = ds.GetDatasystemNum();
        } else if(currentConType.equals(Global.T_DOWNFILE)){//文件下载
          totalnum = dofs.GetDownfileNum();
        } else if(currentConType.equals(Global.T_MATERIAL)){//支撑材料
          totalnum = mas.GetMaterialNum();
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
    if (currentConType.equals(Global.T_NEWS)) {//新闻
      if (currentMenue.equals(Global.L_NEWS)) {
        n = ns.GetNewsById(getId);
        if (n.getNewsid() == null) {//获取的id不存在
          response.sendRedirect(basePath + "error/error.jsp?error=id");
          return;
        }
      }
    } else if (currentConType.equals(Global.T_NOTICE)) {//通知
      on = nos.getOneNotice(getId);
      if (on.getNotice().getNoticeid() == null) {//获取的id不存在
        response.sendRedirect(basePath + "error/error.jsp?error=id");
        return;
      }
      no = on.getNotice();
      nfs = on.getNoticefiles();
    } else if (currentConType.equals(Global.T_POLICY)) {//政策精神
      p = ps.GetPolicyById(getId);
      if (p.getPolicyid() == null) {//获取的id不存在
        response.sendRedirect(basePath + "error/error.jsp?error=id");
        return;
      }
    } else if (currentConType.equals(Global.T_QUA)) {//质量报告
      q = qs.GetQuaById(getId);
      if (q.getQuaid() == null) {//获取的id不存在
        response.sendRedirect(basePath + "error/error.jsp?error=id");
        return;
      }
    } else if (currentConType.equals(Global.T_SC_F)) {//学校文件
      s = ss.GetSchoolfileById(getId);
      if (s.getFileid() == null) {//获取的id不存在
        response.sendRedirect(basePath + "error/error.jsp?error=id");
        return;
      }
    } else if (currentConType.equals(Global.T_EVA)) {//专业评估
      e = es.GetEvaById(getId);
      if (e.getEvaid() == null) {//获取的id不存在
        response.sendRedirect(basePath + "error/error.jsp?error=id");
        return;
      }
    } else if (currentConType.equals(Global.T_BULLETIN)) {//评估简报
      b = bs.GetBulletinById(getId);
      if (b.getBulletinid() == null) {//获取的id不存在
        response.sendRedirect(basePath + "error/error.jsp?error=id");
        return;
      }
    } else if (currentConType.equals(Global.T_MYEVA)) {//自评报告
      m = ms.GetMyevaById(getId);
      if (m.getMyevaid() == null) {//获取的id不存在
        response.sendRedirect(basePath + "error/error.jsp?error=id");
        return;
      }
    } else if (currentConType.equals(Global.T_WORK)) {//专家工作
      w = ws.GetWorkById(getId);
      if (w.getWorkid() == null) {//获取的id不存在
        response.sendRedirect(basePath + "error/error.jsp?error=id");
        return;
      }
    } else if (currentConType.equals(Global.T_TISSUE)) {//组织机构
      t1 = ts.getTissue1();
      t2 = ts.getTissue2();
      t3 = ts.getTissue3();
    } 
  }
%>

<title>
	<%
		if (isList) {//列表
		      if (currentConType.equals(Global.T_NEWS)) {
		        out.println("新闻动态");
		      } else if (currentConType.equals(Global.T_NOTICE)) {
		        out.println("重要通知");
		      } else if (currentConType.equals(Global.T_POLICY)) {
		        out.println("政策精神");
		      } else if (currentConType.equals(Global.T_QUA)) {//质量报告
		        out.println("质量报告");
		      } else if (currentConType.equals(Global.T_SC_F)) {
		        out.println("学校文件");
		      } else if (currentConType.equals(Global.T_EVA)) {
		        out.println("专业评估");
		      } else if (currentConType.equals(Global.T_BULLETIN)) {
		        out.println("评估简报");
		      } else if (currentConType.equals(Global.T_MYEVA)) {
		        out.println("自评报告");
		      } else if (currentConType.equals(Global.T_WORK)) {
		        out.println("专家工作");
		      } else if (currentConType.equals(Global.T_DATASYSTEM)) {
		        out.println("教学基本状态数据库");
		      } else if (currentConType.equals(Global.T_DOWNFILE)) {
		        out.println("下载专区");
		      } else if (currentConType.equals(Global.T_MATERIAL)) {
		        out.println("支撑材料");
		      } 

		    } else if (isContent) {//内容
		      if (currentConType.equals(Global.T_NEWS)) {
		        if (currentMenue.equals(Global.L_NEWS)) {
		          out.println(n.getNewstitle());
		        }
		      } else if (currentConType.equals(Global.T_NOTICE)) {
		        out.println(no.getNoticetitle());
		      } else if (currentConType.equals(Global.T_POLICY)) {
		        out.println(p.getPolicytitle());
		      } else if (currentConType.equals(Global.T_QUA)) {//质量报告
		        out.println(q.getQuatitle());
		      } else if (currentConType.equals(Global.T_SC_F)) {
		        out.println(s.getFiletitle());
		      } else if (currentConType.equals(Global.T_EVA)) {
		        out.println(e.getEvatitle());
		      } else if (currentConType.equals(Global.T_BULLETIN)) {
		        out.println(b.getBulletintitle());
		      } else if (currentConType.equals(Global.T_MYEVA)) {
		        out.println(m.getMyevatitle());
		      } else if (currentConType.equals(Global.T_WORK)) {
		        out.println(w.getWorktitle());
		      } else if (currentConType.equals(Global.T_TISSUE)) {
		        out.println("组织机构");
		      }
		    }
	%>
</title>

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

<script>
  $(document).ready(function() {
    $('#leader').hide();
    <%if (getType.equals("l")) {
        out.println("$('#leader').show();");
      }%>
  });
</script>

</head>

<body>
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
				<table height="55" width="690px" bgcolor="#FA9D41">
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

				<p id="weizhi">
					当前位置：<a href="<%=basePath%>shpg.jsp">主页</a> >>
					<%
					if (currentConType.equals(Global.T_NEWS)) {//新闻
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">新闻动态</a>");
																		                                              } else if (currentConType.equals(Global.T_NOTICE)) {//通知
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">重要通知</a>");
																		                                              } else if (currentConType.equals(Global.T_POLICY)) {//政策精神
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">政策精神</a>");
																		                                              } else if (currentConType.equals(Global.T_QUA)) {//质量报告
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">质量报告</a>");
																		                                              } else if (currentConType.equals(Global.T_SC_F)) {//学校文件
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">学校文件</a>");
																		                                              } else if (currentConType.equals(Global.T_EVA)) {//专业评估
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">专业评估</a>");
																		                                              } else if (currentConType.equals(Global.T_BULLETIN)) {//评估简报
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">评估简报</a>");
																		                                              } else if (currentConType.equals(Global.T_MYEVA)) {//自评报告
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">评估简报</a>");
																		                                              } else if (currentConType.equals(Global.T_WORK)) {//专家工作
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">专家工作</a>");
																		                                              } else if (currentConType.equals(Global.T_DATASYSTEM)) {//教学基本状态数据库
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">教学基本状态数据库</a>");
																		                                              } else if (currentConType.equals(Global.T_DOWNFILE)) {//文件下载
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">下载专区</a>");
																		                                              } else if (currentConType.equals(Global.T_MATERIAL)) {//支撑材料
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">支撑材料</a>");
																		                                              } else if (currentConType.equals(Global.T_TISSUE)) {//组织结构
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=c&c=" + currentConType + "&m=" + currentMenue + "&id=1\">"+t1.getTissuetitle()+"</a>");
																		                                              }
				%>
					>>
					<%
					if (currentMenue.equals(Global.L_NEWS)) {//新闻
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">新闻动态</a>");
																		                                              } else if (currentMenue.equals(Global.L_NOTICE1)) {//工作通知
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">工作通知</a>");
																		                                              } else if (currentMenue.equals(Global.L_NOTICE2)) {//会议通知
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">会议通知</a>");
																		                                              } else if (currentMenue.equals(Global.L_POLICY)) {//政策精神
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">政策精神</a>");
																		                                              } else if (currentMenue.equals(Global.L_QUA)) {//质量报告
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">质量报告</a>");
																		                                              } else if (currentMenue.equals(Global.L_SC_F)) {//学校文件
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">学校文件</a>");
																		                                              } else if (currentMenue.equals(Global.L_EVA)) {//专业评估
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">专业评估</a>");
																		                                              } else if (currentMenue.equals(Global.L_BULLETIN)) {//评估简报
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">评估简报</a>");
																		                                              } else if (currentMenue.equals(Global.L_MYEVA)) {//自评报告
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">评估简报</a>");
																		                                              } else if (currentMenue.equals(Global.L_WORK)) {//专家工作
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">专家工作</a>");
																		                                              } else if (currentMenue.equals(Global.L_DATASYSTEM)) {//教学基本状态数据库
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">教学基本状态数据库</a>");
																		                                              } else if (currentMenue.equals(Global.L_DOWNFILE)) {//文件下载
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">下载专区</a>");
																		                                              } else if (currentMenue.equals(Global.L_MATERIAL)) {//支撑材料
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=1\">支撑材料</a>");
																		                                              } else if (currentMenue.equals(Global.L_TISSUE1)) {//组织结构1
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=c&c=" + currentConType + "&m=" + currentMenue + "&id=1\">"+t1.getTissuetitle()+"</a>");
																		                                              } else if (currentMenue.equals(Global.L_TISSUE2)) {//组织机构2
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=c&c=" + currentConType + "&m=" + currentMenue + "&id=1\">"+t2.getTissuetitle()+"</a>");
																		                                              } else if (currentMenue.equals(Global.L_TISSUE3)) {//组织机构3
																		                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=c&c=" + currentConType + "&m=" + currentMenue + "&id=1\">"+t3.getTissuetitle()+"</a>");
																		                                              }
				%>
					>>
					<%
					if (currentConType.equals(Global.T_NEWS)) {//新闻
																		                                                    if (isList) {
																		                                                        out.println("<b>新闻列表</b>");
																		                                                    } else if (isContent) {
																		                                                        out.println("<b>新闻内容</b>");
																		                                                    }
																		                                                } else if (currentConType.equals(Global.T_NOTICE)) {//通知
																		                                                    if (isList) {
																		                                                        out.println("<b>通知列表</b>");
																		                                                    } else if (isContent) {
																		                                                        out.println("<b>通知内容</b>");
																		                                                    }
																		                                                } else if (currentConType.equals(Global.T_POLICY)) {//政策精神
																		                                                    if (isList) {
																		                                                        out.println("<b>政策列表</b>");
																		                                                    } else if (isContent) {
																		                                                        out.println("<b>政策内容</b>");
																		                                                    }
																		                                                } else if (currentConType.equals(Global.T_QUA)) {//质量报告
																		                                                    if (isList) {
																		                                                        out.println("<b>报告列表</b>");
																		                                                    } else if (isContent) {
																		                                                        out.println("<b>报告内容</b>");
																		                                                    }
																		                                                } else if (currentConType.equals(Global.T_SC_F)) {//学校文件
																		                                                    if (isList) {
																		                                                        out.println("<b>文件列表</b>");
																		                                                    } else if (isContent) {
																		                                                        out.println("<b>文件内容</b>");
																		                                                    }
																		                                                } else if (currentConType.equals(Global.T_EVA)) {//专业评估
																		                                                    if (isList) {
																		                                                        out.println("<b>评估列表</b>");
																		                                                    } else if (isContent) {
																		                                                        out.println("<b>评估内容</b>");
																		                                                    }
																		                                                } else if (currentConType.equals(Global.T_BULLETIN)) {//评估简报
																		                                                    if (isList) {
																		                                                        out.println("<b>简报列表</b>");
																		                                                    } else if (isContent) {
																		                                                        out.println("<b>简报内容</b>");
																		                                                    }
																		                                                } else if (currentConType.equals(Global.T_MYEVA)) {//自评报告
																		                                                    if (isList) {
																		                                                        out.println("<b>报告列表</b>");
																		                                                    } else if (isContent) {
																		                                                        out.println("<b>报告内容</b>");
																		                                                    }
																		                                                } else if (currentConType.equals(Global.T_WORK)) {//专家工作
																		                                                    if (isList) {
																		                                                        out.println("<b>工作列表</b>");
																		                                                    } else if (isContent) {
																		                                                        out.println("<b>工作内容</b>");
																		                                                    }
																		                                                } else if (currentConType.equals(Global.T_DATASYSTEM)) {//教学基本状态数据库
																		                                                    if (isList) {
																		                                                        out.println("<b>教学基本状态数据库</b>");
																		                                                    } 
																		                                                } else if (currentConType.equals(Global.T_DOWNFILE)) {//文件下载
																		                                                    if (isList) {
																		                                                        out.println("<b>下载专区</b>");
																		                                                    } 
																		                                                } else if (currentConType.equals(Global.T_MATERIAL)) {//支撑材料
																		                                                    if (isList) {
																		                                                        out.println("<b>支撑材料</b>");
																		                                                    } 
																		                                                } else if (currentConType.equals(Global.T_TISSUE)) {//组织机构
																		                                                    if (isContent) {
																		                                                        out.println("<b>组织机构</b>");
																		                                                    } 
																		                                                }
				%>
					&nbsp;


				</p>

				<p>
				<table id="content_table">
					<%
						if (currentConType.equals(Global.T_NEWS)) {//新闻
																										                                                    if (currentMenue.equals(Global.L_NEWS)) {
																										                                                      if (isList) {//显示列表
																										                                                        ArrayList<NewsTitle> nta = ns.GetNewsTitle(NUMINPAGE, currentPage);
																										                                                        for (NewsTitle nt : nta) {
																										                                                          out.println("<tr class=\"listinfo\">");
																										                                                          out.println("<td style=\"width:560px;text-indent:0px\">");
																										                                                          out.println("<img src=\"" + basePath + "img/titleleft.jpg\"/>");
																										                                                          out.println("<a href=\"" + basePath + "content/content.jsp?type=c&c=" + currentConType + "&m=" + currentMenue + "&id=" + nt.getNewsid() + "\"><b>" + nt.getNewstitle() + "</b></a>");
																										                                                          out.println("</td>");
																										                                                          out.println("<td align=\"right\">");
																										                                                          out.println("<i>" + nt.getNewstime().substring(0, 10) + "</i> &nbsp;");
																										                                                          out.println("</td>");
																										                                                          out.println("</tr>");
																										                                                        }
																										                                                      } else if (isContent) {//显示内容
																										                                                        out.println("<tr>");
																										                                                        out.println("<td align=\"center\">");
																										                                                        out.println("<h1><p id=\"title\">" + n.getNewstitle() + "</p></h1>");
																										                                                        //out.println("<div style=\"width:100%; height:2px; border-top:1px solid #999; clear:both;\"></div>");
																										                                                        out.println("</td>");
																										                                                        out.println("</tr>");
																										                                                        out.println("<tr><td><p id=\"laiyuan\">来源：教务处 添加时间："+n.getNewstime().toString().substring(0, 4)+"年"+TimeFormat.getYouwant(n.getNewstime().toString().substring(5, 7))+"月"+TimeFormat.getYouwant(n.getNewstime().toString().substring(8, 10))+"日</p></td></tr>");
																										                                                        out.println("<tr>");
																										                                                        out.println("<td valign=\"top\" style=\"line-height:30px;padding:30px;\">");
																										                                                        out.println(n.getNewscontent());
																										                                                        out.println("</td>");
																										                                                        out.println("</tr>");
																										                                                      }
																										                                                    }
																										                                                  } else if (currentConType.equals(Global.T_NOTICE)) {//通知
																										                            if(isList){
																										                              if(currentMenue.equals(Global.L_NOTICE1)){
																										                                ArrayList<NoticeTitle> nts = nos.GetNoticeTitles(NUMINPAGE, currentPage, 1);
																										                                                        for (NoticeTitle nt : nts) {
																										                                                          out.println("<tr class=\"listinfo\">");
																										                                                          out.println("<td style=\"width:560px;text-indent:0px\" >");
																										                                                          out.println("<img src=\"" + basePath + "img/titleleft.jpg\"/>");
																										                                                          out.println("<a href=\"" + basePath + "content/content.jsp?type=c&c=" + currentConType + "&m=" + currentMenue + "&id=" + nt.getNoticeid() + "\"><b>" + nt.getNoticetitle() + "</b></a>");
																										                                                          out.println("</td>");
																										                                                          out.println("<td align=\"right\" >");
																										                                                          out.println( nt.getNoticetime().substring(0, 10) + "&nbsp;");
																										                                                          out.println("</td>");
																										                                                          out.println("</tr>");
																										                                                        }
																										                              }else if(currentMenue.equals(Global.L_NOTICE2)){
																										                                ArrayList<NoticeTitle> nts = nos.GetNoticeTitles(NUMINPAGE, currentPage, 2);
																										                                                        for (NoticeTitle nt : nts) {
																										                                                          out.println("<tr class=\"listinfo\">");
																										                                                          out.println("<td style=\"width:560px;text-indent:0px\" >");
																										                                                          out.println("<img src=\"" + basePath + "img/titleleft.jpg\"/>");
																										                                                          out.println("<a href=\"" + basePath + "content/content.jsp?type=c&c=" + currentConType + "&m=" + currentMenue + "&id=" + nt.getNoticeid() + "\"><b>" + nt.getNoticetitle() + "</b></a>");
																										                                                          out.println("</td>");
																										                                                          out.println("<td align=\"right\" ");
																										                                                          out.println(nt.getNoticetime().substring(0, 10) + "&nbsp;");
																										                                                          out.println("</td>");
																										                                                          out.println("</tr>");
																										                                                        }
																										                              }
																										                              
																										                            }else if(isContent){
																										                              out.println("<tr>");
																										                                                      out.println("<td align=\"center\">");
																										                                                      out.println("<h1><p id=\"title\">" + no.getNoticetitle() + "</p></h1>");
																										                                                      //out.println("<div style=\"width:100%; height:2px; border-top:1px solid #999; clear:both;\"></div>");
																										                                                      out.println("</td>");
																										                                                      out.println("</tr>");
																										                                                      out.println("<tr><td><p id=\"laiyuan\">来源：教务处 添加时间："+no.getNoticetime().toString().substring(0, 4)+"年"+TimeFormat.getYouwant(no.getNoticetime().toString().substring(5, 7))+"月"+TimeFormat.getYouwant(no.getNoticetime().toString().substring(8, 10))+"日</p></td></tr>");
																										                                                      out.println("<tr>");
																										                                                      out.println("<td style=\"line-height:30px;padding:30px;\">");
																										                                                      out.println(no.getNoticecontent());
																										                                                      out.println("</td>");
																										                                                      out.println("</tr>");
																										                            }
																										                                                  } else if (currentConType.equals(Global.T_POLICY)) {//政策精神
																										                            if (isList) {
																										                                                            ArrayList<PolicyTitle> pta = ps.GetPolicyTitle(NUMINPAGE, currentPage);
																										                                                            for (PolicyTitle pt : pta) {
																										                                                                out.println("<tr class=\"listinfo\">");
																										                                                                out.println("<td style=\"width:560px;text-indent:0px\" >");
																										                                                                out.println("<img src=\"" + basePath + "img/titleleft.jpg\"/>");
																										                                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=c&c=" + currentConType + "&m=" + currentMenue + "&id="
																										                                                                        + pt.getPolicyId() + "\"><b>" + pt.getPolicyTitle() + "</b></a>");
																										                                                                out.println("</td>");
																										                                                                out.println("<td align=\"right\" ");
																										                                                                out.println(pt.getPolicyTime().substring(0, 10) + " &nbsp;");
																										                                                                out.println("</td>");
																										                                                                out.println("</tr>");
																										                                                            }
																										                                                        } else if (isContent) {
																										                                                            out.println("<tr>");
																										                                                            out.println("<td align=\"center\">");
																										                                                            out.println("<h1><p id=\"title\">" + p.getPolicytitle() + "</p></h1>");
																										                                                            //out.println("<div style=\"width:100%; height:2px; border-top:1px solid #999; clear:both;\"></div>");
																										                                                            out.println("</td>");
																										                                                            out.println("</tr>");
																										                                                            out.println("<tr><td><p id=\"laiyuan\">来源：教务处 添加时间："+p.getPolicydate().toString().substring(0, 4)+"年"+TimeFormat.getYouwant(p.getPolicydate().toString().substring(5, 7))+"月"+TimeFormat.getYouwant(p.getPolicydate().toString().substring(8, 10))+"日</p></td></tr>");
																										                                                            out.println("<tr>");
																										                                                            out.println("<td  valign=\"top\" style=\"line-height:30px;padding:30px;\">");
																										                                                            out.println(p.getPolicycontent());
																										                                                            out.println("</td>");
																										                                                            out.println("</tr>");
																										                                                            if (p.getPolicyurl() != null && (!p.getPolicyurl().equals(""))) {//附件不为空则显示附件
																										                                                                out.println("<tr>");
																										                                                                out.println("<td valign=\"top\">");
																										                                                                out.println("附件:<a href=\"" + basePath + "evafile/"+ Global.POLICYFILE_STRING +"/" + p.getPolicyurl() + "\">" +"<font style=\"color:blue; font-size:16px!important; text-decoration:underline\">"+ p.getPolicyfilename() +"</font>"+ "</a>");
																										                                                                out.println("</td>");
																										                                                                out.println("</tr>");
																										                                                            }
																										                                                        }
																										                                                  } else if (currentConType.equals(Global.T_QUA)) {//质量报告
																										                            if(isList){
																										                            if(currentMenue.equals(Global.L_QUA)){
																										                              ArrayList<QualityTitle> qts = qs.getQualityTitles(NUMINPAGE, currentPage,0);
																										                                                            for (QualityTitle qt : qts) {
																										                                                                out.println("<tr class=\"listinfo\">");
																										                                                                out.println("<td style=\"width:560px;text-indent:0px\" >");
																										                                                                out.println("<img src=\"" + basePath + "img/titleleft.jpg\"/>");
																										                                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=c&c=" + currentConType + "&m=" + currentMenue + "&id="
																										                                                                        + qt.getQuaid() + "\"><b>" + qt.getQuatitle() + "</b></a>");
																										                                                                out.println("</td>");
																										                                                                out.println("<td align=\"right\" >");
																										                                                                out.println(qt.getQuadate().substring(0, 10) + "&nbsp;");
																										                                                                out.println("</td>");
																										                                                                out.println("</tr>");
																										                                                            }
																										                                                            }else if(currentMenue.equals(Global.L_QUA1)){
																										                              ArrayList<QualityTitle> qts = qs.getQualityTitles(NUMINPAGE, currentPage,1);
																										                                                            for (QualityTitle qt : qts) {
																										                                                                out.println("<tr class=\"listinfo\">");
																										                                                                out.println("<td style=\"width:560px;text-indent:0px\" >");
																										                                                                out.println("<img src=\"" + basePath + "img/titleleft.jpg\"/>");
																										                                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=c&c=" + currentConType + "&m=" + currentMenue + "&id="
																										                                                                        + qt.getQuaid() + "\"><b>" + qt.getQuatitle() + "</b></a>");
																										                                                                out.println("</td>");
																										                                                                out.println("<td align=\"right\" >");
																										                                                                out.println(qt.getQuadate().substring(0, 10) + "&nbsp;");
																										                                                                out.println("</td>");
																										                                                                out.println("</tr>");
																										                                                            }
																										                                                            }else if(currentMenue.equals(Global.L_QUA2)){
																										                              ArrayList<QualityTitle> qts = qs.getQualityTitles(NUMINPAGE, currentPage,2);
																										                                                            for (QualityTitle qt : qts) {
																										                                                                out.println("<tr class=\"listinfo\">");
																										                                                                out.println("<td style=\"width:560px;text-indent:0px\" >");
																										                                                                out.println("<img src=\"" + basePath + "img/titleleft.jpg\"/>");
																										                                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=c&c=" + currentConType + "&m=" + currentMenue + "&id="
																										                                                                        + qt.getQuaid() + "\"><b>" + qt.getQuatitle() + "</b></a>");
																										                                                                out.println("</td>");
																										                                                                out.println("<td align=\"right\" >");
																										                                                                out.println("<i>" + qt.getQuadate().substring(0, 10) + "</i> &nbsp;");
																										                                                                out.println("</td>");
																										                                                                out.println("</tr>");
																										                                                            }
																										                                                            }
																										                            }else if(isContent){
																										                              out.println("<tr>");
																										                                                      out.println("<td align=\"center\">");
																										                                                      out.println("<h1><p id=\"title\">" + q.getQuatitle() + "</p></h1>");
																										                                                      //out.println("<div style=\"width:100%; height:2px; border-top:1px solid #999; clear:both;\"></div>");
																										                                                      out.println("</td>");
																										                                                      out.println("</tr>");
																										                                                      out.println("<tr><td><p id=\"laiyuan\">来源：教务处 添加时间："+q.getQuadate().toString().substring(0, 4)+"年"+TimeFormat.getYouwant(q.getQuadate().toString().substring(5, 7))+"月"+TimeFormat.getYouwant(q.getQuadate().toString().substring(8, 10))+"日</p></td></tr>");
																										                                                      out.println("<tr>");
																										                                                      out.println("<td valign=\"top\"><br/>");
																										                                                      out.println("附件:<a href=\""+ basePath + "evafile/" + Global.QUAFILE_STRING +"/" + q.getQuaurl() + "\">" + "<font style=\"color:blue; font-size:16px!important; text-decoration:underline\">"+q.getQuafilename() +"</font>"+ "</a>");
																										                                                      out.println("</td>");
																										                                                      out.println("</tr>");
																										                            }
																										                                                  } else if (currentConType.equals(Global.T_SC_F)) {//学校文件
																										                            if(isList){ 
																										                              ArrayList<SchoolFIleTitle> sfits = ss.getSchoolfileTitles(NUMINPAGE, currentPage);
																										                                                            for (SchoolFIleTitle sfit : sfits) {
																										                                                                out.println("<tr class=\"listinfo\">");
																										                                                                out.println("<td style=\"width:560px;text-indent:0px\" >");
																										                                                                out.println("<img src=\"" + basePath + "img/titleleft.jpg\"/>");
																										                                                                out.println("<a href=\"" + basePath + "content/contento.jsp?type=c&c=" + currentConType + "&m=" + currentMenue + "&id="
																										                                                                        + sfit.getSchoolfileid() + "\"><b>" + sfit.getSchoolfiletitle() + "</b></a>");
																										                                                                out.println("</td>");
																										                                                                out.println("<td align=\"right\" >");
																										                                                                out.println("<i>" + sfit.getSchoolfiletime().substring(0, 10) + "</i> &nbsp;");
																										                                                                out.println("</td>");
																										                                                                out.println("</tr>");
																										                                                            }
																										                            }else if(isContent){
																										                              out.println("<tr>");
																										                                                      out.println("<td align=\"center\" valign=\"top\">");
																										                                                      out.println("<h1><p id=\"title\">" + s.getFiletitle() + "</p></h1>");
																										                                                      //out.println("<div style=\"width:100%; height:2px; border-top:1px solid #999; clear:both;\"></div>");
																										                                                      out.println("</td>");
																										                                                      out.println("</tr>");
																										                                                      out.println("<tr><td><p id=\"laiyuan\">来源：教务处 添加时间："+s.getFiledate().toString().substring(0, 4)+"年"+TimeFormat.getYouwant(s.getFiledate().toString().substring(5, 7))+"月"+TimeFormat.getYouwant(s.getFiledate().toString().substring(8, 10))+"日</p></td></tr>");
																										                                                      out.println("<tr>");
																										                                                      out.println("<td valign=\"top\">");
																										                                                      out.println("附件:<a href=\""+ basePath + "evafile/" + Global.SCHOOLFILE_STRING +"/" + s.getFileurl() + "\">" +"<font style=\"color:blue; font-size:16px!important; text-decoration:underline\">" +s.getFilename() + "</font>"+"</a>");
																										                                                      out.println("</td>");
																										                                                      out.println("</tr>");                               
																										                            }
																										                                                  } else if (currentConType.equals(Global.T_EVA)) {//专业评估
																										                            if(isList){
																										                              ArrayList<EvaTitle> ets = es.getEvaTitles(NUMINPAGE, currentPage);
																										                                                            for (EvaTitle et : ets) {
																										                                                                out.println("<tr class=\"listinfo\">");
																										                                                                out.println("<td style=\"width:560px;text-indent:0px\" >");
																										                                                                out.println("<img src=\"" + basePath + "img/titleleft.jpg\"/>");
																										                                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=c&c=" + currentConType + "&m=" + currentMenue + "&id="
																										                                                                        + et.getEvaid() + "\"><b>" + et.getEvatitle() + "</b></a>");
																										                                                                out.println("</td>");
																										                                                                out.println("<td align=\"right\">");
																										                                                                out.println("<i>" + et.getEvadate().substring(0, 10) + "</i> &nbsp;");
																										                                                                out.println("</td>");
																										                                                                out.println("</tr>");
																										                                                            }
																										                            }else if(isContent){
																										                              out.println("<tr>");
																										                                                      out.println("<td align=\"center\">");
																										                                                      out.println("<h1><p id=\"title\">" + e.getEvatitle() + "</p></h1>");
																										                                                      //out.println("<div style=\"width:100%; height:2px; border-top:1px solid #999; clear:both;\"></div>");
																										                                                      out.println("</td>");
																										                                                      out.println("</tr>");
																										                                                      out.println("<tr><td><p id=\"laiyuan\">来源：教务处 添加时间："+e.getEvadate().toString().substring(0, 4)+"年"+TimeFormat.getYouwant(e.getEvadate().toString().substring(5, 7))+"月"+TimeFormat.getYouwant(e.getEvadate().toString().substring(8, 10))+"日</p></td></tr>");
																										                                                      out.println("<tr>");
																										                                                      out.println("<td valign=\"top\">");
																										                                                      out.println("附件:<a href=\""+ basePath + "evafile/" + Global.EVAFILE_STRING +"/" + e.getEvaurl() + "\">" +"<font style=\"color:blue; font-size:16px!important; text-decoration:underline\">"+ e.getEvafilename() + "</font>"+"</a>");
																										                                                      out.println("</td>");
																										                                                      out.println("</tr>");
																										                            }
																										                                                  } else if (currentConType.equals(Global.T_BULLETIN)) {//评估简报
																										                            if(isList){
																										                              ArrayList<BulletinTitle> bts = bs.getBulletinTitles(NUMINPAGE, currentPage);
																										                                                            for (BulletinTitle bt : bts) {
																										                                                                out.println("<tr class=\"listinfo\">");
																										                                                                out.println("<td style=\"width:560px;text-indent:0px\" >");
																										                                                                out.println("<img src=\"" + basePath + "img/titleleft.jpg\"/>");
																										                                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=c&c=" + currentConType + "&m=" + currentMenue + "&id="
																										                                                                        + bt.getBulletinid() + "\"><b>" + bt.getBulletintitle() + "</b></a>");
																										                                                                out.println("</td>");
																										                                                                out.println("<td align=\"right\" >");
																										                                                                out.println("<i>" + bt.getBulletindate().substring(0, 10) + "</i> &nbsp;");
																										                                                                out.println("</td>");
																										                                                                out.println("</tr>");
																										                                                            }
																										                            }else if(isContent){
																										                              out.println("<tr>");
																										                                                      out.println("<td align=\"center\" valign=\"top\">");
																										                                                      out.println("<br/><h1><p id=\"title\">" + b.getBulletintitle() + "</p></h1>");
																										                                                      //out.println("<div style=\"width:100%; height:2px; border-top:1px solid #999; clear:both;\"></div>");
																										                                                      out.println("</td>");
																										                                                      out.println("</tr>");
																										                                                      out.println("<tr><td><p id=\"laiyuan\">来源：教务处 添加时间："+b.getBulletindate().toString().substring(0, 4)+"年"+TimeFormat.getYouwant(b.getBulletindate().toString().substring(5, 7))+"月"+TimeFormat.getYouwant(b.getBulletindate().toString().substring(8, 10))+"日</p></td></tr>");
																										                                                      out.println("<tr>");
																										                                                      out.println("<td valign=\"top\">");
																										                                                      out.println("附件:<a href=\""+ basePath + "evafile/" + Global.BULLETINFILE_STRING +"/" + b.getBulletinurl() + "\">" +"<font style=\"color:blue; font-size:16px!important; text-decoration:underline\">"+ b.getBulletinfilename() +"</font>"+ "</a>");
																										                                                      out.println("</td>");
																										                                                      out.println("</tr>");
																										                            }
																										                                                  } else if (currentConType.equals(Global.T_MYEVA)) {//自评报告
																										                            if(isList){
																										                              ArrayList<MyevaTitle> mts = ms.getMyevaTitles(NUMINPAGE, currentPage);
																										                                                            for (MyevaTitle mt : mts) {
																										                                                                out.println("<tr class=\"listinfo\">");
																										                                                                out.println("<td style=\"width:560px;text-indent:0px\" >");
																										                                                                out.println("<img src=\"" + basePath + "img/titleleft.jpg\"/>");
																										                                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=c&c=" + currentConType + "&m=" + currentMenue + "&id="
																										                                                                        + mt.getMyevaid() + "\"><b>" + mt.getMyevatitle() + "</b></a>");
																										                                                                out.println("</td>");
																										                                                                out.println("<td align=\"right\" >");
																										                                                                out.println("<i>" + mt.getMyevadate().substring(0, 10) + "</i> &nbsp;");
																										                                                                out.println("</td>");
																										                                                                out.println("</tr>");
																										                                                            }
																										                            }else if(isContent){
																										                              out.println("<tr>");
																										                                                      out.println("<td align=\"center\" valign=\"top\">");
																										                                                      out.println("<p id=\"title\">" + m.getMyevatitle() + "</p>");
																										                                                      //out.println("<div style=\"width:100%; height:2px; border-top:1px solid #999; clear:both;\"></div>");
																										                                                      out.println("</td>");
																										                                                      out.println("</tr>");
																										                                                      out.println("<tr><td><p id=\"laiyuan\">来源：教务处 添加时间："+m.getMyevadate().toString().substring(0, 4)+"年"+TimeFormat.getYouwant(m.getMyevadate().toString().substring(5, 7))+"月"+TimeFormat.getYouwant(m.getMyevadate().toString().substring(8, 10))+"日</p></td></tr>");
																										                                                      out.println("<tr>");
																										                                                      out.println("<td valign=\"top\">");
																										                                                      out.println("附件:<a href=\""+ basePath + "evafile/" + Global.MYEVA_STRING +"/" + m.getMyevafileurl() + "\">" +"<font style=\"color:blue; font-size:16px!important; text-decoration:underline\">"+ m.getMyevafilename() +"</font>"+ "</a>");
																										                                                      out.println("</td>");
																										                                                      out.println("</tr>");
																										                            }
																										                                                  } else if (currentConType.equals(Global.T_WORK)) {//专家工作
																										                            if (isList) {
																										                                                            ArrayList<WorkTitle> wts = ws.GetWorkTitle(NUMINPAGE, currentPage);
																										                                                            for (WorkTitle wt : wts) {
																										                                                                out.println("<tr class=\"listinfo\">");
																										                                                                out.println("<td style=\"width:560px;text-indent:0px\" >");
																										                                                                out.println("<img src=\"" + basePath + "img/titleleft.jpg\"/>");
																										                                                                out.println("<a href=\"" + basePath + "content/content.jsp?type=c&c=" + currentConType + "&m=" + currentMenue + "&id="
																										                                                                        + wt.getWorkid() + "\"><b>" + wt.getWorktitle() + "</b></a>");
																										                                                                out.println("</td>");
																										                                                                out.println("<td align=\"right\" >");
																										                                                                out.println("<i>" + wt.getWorkdate().substring(0, 10) + "</i> &nbsp;");
																										                                                                out.println("</td>");
																										                                                                out.println("</tr>");
																										                                                            }
																										                                                        } else if (isContent) {
																										                                                            out.println("<tr>");
																										                                                            out.println("<td align=\"center\" valign=\"top\">");
																										                                                            out.println("<p id=\"title\">" + w.getWorktitle() + "</p>");
																										                                                            //out.println("<div style=\"width:100%; height:2px; border-top:1px solid #999; clear:both;\"></div>");
																										                                                            out.println("</td>");
																										                                                            out.println("</tr>");
																										                                                            out.println("<tr><td><p id=\"laiyuan\">来源：教务处 添加时间："+w.getWorkdate().toString().substring(0, 4)+"年"+TimeFormat.getYouwant(w.getWorkdate().toString().substring(5, 7))+"月"+TimeFormat.getYouwant(w.getWorkdate().toString().substring(8, 10))+"日</p></td></tr>");
																										                                                            out.println("<tr>");
																										                                                            out.println("<td  valign=\"top\" style=\"line-height:30px;padding:30px;\">");
																										                                                            out.println(w.getWorkcontent());
																										                                                            out.println("</td>");
																										                                                            out.println("</tr>");                                                            
																										                                                        }
																										                                                  } else if (currentConType.equals(Global.T_DATASYSTEM)) {//教学基本状态数据库
																										                            if (isList) {
																										                                                            ArrayList<Datasystem> da = ds.GetDatasystem(NUMINPAGE, currentPage);
																										                                                            for (Datasystem d1 : da) {
																										                                                                out.println("<tr class=\"listinfo\">");
																										                                                                out.println("<td style=\"width:560px;text-indent:0px\" >");
																										                                                                out.println("<img src=\"" + basePath + "img/titleleft.jpg\"/>");
																										                                                                out.println("<a href=\"" + d1.getDataurl() + "\" target=\"_blank\"><b>" + d1.getDatatitle() + "</b></a>");
																										                                                                out.println("</td>");
																										                                                                out.println("<td align=\"right\" s>");
																										                                                                out.println("</td>");
																										                                                                out.println("</tr>");
																										                                                            }
																										                                                        } 
																										                                                  } else if (currentConType.equals(Global.T_DOWNFILE)) {//文件下载
																										                            if (isList) {
																										                                                            ArrayList<Downfile> dfs = dofs.getDownfile(NUMINPAGE, currentPage);
																										                                                            for (Downfile d1 : dfs) {
																										                                                                out.println("<tr class=\"listinfo\">");
																										                                                                out.println("<td style=\"width:560px;text-indent:0px\" >");
																										                                                                out.println("<img src=\"" + basePath + "img/titleleft.jpg\"/>");
																										                                                                out.println("<a href=\"" +basePath +"evafile/" + Global.FILEDOWNLOAD_STRING + "/" + d1.getFileurl() + "\" target=\"_blank\"><b>" + d1.getFilename() + "</b></a>");
																										                                                                out.println("</td>");
																										                                                                out.println("<td align=\"right\" >");
																										                                                                out.println("</td>");
																										                                                                out.println("</tr>");
																										                                                            }
																										                                                        } 
																										                                                  } else if (currentConType.equals(Global.T_DOWNFILE)) {//支撑材料
																										                            if (isList) {
																										                                                            ArrayList<Material> dfs = mas.getMaterial(NUMINPAGE, currentPage);
																										                                                            for (Material d1 : dfs) {
																										                                                                out.println("<tr class=\"listinfo\">");
																										                                                                out.println("<td style=\"width:560px;text-indent:0px\" >");
																										                                                                out.println("<img src=\"" + basePath + "img/titleleft.jpg\"/>");
																										                                                                out.println("<a href=\"" +basePath +"evafile/" + Global.MYEVA_STRING + "/" + d1.getMaterialurl() + "\" target=\"_blank\"><b>" + d1.getMaterialname() + "</b></a>");
																										                                                                out.println("</td>");
																										                                                                out.println("<td align=\"right\" >");
																										                                                                out.println("</td>");
																										                                                                out.println("</tr>");
																										                                                            }
																										                                                        } 
																										                                                  } else if(currentConType.equals(Global.T_TISSUE)){//组织机构
																										                                                    if(currentMenue.equals(Global.L_TISSUE1)){
																										                                                      out.println("<tr>");
																										                                                      out.println("<td align=\"center\">");
																										                                                      out.println("<img src=\"" + basePath + "evafile/" + Global.TISSUE_STRING + "/" + t1.getTissueimg() +"\" alt=\""+t1.getTissuetitle() +"\"/>");
																										                                                      out.println("</td>");
																										                                                            out.println("</tr>");
																										                                                    }else if(currentMenue.equals(Global.L_TISSUE2)){
																										                                                      out.println("<tr>");
																										                                                      out.println("<td align=\"center\">");
																										                                                      out.println("<img src=\"" + basePath + "evafile/" + Global.TISSUE_STRING + "/" + t2.getTissueimg() +"\" alt=\""+t2.getTissuetitle() +"\"/>");
																										                                                      out.println("</td>");
																										                                                            out.println("</tr>");
																										                                                    }else if(currentMenue.equals(Global.L_TISSUE3)){
																										                                                      out.println("<tr>");
																										                                                      out.println("<td align=\"center\">");
																										                                                      out.println("<img src=\"" + basePath + "evafile/" + Global.TISSUE_STRING + "/" + t3.getTissueimg() +"\" alt=\""+t3.getTissuetitle() +"\"/>");
																										                                                      out.println("</td>");
																										                                                            out.println("</tr>");
																										                                                    }
																										                                                  }
					%>
					<tr>
						<td align="right"></td>
					</tr>
				</table>
				</p>
				<div id="leader" class="easyui-pagination"
					data-options="total:<%=totalnum%>,
                                     pageSize:<%=NUMINPAGE%>,
                                     pageNumber:<%=currentPage%>,
                                     layout:['sep','first','prev','links','next','last','sep']
                                     "></div>
				<%
						                        //分页导航的链接
						                        String gopath = basePath + "content/content.jsp?type=l&c=" + currentConType + "&m=" + currentMenue + "&p=";
						                    %>
						                    <script>
						                        $('#leader').pagination({
						                            onSelectPage: function(pageNumber, pageSize) {
						                                $(this).pagination('loading');
						                                window.location.href = '<%=gopath%>' + pageNumber;
						                                $(this).pagination('loaded');
						                            }
						                        });
						                    </script>

			</div>
			<div id="mian_mian_right">
				<div id="title_mian1_znz222">
					<div class="title">
						<div class="title_title">站点导航</div>
					</div>
					<div id="ttt">
						<%
							if (currentConType.equals(Global.T_NEWS)) {//新闻
																				out.println("<ul>");
																				out.println("<li>");
																				out.println("<img src=\"" + basePath
																						+ "img/leftleader/ico.gif\"/>");
																				out.println("<a href=\"" + basePath
																						+ "content/content.jsp?type=l&c=" + currentConType
																						+ "&m=" + currentMenue + "&p=1\">新闻动态</a>");
																				out.println("</li>");
																				out.println("</ul>");
																			} else if (currentConType.equals(Global.T_NOTICE)) {//通知
																				out.println("<ul>");
																				out.println("<li>");
																				out.println("<img src=\"" + basePath
																						+ "img/leftleader/ico.gif\"/>");
																				out.println("<a href=\"" + basePath
																						+ "content/content.jsp?type=l&c=" + currentConType
																						+ "&m=" + Global.L_NOTICE1 + "&p=1\">工作通知</a>");
																				out.println("<div style=\"width:100%; height:2px; border-top:1px solid #999; clear:both;\"></div>");
																				out.println("</li>");

																				out.println("<li>");
																				out.println("<img src=\"" + basePath
																						+ "img/leftleader/ico.gif\"/>");
																				out.println("<a href=\"" + basePath
																						+ "content/content.jsp?type=l&c=" + currentConType
																						+ "&m=" + Global.L_NOTICE2 + "&p=1\">会议通知</a>");
																				out.println("</li>");
																				out.println("</ul>");
																			} else if (currentConType.equals(Global.T_POLICY)) {//政策精神
																				out.println("<ul>");
																				out.println("<li>");
																				out.println("<img src=\"" + basePath
																						+ "img/leftleader/ico.gif\"/>");
																				out.println("<a href=\"" + basePath
																						+ "content/content.jsp?type=l&c=" + currentConType
																						+ "&m=" + currentMenue + "&p=1\">政策精神</a>");
																				out.println("</li>");
																				out.println("</ul>");
																			} else if (currentConType.equals(Global.T_QUA)) {//质量报告
																				out.println("<ul>");
																				out.println("<li>");
																				out.println("<img src=\"" + basePath
																						+ "img/leftleader/ico.gif\"/>");
																				out.println("<a href=\"" + basePath
																						+ "content/content.jsp?type=l&c=" + currentConType
																						+ "&m=" + Global.L_QUA + "&p=1\">本科教学质量报告</a>");
																				out.println("</li>");
																				
																				out.println("<li>");
																				out.println("<img src=\"" + basePath
																						+ "img/leftleader/ico.gif\"/>");
																				out.println("<a href=\"" + basePath
																						+ "content/content.jsp?type=l&c=" + currentConType
																						+ "&m=" + Global.L_QUA1 + "&p=1\">就业质量年度报告</a>");
																				out.println("</li>");
																				
																				out.println("<li>");
																				out.println("<img src=\"" + basePath
																						+ "img/leftleader/ico.gif\"/>");
																				out.println("<a href=\"" + basePath
																						+ "content/content.jsp?type=l&c=" + currentConType
																						+ "&m=" + Global.L_QUA2 + "&p=1\">艺术教育年度报告</a>");
																				out.println("</li>");
																				out.println("</ul>");
																			} else if (currentConType.equals(Global.T_SC_F)) {//学校文件
																				out.println("<ul>");
																				out.println("<li>");
																				out.println("<img src=\"" + basePath
																						+ "img/leftleader/ico.gif\"/>");
																				out.println("<a href=\"" + basePath
																						+ "content/content.jsp?type=l&c=" + currentConType
																						+ "&m=" + currentMenue + "&p=1\">学校文件</a>");

																				out.println("</li>");
																				out.println("</ul>");
																			} else if (currentConType.equals(Global.T_EVA)) {//专业评估
																				out.println("<ul>");
																				out.println("<li>");
																				out.println("<img src=\"" + basePath
																						+ "img/leftleader/ico.gif\"/>");
																				out.println("<a href=\"" + basePath
																						+ "content/content.jsp?type=l&c=" + currentConType
																						+ "&m=" + currentMenue + "&p=1\">专业评估</a>");
																				out.println("</li>");
																				out.println("</ul>");
																			} else if (currentConType.equals(Global.T_BULLETIN)) {//评估简报
																				out.println("<ul>");
																				out.println("<li>");
																				out.println("<img src=\"" + basePath
																						+ "img/leftleader/ico.gif\"/>");
																				out.println("<a href=\"" + basePath
																						+ "content/content.jsp?type=l&c=" + currentConType
																						+ "&m=" + currentMenue + "&p=1\">评估简报</a>");
																				out.println("</li>");
																				out.println("</ul>");
																			} else if (currentConType.equals(Global.T_MYEVA)) {//自评报告
																				out.println("<ul>");
																				out.println("<li>");
																				out.println("<img src=\"" + basePath
																						+ "img/leftleader/ico.gif\"/>");
																				out.println("<a href=\"" + basePath
																						+ "content/content.jsp?type=l&c=" + currentConType
																						+ "&m=" + currentMenue + "&p=1\">自评报告</a>");
																				out.println("</li>");
																				out.println("</ul>");
																			} else if (currentConType.equals(Global.T_WORK)) {//专家工作
																				out.println("<ul>");
																				out.println("<li>");
																				out.println("<img src=\"" + basePath
																						+ "img/leftleader/ico.gif\"/>");
																				out.println("<a href=\"" + basePath
																						+ "content/content.jsp?type=l&c=" + currentConType
																						+ "&m=" + currentMenue + "&p=1\">专家工作</a>");
																				out.println("</li>");
																				out.println("</ul>");
																			} else if (currentConType.equals(Global.T_DATASYSTEM)) {//教学基本状态数据库
																				out.println("<ul>");
																				out.println("<li>");
																				out.println("<img src=\"" + basePath
																						+ "img/leftleader/ico.gif\"/>");
																				out.println("<a href=\"" + basePath
																						+ "content/content.jsp?type=l&c=" + currentConType
																						+ "&m=" + currentMenue + "&p=1\">教学基本状态数据库</a>");
																				out.println("</li>");
																				out.println("</ul>");
																			} else if (currentConType.equals(Global.T_DOWNFILE)) {//文件下载
																				out.println("<ul>");
																				out.println("<li>");
																				out.println("<img src=\"" + basePath
																						+ "img/leftleader/ico.gif\"/>");
																				out.println("<a href=\"" + basePath
																						+ "content/content.jsp?type=l&c=" + currentConType
																						+ "&m=" + currentMenue + "&p=1\">下载专区</a>");
																				out.println("</li>");
																				out.println("</ul>");
																			} else if (currentConType.equals(Global.T_MATERIAL)) {//支撑材料
																				out.println("<ul>");
																				out.println("<li>");
																				out.println("<img src=\"" + basePath
																						+ "img/leftleader/ico.gif\"/>");
																				out.println("<a href=\"" + basePath
																						+ "content/content.jsp?type=l&c=" + currentConType
																						+ "&m=" + currentMenue + "&p=1\">支撑材料</a>");
																				out.println("</li>");
																				out.println("</ul>");
																			} else if (currentConType.equals(Global.T_TISSUE)) {//组织机构
																				out.println("<ul>");
																				out.println("<li >");
																				out.println("<img src=\"" + basePath
																						+ "img/leftleader/ico.gif\"/>");
																				out.println("<a href=\"" + basePath
																						+ "content/content.jsp?type=c&c=" + currentConType
																						+ "&m=" + Global.L_TISSUE1 + "&id=1\">"
																						+ t1.getTissuetitle() + "</a>");

																				out.println("</li>");

																				out.println("<li>");
																				out.println("<img src=\"" + basePath
																						+ "img/leftleader/ico.gif\"/>");
																				out.println("<a href=\"" + basePath
																						+ "content/content.jsp?type=c&c=" + currentConType
																						+ "&m=" + Global.L_TISSUE2 + "&id=1\">"
																						+ t2.getTissuetitle() + "</a>");

																				out.println("</li>");

																				out.println("<li>");
																				out.println("<img src=\"" + basePath
																						+ "img/leftleader/ico.gif\"/>");
																				out.println("<a href=\"" + basePath
																						+ "content/content.jsp?type=c&c=" + currentConType
																						+ "&m=" + Global.L_TISSUE3 + "&id=1\">"
																						+ t3.getTissuetitle() + "</a>");

																				out.println("</li>");
																				out.println("<ul>");
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
								<a
									href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_NOTICE);%>&m=<%out.println(Global.L_NOTICE2);%>&p=1"><img
									src="img/bar.gif" alt="more" /></a>
							</div>
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
