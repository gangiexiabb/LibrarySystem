<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br/>
			<p align="center"><font size="7" face="å¹¼å">æ¥çå¾ä¹¦</font><br></p>
		<br/>
			<table id="t" align="center" width="1000" height="600" cellspacing="0" border="1">
	        <td colspan="2" valign="top">
			<table class="table table-striped table-hover table-bordered"
				width="800" height="350" align="center" cellspacing="0" border="1">
				<br>
				<div class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><font
						size="4">é«çº§æç´¢</font><span class="caret"></span></a>
					<div class="col-md-1 "></div>
					<ul class="dropdown-menu dropdown-menu-left" role="menu">
						<li>
							<form action="BookServlet" class="form-horizontal">
								<!-- éèåï¼ç¨æ¥ä¼ éaction -->
								<input type="hidden" name="action" value="showBookByWhere">
								<div class="control-group">
									<br> <label class="col-md-4">éæ©åç±»ï¼ </label>
									<div class="col-sm-7 ">
										<select name="fname" id="fenleiList" class="form-control" >
											<option value="0">--è¯·éæ©åç±»--</option>
											<c:forEach items="${list }" var="b">
									        <option>${b.fname}</option>
								            </c:forEach>
										</select><br>
									</div>
								</div>
								<div class="control-group  ">
									<label class="col-sm-4  control-label  ">ä¹¦å:</label>
									<div class="controls col-sm-6 ">
										<input name="name" type="text" class="form-control" /><br>
									</div>
								</div>

								<div class="control-group   ">
									<label class="col-sm-4 control-label  "> åºçç¤¾:</label>
									<div class="controls  col-sm-6">
										<input name="chuban" type="text" class="form-control  input-sm" /><br>
									</div>
								</div>

								<div class="control-group   ">
									<label class="col-sm-4 control-label ">åä¹¦äºº:</label>
									<div class="controls  col-sm-6">
										<input name="jieshuren" type="text" class="form-control  input-sm" /><br>
									</div>
								</div>

								<div class="control-group    ">
									<label class="control-label col-sm-4 "> ç¶æ:</label>
									<div class="controls  col-sm-6">
										<input name="zhuangtai" type="text" class="form-control  input-sm" /><br>
									</div>
								</div>

								<div class="control-group  ">
									<label class="col-sm-4 "></label>
									<div class="controls ss">
										<button type="submit" class="btn   btn-info ">
											<span class="glyphicon glyphicon-search"></span> å¼å§æç´¢
										</button>
									</div>
								</div>
							</form>
						</li>
					</ul>
				</div>
				<tr align="center">
					<td>å¾ä¹¦ç¼å·</td>
					<td>åç±»åç§°</td>
					<td>å¾ä¹¦åç§°</td>
					<td>å¾ä¹¦ä»·æ ¼</td>
					<td>å¾ä¹¦åºçç¤¾</td>
					<td>ç¶æ</td>
					<td>åä¹¦äºº</td>
					<td>å é¤</td>
					<td>ä¿®æ¹</td>
				</tr>

				<c:forEach items="${pb.beanList}" var="b" varStatus="s">
					<tr align="center">
						<td>${s.index+1 }</td>
						<td>${b.fname}</td>
						<td>${b.name }</td>
						<td>${b.price}</td>
						<td>${b.chuban}</td>
						<td>${b.zhuangtai }</td>
						<td>${b.jieshuren }</td>
						<td><input type="checkbox" name="ids" value="${b.id}" /></td>
						<td><a href="BookServlet?action=showOne&id=${b.id}" />ä¿®æ¹</a></td>
					</tr>
				</c:forEach>
				<tr align="center">

					<td colspan="9"><button id="selectAll"
							class="btn btn-success btn-sm">å¨é</button>
						<button id="noSelectAll" class="btn btn-success btn-sm">å¨ä¸é</button>
						<button id="fanxuan" class="btn btn-success btn-sm">åé</button>
						<button id="deleteBook" class="btn btn-success btn-sm">å é¤</button></td>
				</tr>
			</table>
			</td> <br> <br>
			<center>
				ç¬¬${pb.pageNow}é¡µ/å±${pb.pages}é¡µ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				<ul class="pagination">
					<li><a href="${pb.url}&pageNow=1">é¦é¡µ</a></li>
					&nbsp; &nbsp;
					<c:if test="${pb.pageNow>1 }">
						<li><a
							href="${pb.url}&pageNow=${pb.pageNow-1 }">ä¸ä¸é¡µ</a></li>
					</c:if>
					&nbsp; &nbsp;
					<!-- åä¸¤ç§æåµï¼
		         å¦æé¡µæ°å°äº10ï¼
		         å¦æé¡µæ°å¤§äº10ï¼         
		        -->
					<c:choose>
						<c:when test="${pb.pages<=10 }">
							<c:set var="begin" value="1"></c:set>
							<c:set var="end" value="${pb.pages }"></c:set>
						</c:when>
						<c:otherwise>
							<c:set var="begin" value="${pb.pageNow-5 }"></c:set>
							<c:set var="end" value="${pb.pageNow+4 }"></c:set>
							<c:if test="${begin<=1 }">
								<c:set var="begin" value="1"></c:set>
								<c:set var="end" value="10"></c:set>
							</c:if>
							<c:if test="${end>=pb.pages }">
								<c:set var="begin" value="${pb.pages-9 }"></c:set>
								<c:set var="end" value="${pb.pages }"></c:set>
							</c:if>
						</c:otherwise>
					</c:choose>
					<!-- å¾ªç¯åä¸ªæ° -->
					<c:forEach begin="${begin }" end="${end }" var="i">
						<c:choose>
							<c:when test="${pb.pageNow==i }">
								<li class="active"><span>${i}</span></li>
							</c:when>
							<c:otherwise>
								<li><a
									href="${pb.url}&pageNow=${i }">${i }</a></li>
							</c:otherwise>
						</c:choose>

					</c:forEach>
					&nbsp;

					<c:if test="${pb.pageNow<pb.pages }">
						<a
							href="${pb.url}&pageNow=${pb.pageNow+1 }">ä¸ä¸é¡µ</a>
					</c:if>
					&nbsp; &nbsp;
					<li><a
						href="${pb.url}&pageNow=${pb.pages}">å°¾é¡µ</a></li>
				</ul>
			</center>
			<p>
			<table align="center">
				<tr align="center">
					<br>
					<td><font size="4" color="#4682B4">æ²¡ææ¨æ³è¦çå¾ä¹¦ï¼æ¨å¯ä»¥ç¹å»è¿é</font><a
						href="addBook.jsp" class="btn btn-primary btn-sm">æ·»å åç±»</a></td>
				</tr>
			</table>
	</table>

</body>
</html>