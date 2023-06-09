<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param value="근태관리" name="title"/>
	</jsp:include>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/emp/empEnroll.css">
 	<jsp:include page="/WEB-INF/views/emp/empLeftBar.jsp" />
	
	<div class="home-container">
						<!-- 상단 타이틀 -->
						<div class="top-container">
							<div class="container-title font-bold">인사정보 등록</div>
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
                            const style = modal.style.display;

                            if (style == 'inline-block') {
                                modal.style.display = 'none';
                            } else {
                                modal.style.display = 'inline-block';
                            }
                        });
                    </script>
                    <!-- 상단 타이틀 end -->

                    <!-- 본문 -->
                <div class="div-padding">
                    <div id="empInfo">
                        <form name="empFrm"
                            action="${pageContext.request.contextPath}/emp/empEnroll.do?${_csrf.parameterName}=${_csrf.token}" method="post"
                            enctype="multipart/form-data">
                            <table id="emp-enroll-table">
        
                                <tr>
                                    <th></th>
                                    <td>
                                        <div id="profile-box">
                                            <img id="preview" src="#" style="max-width:150px; max-height:150px;">
                                            <label for="file"><i class="fa-solid fa-magnifying-glass"></i></label>
                                            <input type="file" id="file" name="file" accept="image/*" onchange="previewImage(event)">
                                        </div>
                                    </td>

                                </tr>
                                <tr>
                                
                                    <th>이름</th>
                                    <td>
                                        <input type="text" name="name" id="name" required>
                                    </td>
                                    
                                </tr>
                               
                                <tr>
                                    
                                    <th>주민번호</th>
                                    <td>
                                        <input type="text" name="ssn" id="ssn" required />
                                    </td>
                                    
                                </tr>
                             
                                <tr>
                                    <th>휴대폰</th>
                                    <td>
                                        <input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required>
                                    </td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td colspan="5">
                                        <input style="width: 500px;" type="text" class="form-control" name="address" id="address" required>
                                    </td>
                                </tr>
                                <tr>
                                    <th>부서</th>
                                    <td>
                                        <select name="deptCode" required>
                                            <option selected>부서선택</option>
                                            <option value="d1">인사총무</option>
                                            <option value="d2">개발</option>
                                            <option value="d3">법무</option>
                                            <option value="d4">마케팅</option>
                                            <option value="d5">기획</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>직급</th>
                                    <td>
                                        <select name="jobCode" required>
                                            <option selected>직급선택</option>
                                            <option value="j1">사장</option>
                                            <option value="j2">부사장</option>
                                            <option value="j3">부장</option>
                                            <option value="j4">차장</option>
                                            <option value="j5">과장</option>
                                            <option value="j6">대리</option>
                                            <option value="j7">주임</option>
                                            <option value="j8">사원</option>
                                        </select>
                                    </td>
                                </tr>
                                
                                
                            </table>
                            <input type="submit" id="btn-empEnroll" value="등록">
                        </form>
                    </div>
                </div>
                <!-- 본문 end -->
                </div>
            </div>
            
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

         
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="${pageContext.request.contextPath}/resources/js/emp/emp.js"></script>			