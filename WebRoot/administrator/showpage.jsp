<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.dlpu.eva.service.*"%>
<%@ page import="com.dlpu.eva.global.*"%>
<%@ page import="com.dlpu.eva.common.*"%>
<%@ page import="hibernate.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>mangae</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/mycss/showpage.css">
<script language="javascript" src="<%=basePath%>js/tool/suredel.js"></script>
<!-- jquery easyui -->
<link rel="Stylesheet" type="text/css"
	href="<%=basePath%>jquery-easyui-1.4/themes/icon.css" />
<link rel="Stylesheet" type="text/css"
	href="<%=basePath%>jquery-easyui-1.4/themes/default/easyui.css" />
<script type="text/javascript"
	src="<%=basePath%>jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>jquery-easyui-1.4/jquery.easyui.min.js"></script>
<!-- jquery easyui End -->

</head>

<body>
	<%
		Object adminuser = session.getAttribute("adminuser");
		if (adminuser == null) {//防止非法入侵
			response.sendRedirect(basePath + "index.jsp");
			return;
		}

		final int NUMINPAGE = 10;//每页的条目数
		int currentPage = 1;//默认当前为第一页
		int totalnum = 0;//一个类型的内容总条目数
		int totalpage = 1;//文章列表的最大页数

		//声明所有的Service类
		NewsService ns = new NewsService();
		NoticeService nos = new NoticeService();
		PolicyService ps = new PolicyService();
		QualityService qs = new QualityService();
		SchoolfileService ss = new SchoolfileService();
		EvaService es = new EvaService();
		BulletinService bs = new BulletinService();
		MyevaService ms = new MyevaService();
		WorkService ws = new WorkService();
		DatasystemService ds = new DatasystemService();
		DownfileService dfs = new DownfileService();
		MaterialService mas = new MaterialService();
		

		//判断查询类型
		String type = request.getParameter("type");
		if (type == null) {//盗链、攻击
			response.sendRedirect(basePath + "index.jsp");
			return;
		} else if (type.equals("")) {//盗链、攻击、未知错误
			response.sendRedirect(basePath + "index.jsp");
			return;
		}
		String getPage = request.getParameter("p");
		if (getPage == null) {//页面参数缺失则默认跳转到第一页
			response.sendRedirect("showpage.jsp?type=" + type + "&p=1");
			return;
		} else {//检查页数是否正确
			if (Integer.parseInt(getPage) <= 0) {//页数过小则跳转到第一页
				response.sendRedirect("showpage.jsp?type=" + type + "&p=1");
				return;
			} else {//检查页数是否超过最大数值
				if (type.equals(Global.T_NEWS)) {//获取新闻的条目数
					totalnum = ns.GetNewsNum();//新闻的总数
				} else if (type.equals(Global.L_NOTICE1)) {//获取工作通知数目
					totalnum = nos.GetNoticeNum(1);
				} else if (type.equals(Global.L_NOTICE2)) {//获取会议通知数目
					totalnum = nos.GetNoticeNum(2);
				} else if (type.equals(Global.L_POLICY)) {//获取政策精神数目
					totalnum = ps.GetPolicyNum();
				} else if(type.equals(Global.L_QUA)){  //质量报告数目
        			totalnum = qs.GetQuaNum();
        	    } else if (type.equals(Global.L_SC_F)) {//学校文件
					totalnum = ss.GetSchoolfileNum();
				}  else if (type.equals(Global.L_EVA)) {//专业评估
					totalnum = es.GetEvaNum();
				}  else if (type.equals(Global.L_EVA)) {//评估简报
					totalnum = bs.GetBulletinNum();
				}  else if (type.equals(Global.L_MYEVA)) {//自评报告
					totalnum = ms.GetMyevaNum();
				}  else if (type.equals(Global.L_WORK)) {//专家工作
					totalnum = ws.GetWorkNum();
				}  else if (type.equals(Global.L_DATASYSTEM)) {//教学基本状态数据库
					totalnum = ds.GetDatasystemNum();
				}  else if (type.equals(Global.L_DOWNFILE)) {//文件下载
					totalnum = dfs.GetDownfileNum();
				}  else if (type.equals(Global.L_MATERIAL)) {//支撑材料
					totalnum = mas.GetMaterialNum();
				}  

				totalpage = 0;//总共的页数
				if (totalnum % NUMINPAGE == 0) {
					totalpage = totalnum / NUMINPAGE;
				} else {
					totalpage = totalnum / NUMINPAGE + 1;
				}
				if (totalpage <= 0) {
					totalpage = 1;
				}
				if (Integer.parseInt(getPage) > totalpage) {//超出了最大页数
					response.sendRedirect("showpage.jsp?type=" + type + "&p=" + totalpage);//跳转到最后一页
					return;
				}
				currentPage = Integer.parseInt(getPage);
			}
		}
	%>
	<!-- 显示新闻列表 -->
	<table border="0" width="80%" align="center" cellpadding="0"
		cellspacing="0" bgcolor="#FFFFFF" class="table table-hover">
		<tr>
			<td align="center" colspan="2">
				<%
                        if (type.equals(Global.T_NEWS)) {
                            out.println("新闻列表");
                        } else if (type.equals(Global.L_NOTICE1)) {
                            out.println("工作通知列表");
                        } else if (type.equals(Global.L_NOTICE2)) {
                            out.println("会议通知列表");
                        } else if (type.equals(Global.L_POLICY)) {
                            out.println("政策精神列表");
                        } else if (type.equals(Global.L_QUA)) {//质量报告
                            out.println("质量报告列表");
                        } else if (type.equals(Global.L_SC_F)) {
                            out.println("学校文件列表");
                        } else if (type.equals(Global.L_EVA)) {
                            out.println("专业评估列表");
                        } else if (type.equals(Global.L_EVA)) {
                            out.println("评估简报列表");
                        } else if (type.equals(Global.L_MYEVA)) {
                            out.println("自评报告列表");
                        } else if (type.equals(Global.L_WORK)) {
                            out.println("专家工作列表");
                        } else if (type.equals(Global.L_DATASYSTEM)) {
                            out.println("教学基本状态数据库");
                        } else if (type.equals(Global.L_DOWNFILE)) {
                            out.println("文件下载");
                        } else if (type.equals(Global.L_MATERIAL)) {
                            out.println("支撑材料");
                        } 
                    %>
			</td>
			<td align="right">
				<%
                        if (type.equals(Global.T_NEWS)) {//新闻
                            out.println("<a href=\"" + basePath + "administrator/upload/newsupload.jsp?type=n\" class=\"btn btn-primary\">发布新闻</a>");
                        } else if (type.equals(Global.L_NOTICE1)) {
                            out.println("<a href=\"" + basePath + "administrator/upload/noticeupload.jsp?type=n&t=1&e=1\" class=\"btn btn-primary\">发布工作通知</a>");
                        } else if (type.equals(Global.L_NOTICE2)) {
                            out.println("<a href=\"" + basePath + "administrator/upload/noticeupload.jsp?type=n&t=2&e=1\" class=\"btn btn-primary\">发布会议通知</a>");
                        } else if (type.equals(Global.L_POLICY)) {
                            out.println("<a href=\"" + basePath + "administrator/upload/policyupload.jsp?type=n\" class=\"btn btn-primary\">发布政策精神</a>");
                        } else if (type.equals(Global.L_QUA)) {//质量报告
                            out.println("<a href=\"" + basePath + "administrator/upload/qualityupload.jsp?type=n\" class=\"btn btn-primary\">发布质量报告</a>");
                        } else if (type.equals(Global.L_SC_F)) {
                            out.println("<a href=\"" + basePath + "administrator/upload/schoolfileupload.jsp?type=n\" class=\"btn btn-primary\">发布学校文件</a>");
                        } else if (type.equals(Global.L_EVA)) {
                            out.println("<a href=\"" + basePath + "administrator/upload/evaupload.jsp?type=n\" class=\"btn btn-primary\">发布专业评估</a>");
                        } else if (type.equals(Global.L_BULLETIN)) {
                            out.println("<a href=\"" + basePath + "administrator/upload/bulletinupload.jsp?type=n\" class=\"btn btn-primary\">发布评估简报</a>");
                        } else if (type.equals(Global.L_MYEVA)) {
                            out.println("<a href=\"" + basePath + "administrator/upload/myevaupload.jsp?type=n\" class=\"btn btn-primary\">发布自评报告</a>");
                        } else if (type.equals(Global.L_WORK)) {
                            out.println("<a href=\"" + basePath + "administrator/upload/workupload.jsp?type=n\" class=\"btn btn-primary\">发布专家工作</a>");
                        } else if (type.equals(Global.L_DATASYSTEM)) {
                            out.println("<a href=\"" + basePath + "administrator/upload/datasystemupload.jsp?type=n\" class=\"btn btn-primary\">添加一条连接</a>");
                        } else if (type.equals(Global.L_DOWNFILE)) {
                            out.println("<a href=\"" + basePath + "administrator/upload/downfileupload.jsp?type=n\" class=\"btn btn-primary\">添加一个文件</a>");
                        } else if (type.equals(Global.L_MATERIAL)) {
                            out.println("<a href=\"" + basePath + "administrator/upload/materialupload.jsp?type=n\" class=\"btn btn-primary\">添加一个材料</a>");
                        } 
                    %>
			</td>
		</tr>
		<%
            	if (type.equals(Global.T_NEWS)) {//新闻
                    ArrayList<NewsTitle> nta = ns.GetNewsTitle(NUMINPAGE, currentPage);
                    for (NewsTitle nt : nta) {
                       	out.println("<tr>");
                       	out.println("<td width=\"80%\">");
                       	out.println("<b style=\"font-size:14px;\"><a href=\"" + basePath + "content/content.jsp?type=c&c=" + Global.T_NEWS + "&m=" + Global.T_NEWS + "&id=" + nt.getNewsid() + "\" target=\"_blank\">" + nt.getNewstitle() + "</a></b>&nbsp;&nbsp;<i style=\"font-size:10px;\">" + nt.getNewstime() + "</i>");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "administrator/upload/newsupload.jsp?type=c&id=" + nt.getNewsid() + "\" class=\"btn btn-warning\" >修改</a>");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "del.do?type=" + Global.T_NEWS + "&id=" + nt.getNewsid() + "\" class=\"btn btn-danger\" onclick=\"javascript:p_del();\">删除</a>");
            			out.println("</td>");
            			out.println("</tr>");
            		}
            	}else if(type.equals(Global.L_NOTICE1)){//工作通知
            		ArrayList<NoticeTitle> nta = nos.GetNoticeTitles(NUMINPAGE, currentPage, 1);
                    for (NoticeTitle nt : nta) {
                       	out.println("<tr>");
                       	out.println("<td width=\"80%\">");
                       	out.println("<b style=\"font-size:14px;\"><a href=\"" + basePath + "content/content.jsp?type=c&c=" + Global.T_NOTICE + "&m=" + Global.L_NOTICE1 + "&id=" + nt.getNoticeid() + "\" target=\"_blank\">" + nt.getNoticetitle() + "</a></b>&nbsp;&nbsp;<i style=\"font-size:10px;\">" + nt.getNoticetime() + "</i>");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "administrator/upload/noticeupload.jsp?type=c&id=" + nt.getNoticeid() + "&e=1\" class=\"btn btn-warning\" >修改</a>");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "del.do?type=" + Global.T_NOTICE + "&id=" + nt.getNoticeid() + "\" class=\"btn btn-danger\" onclick=\"javascript:p_del();\">删除</a>");
            			out.println("</td>");
            			out.println("</tr>");
            		}
            	}else if(type.equals(Global.L_NOTICE2)){//会议通知
            		ArrayList<NoticeTitle> nta = nos.GetNoticeTitles(NUMINPAGE, currentPage, 2);
                    for (NoticeTitle nt : nta) {
                       	out.println("<tr>");
                       	out.println("<td width=\"80%\">");
                       	out.println("<b style=\"font-size:14px;\"><a href=\"" + basePath + "content/content.jsp?type=c&c=" + Global.T_NOTICE + "&m=" + Global.L_NOTICE2 + "&id=" + nt.getNoticeid() + "\" target=\"_blank\">" + nt.getNoticetitle() + "</a></b>&nbsp;&nbsp;<i style=\"font-size:10px;\">" + nt.getNoticetime() + "</i>");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "administrator/upload/noticeupload.jsp?type=c&id=" + nt.getNoticeid() + "&e=1\" class=\"btn btn-warning\" >修改</a>");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "del.do?type=" + Global.T_NOTICE + "&id=" + nt.getNoticeid() + "\" class=\"btn btn-danger\" onclick=\"javascript:p_del();\">删除</a>");
            			out.println("</td>");
            			out.println("</tr>");
            		}
            	}else if(type.equals(Global.L_POLICY)){//政策精神
            		ArrayList<PolicyTitle> pts = ps.GetPolicyTitle(NUMINPAGE, currentPage);
                    for (PolicyTitle pt : pts) {
                       	out.println("<tr>");
                       	out.println("<td width=\"80%\">");
                       	out.println("<b style=\"font-size:14px;\"><a href=\"" + basePath + "content/content.jsp?type=c&c=" + Global.T_POLICY + "&m=" + Global.L_POLICY + "&id=" + pt.getPolicyId() + "\" target=\"_blank\">" + pt.getPolicyTitle() + "</a></b>&nbsp;&nbsp;<i style=\"font-size:10px;\">" + pt.getPolicyTime() + "</i>");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "administrator/upload/policyupload.jsp?type=c&id=" + pt.getPolicyId() + "\" class=\"btn btn-warning\" >修改</a>");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "del.do?type=" + Global.T_POLICY+ "&id=" + pt.getPolicyId() + "\" class=\"btn btn-danger\" onclick=\"javascript:p_del();\">删除</a>");
            			out.println("</td>");
            			out.println("</tr>");
            		}
            	}else if(type.equals(Global.L_QUA)){//质量报告
            		ArrayList<QualityTitle> qts = qs.getQualityTitles(NUMINPAGE, currentPage);
                    for (QualityTitle qt : qts) {
                       	out.println("<tr>");
                       	out.println("<td width=\"80%\">");
                       	out.println("<b style=\"font-size:14px;\"><a href=\"" + basePath + "content/content.jsp?type=c&c=" + Global.T_QUA + "&m=" + Global.L_QUA + "&id=" + qt.getQuaid() + "\" target=\"_blank\">" + qt.getQuatitle() + "</a></b>&nbsp;&nbsp;<i style=\"font-size:10px;\">" + qt.getQuadate() + "</i>");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "administrator/upload/qualityupload.jsp?type=c&id=" + qt.getQuaid() + "\" class=\"btn btn-warning\" >修改</a>");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "del.do?type=" + Global.T_QUA+ "&id=" + qt.getQuaid() + "\" class=\"btn btn-danger\" onclick=\"javascript:p_del();\">删除</a>");
            			out.println("</td>");
            			out.println("</tr>");
            		}													                                                            
            	}else if(type.equals(Global.L_SC_F)){//学校文件
            		ArrayList<SchoolFIleTitle> sfits = ss.getSchoolfileTitles(NUMINPAGE, currentPage);
                    for (SchoolFIleTitle sfit : sfits) {
                       	out.println("<tr>");
                       	out.println("<td width=\"80%\">");
                       	out.println("<b style=\"font-size:14px;\"><a href=\"" + basePath + "content/contento.jsp?type=c&c=" + Global.T_SC_F + "&m=" + Global.L_SC_F + "&id=" + sfit.getSchoolfileid() + "\" target=\"_blank\">" + sfit.getSchoolfiletitle()+ "</a></b>&nbsp;&nbsp;<i style=\"font-size:10px;\">" + sfit.getSchoolfiletime() + "</i>");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "administrator/upload/schoolfileupload.jsp?type=c&id=" + sfit.getSchoolfileid() + "\" class=\"btn btn-warning\" >修改</a>");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "del.do?type=" + Global.T_SC_F+ "&id=" + sfit.getSchoolfileid() + "\" class=\"btn btn-danger\" onclick=\"javascript:p_del();\">删除</a>");
            			out.println("</td>");
            			out.println("</tr>");
            		}
            	} else if(type.equals(Global.L_EVA)){//专业评估
            		ArrayList<EvaTitle> ets = es.getEvaTitles(NUMINPAGE, currentPage);
                    for (EvaTitle et : ets) {
                       	out.println("<tr>");
                       	out.println("<td width=\"80%\">");
                       	out.println("<b style=\"font-size:14px;\"><a href=\"" + basePath + "content/content.jsp?type=c&c=" + Global.T_EVA + "&m=" + Global.L_EVA + "&id=" + et.getEvaid() + "\" target=\"_blank\">" + et.getEvatitle()+ "</a></b>&nbsp;&nbsp;<i style=\"font-size:10px;\">" + et.getEvadate() + "</i>");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "administrator/upload/evaupload.jsp?type=c&id=" + et.getEvaid() + "\" class=\"btn btn-warning\" >修改</a>");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "del.do?type=" + Global.T_EVA+ "&id=" + et.getEvaid() + "\" class=\"btn btn-danger\" onclick=\"javascript:p_del();\">删除</a>");
            			out.println("</td>");
            			out.println("</tr>");
            		}
            	} else if(type.equals(Global.L_BULLETIN)){//评估简报
            		ArrayList<BulletinTitle> bts = bs.getBulletinTitles(NUMINPAGE, currentPage);
                    for (BulletinTitle bt : bts) {
                       	out.println("<tr>");
                       	out.println("<td width=\"80%\">");
                       	out.println("<b style=\"font-size:14px;\"><a href=\"" + basePath + "content/content.jsp?type=c&c=" + Global.T_BULLETIN + "&m=" + Global.L_BULLETIN + "&id=" + bt.getBulletinid() + "\" target=\"_blank\">" + bt.getBulletintitle() + "</a></b>&nbsp;&nbsp;<i style=\"font-size:10px;\">" + bt.getBulletindate() + "</i>");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "administrator/upload/bulletinupload.jsp?type=c&id=" + bt.getBulletinid() + "\" class=\"btn btn-warning\" >修改</a>");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "del.do?type=" + Global.T_BULLETIN + "&id=" + bt.getBulletinid() + "\" class=\"btn btn-danger\" onclick=\"javascript:p_del();\">删除</a>");
            			out.println("</td>");
            			out.println("</tr>");
            		}
            	} else if(type.equals(Global.L_MYEVA)){//自评报告
            		ArrayList<MyevaTitle> mts = ms.getMyevaTitles(NUMINPAGE, currentPage);
                    for (MyevaTitle mt : mts) {
                       	out.println("<tr>");
                       	out.println("<td width=\"80%\">");
                       	out.println("<b style=\"font-size:14px;\"><a href=\"" + basePath + "content/content.jsp?type=c&c=" + Global.T_MYEVA + "&m=" + Global.L_MYEVA + "&id=" + mt.getMyevaid() + "\" target=\"_blank\">" + mt.getMyevatitle() + "</a></b>&nbsp;&nbsp;<i style=\"font-size:10px;\">" + mt.getMyevadate() + "</i>");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "administrator/upload/myevaupload.jsp?type=c&id=" + mt.getMyevaid() + "\" class=\"btn btn-warning\" >修改</a>");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "del.do?type=" + Global.T_MYEVA + "&id=" + mt.getMyevaid() + "\" class=\"btn btn-danger\" onclick=\"javascript:p_del();\">删除</a>");
            			out.println("</td>");
            			out.println("</tr>");
            		}
            	} else if(type.equals(Global.L_WORK)){//专家工作
            		ArrayList<WorkTitle> wts = ws.GetWorkTitle(NUMINPAGE, currentPage);
                    for (WorkTitle wt : wts) {
                       	out.println("<tr>");
                       	out.println("<td width=\"80%\">");
                       	out.println("<b style=\"font-size:14px;\"><a href=\"" + basePath + "content/content.jsp?type=c&c=" + Global.T_WORK + "&m=" + Global.L_WORK + "&id=" + wt.getWorkid() + "\" target=\"_blank\">" + wt.getWorktitle() + "</a></b>&nbsp;&nbsp;<i style=\"font-size:10px;\">" + wt.getWorkdate() + "</i>");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "administrator/upload/workupload.jsp?type=c&id=" + wt.getWorkid() + "\" class=\"btn btn-warning\" >修改</a>");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "del.do?type=" + Global.T_WORK + "&id=" + wt.getWorkid() + "\" class=\"btn btn-danger\" onclick=\"javascript:p_del();\">删除</a>");
            			out.println("</td>");
            			out.println("</tr>");
            		}
            	} else if(type.equals(Global.L_DATASYSTEM)){ //教学基本状态数据库
            		ArrayList<Datasystem> da = ds.GetDatasystem(NUMINPAGE, currentPage);
                    for (Datasystem d1 : da) {
                        out.println("<tr>");
                       	out.println("<td width=\"80%\">");
                       	out.println("<b style=\"font-size:14px;\"><a href=\"" + d1.getDataurl() + "\" target=\"_blank\">" + d1.getDatatitle() + "</a></b>&nbsp;&nbsp;");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "administrator/upload/datasystemupload.jsp?type=c&id=" + d1.getDataid() + "\" class=\"btn btn-warning\" >修改</a>");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "del.do?type=" + Global.T_DATASYSTEM + "&id=" + d1.getDataid() + "\" class=\"btn btn-danger\" onclick=\"javascript:p_del();\">删除</a>");
            			out.println("</td>");
            			out.println("</tr>");
                    }
            	} else if(type.equals(Global.L_DOWNFILE)){ //文件下载
            		ArrayList<Downfile> da = dfs.getDownfile(NUMINPAGE, currentPage);
                    for (Downfile d1 : da) {
                        out.println("<tr>");
                       	out.println("<td width=\"80%\">");
                       	out.println("<b style=\"font-size:14px;\"><a href=\"" + basePath + "evafile/" + Global.FILEDOWNLOAD_STRING + "/" + d1.getFileurl() + "\" target=\"_blank\">" + d1.getFilename() + "</a></b>&nbsp;&nbsp;");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "administrator/upload/downfileupload.jsp?type=c&id=" + d1.getFileid() + "\" class=\"btn btn-warning\" >修改</a>");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "del.do?type=" + Global.T_DOWNFILE + "&id=" + d1.getFileid() + "\" class=\"btn btn-danger\" onclick=\"javascript:p_del();\">删除</a>");
            			out.println("</td>");
            			out.println("</tr>");
                    }
            	} else if(type.equals(Global.L_MATERIAL)){ //支撑材料
            		ArrayList<Material> da = mas.getMaterial(NUMINPAGE, currentPage);
                    for (Material d1 : da) {
                        out.println("<tr>");
                       	out.println("<td width=\"80%\">");
                       	out.println("<b style=\"font-size:14px;\"><a href=\"" + basePath + "evafile/" + Global.MYEVA_STRING + "/" + d1.getMaterialurl() + "\" target=\"_blank\">" + d1.getMaterialname() + "</a></b>&nbsp;&nbsp;");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "administrator/upload/materialupload.jsp?type=c&id=" + d1.getMaterialid() + "\" class=\"btn btn-warning\" >修改</a>");
            			out.println("</td>");
            			out.println("<td align=\"right\" width=\"10%\">");
            			out.println("<a href=\"" + basePath + "del.do?type=" + Global.L_MATERIAL + "&id=" + d1.getMaterialid() + "\" class=\"btn btn-danger\" onclick=\"javascript:p_del();\">删除</a>");
            			out.println("</td>");
            			out.println("</tr>");
                    }
            	} 
            %>
		<tr>
			<td align="right" colspan="3">
				<div id="leader" class="easyui-pagination"
					data-options="
                         total:<%=totalnum%>,
                         pageSize:<%=NUMINPAGE%>,
                         pageNumber:<%=currentPage%>,
                         layout:['sep','first','prev','links','next','last','sep']
                         "></div>
				<%
                        String gopath = basePath + "administrator/showpage.jsp?type=news&p=";
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
			</td>
		</tr>
	</table>
</body>
</html>
