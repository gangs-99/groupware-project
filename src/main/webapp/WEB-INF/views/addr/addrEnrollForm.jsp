<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addr/addrEnrollForm.css">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param value="주소록" name="title"/>
	</jsp:include>

	<jsp:include page="/WEB-INF/views/addr/addrLeftBar.jsp" />


<div class="home-container">
	<!-- 상단 타이틀 -->
	<div class="top-container">
		<div class="container-title">연락처 추가</div>
		<div class="home-topbar topbar-div">
			<div>
				<a href="#" id="home-my-img">
					<c:if test="${!empty sessionScope.loginMember.attachment}">
						<img src="${pageContext.request.contextPath}/resources/upload/emp/${sessionScope.loginMember.attachment.renameFilename}" alt="" class="my-img">
					</c:if>
					<c:if test="${empty sessionScope.loginMember.attachment}">
						<img src="${pageContext.request.contextPath}/resources/images/default.png" alt="" class="my-img">
					</c:if>
				</a>
			</div>
			<div id="my-menu-modal">
				<div class="my-menu-div">
					<button class="my-menu" onclick="location.href = '${pageContext.request.contextPath }/emp/empInfo.do'">기본정보</button>
				</div>
				<div class="my-menu-div">
					<form:form action="${pageContext.request.contextPath}/emp/empLogout.do" method="POST">
						<button class="my-menu" type="submit">로그아웃</button>								
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<script>
	document.querySelector('#home-my-img').addEventListener('click', (e) => {
	const modal = document.querySelector('#my-menu-modal');
	const style =  modal.style.display;
	
		if (style == 'inline-block') {
				modal.style.display = 'none';
			} else {
				modal.style.display = 'inline-block';
				}
			});
	</script>

	<!-- 상단 타이틀 end -->

			<!-- 본문 -->
			<div class="div-padding"></div>
			
			<div class="content">
				<div id="addrInfo">
				<form name="addrEnrollFrm"
                            action="${pageContext.request.contextPath}/addr/addrEnroll.do?${_csrf.parameterName}=${_csrf.token}" method="post"
                            enctype="multipart/form-data">
                            <table id="addr-enroll-table">
                                <tr>
                                    <th></th>
                                    <td>
                                        <div id="profile-box" style="display:none">
                                            <img id="preview" src="#" style="max-width:150px; max-height:150px;">
                                            <label for="upfile"><i class="fa-solid fa-magnifying-glass" style="padding-top:7px;"></i></label>
                                            <input type="file" id="upFile" name="upFile" accept="image/*" onchange="previewImage(event)">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>주소록 지정</th>
                                    <td>
                                        <select name="groupName" id="groupName">
											<c:forEach var="groupName" items="${groupNames}">
										     	<option value="${groupName}">${groupName}</option>
										    </c:forEach>
										</select>
										<input type="hidden" name="groupType" value="P" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="hidden" name="writer" id="writer" value="${loginMember.empId}" required>
                                    </td>
                                </tr>
                                <tr>
                                    <th>이름</th>
                                    <td>
                                        <input type="text" name="name" id="name" required>
                                    </td>
                                </tr>
                                <tr>
                                    <th>회사</th>
                                    <td>
                                        <input type="text" name="company" id="company" required />
                                    </td>
                                </tr>
                                <tr>
                                    <th>부서</th>
                                    <td>
                                        <input type="text" name="deptTitle" id="deptTitle" required />
                                    </td>
                                </tr>
                                <tr>
                                    <th>직위</th>
                                    <td>
                                        <input type="text" name="jobName" id="jobName" required />
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td>
                                        <input type="text" name="email" id="email" required />
                                    </td>
                                </tr>
                                <tr>
                                    <th>휴대폰</th>
                                    <td>
                                        <input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required>
                                    </td>
                                </tr>
                                <tr>
                                    <th>회사전화</th>
                                    <td>
                                        <input type="tel" placeholder="(-없이)0212345678" name="cpTel" id="cpTel" maxlength="11" required>
                                    </td>
                                </tr>
                                <tr>
                                    <th>회사주소</th>
                                    <td colspan="5">
                                        <input style="width: 500px;" type="text" class="form-control" name="cpAddress" id="cpAddress" required>
                                    </td>
                                </tr>
                                <tr>
                                    <th>메모</th>
                                    <td colspan="5">
                                        <input style="width: 600px; height:80px;" type="text" class="form-control" name="memo" id="memo" required>
                                    </td>
                                </tr>

                            </table>
                            <div class="submit-btn-wrap">
                            	<input type="submit" id="btn-addrEnroll" value="등록">
                            	<input type="submit" id="btn-addrEnrollCancel" value="취소">
                            </div>
                        </form>
                        </div>
		
	</div><!-- content end -->

<div class="div-padding"></div>

	
<script>
function previewImage(event) {
	  var reader = new FileReader();
	  reader.onload = function() {
	    var img = new Image();
	    img.src = reader.result;
	    img.onload = function() {
	      var canvas = document.createElement('canvas');
	      var ctx = canvas.getContext('2d');
	      var width = 400;
	      var height = 400;
	      if (img.width > img.height) {
	        height = img.height * (width / img.width);
	      } else {
	        width = img.width * (height / img.height);
	      }
	      canvas.width = width;
	      canvas.height = height;
	      ctx.drawImage(img, 0, 0, width, height);
	      var dataURL = canvas.toDataURL();
	      document.getElementById('preview').setAttribute('src', dataURL);
	    }
	  }
	  reader.readAsDataURL(event.target.files[0]);
	}
</script>
<script>

</script>






	<jsp:include page="/WEB-INF/views/common/footer.jsp" />