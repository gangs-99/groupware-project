<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param value="Sign" name="title"/>
	</jsp:include>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/form.css">
	
	<jsp:include page="/WEB-INF/views/sign/signLeftBar.jsp" />
	
	<jsp:include page="/WEB-INF/views/sign/signDetail.jsp">
		<jsp:param value="출장신청서" name="title" />
	</jsp:include>
								
											</td>
											<td class="sign-tbl-right">
												<div class="sign-div-right">
													<table class="sign-right-tbl">
														<tbody>
															<tr>
																<th>신청</th>
																<td class="sign-right-tbl-border">
																	<table class="sign-right-tbl-line">
																		<tbody>
																			<tr>
																				<td>
																					<span class="sign_rank">${sign.jobTitle}</span>
																				</td>
																			</tr>
																			<tr>
																				<td>
																					<span class="sign_name">${sign.name}</span>
																				</td>
																			</tr>
																			<tr>
																				<td>
																					<span class="sign_date">
																						<fmt:parseDate value="${sign.regDate}" var="now" pattern="yyyy-MM-dd" />
																						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
																					</span>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
							
												<div class="sign-div-right sign-div-tbl">
													<table class="sign-right-tbl">
														<tbody>
															<tr>
																<th>승인</th>
																<c:forEach items="${sign.signStatusList}" var="signStatus">
																	<td class="sign-right-tbl-border">
																		<table class="sign-right-tbl-line">
																			<tbody>
																				<tr>
																					<td>
																						<span class="sign_rank">${signStatus.jobTitle}</span>
																					</td>
																				</tr>
																				<tr>
																					<td>
																						<c:if test="${signStatus.status == 'C'}">
																							<img src="${pageContext.request.contextPath}/resources/images/ok.png" class="ok-sign" />
																							<br />
																							<span class="sign_name">${signStatus.name}</span>
																						</c:if>
																						<c:if test="${signStatus.status != 'C'}">
																							<span class="sign_wrap">${signStatus.name}</span>
																						</c:if>
																					</td>
																				</tr>
																				<tr>
																					<td>
																						<span class="sign_date">
																							<c:if test="${!empty signStatus.regDate}">
																								<fmt:parseDate value="${signStatus.regDate}" var="regDate" pattern="yyyy-MM-dd" />
																								<fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd" />
																							</c:if>
																							<c:if test="${empty signStatus.regDate}">
																								&nbsp;
																							</c:if>
																						</span>
																					</td>
																				</tr>
																			</tbody>
																		</table>
																	</td>
																</c:forEach>
															</tr>
														</tbody>
													</table>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<script>
									const nowDate = new Date();
									const newDate = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate() + 2);
									const dateOff = new Date().getTimezoneOffset() * 60000;
									const today = new Date(newDate - dateOff).toISOString().split('T')[0];
								</script>
								
								<br />
								<div class="div-sign-tbl div-sign-tbl-detail">
									<table class="sign-tbl-bottom">
										<tbody>
											<tr>
												<td>긴급&nbsp;문서</td>
												<td colspan="3">
													<input type="radio" name="emergency" id="_emergencyY" value="Y" ${sign.emergency == 'Y' ? 'checked' : 'disabled'} /><label for="_emergencyY">여</label>
													<input type="radio" name="emergency" id="_emergencyN" value="N"  ${sign.emergency == 'N' ? 'checked' : 'disabled'} /><label for="_emergencyN">부</label>
												</td>
											</tr>
											<tr class="sign-tbl-bottom-tr">
												<td colspan="4" class="sign-tbl-bottom-td">
													아래와 같이 출장신청서를 제출합니다.
												</td>
											</tr>
											<tr class="trip-boss">
												<td rowspan="2">출장자</td>
												<td>부서</td>
												<td>직책</td>
												<td>성명</td>
											</tr>
											<tr class="sign-tbl-bottom-tr">
												<td><input type="text" name="boss-dept" id="boss-dept" value="${sign.deptTitle}" readonly /></td>
												<td><input type="text" name="boss-job" id="boss-job" value="${sign.jobTitle}" readonly /></td>
												<td><input type="text" name="boss-name" id="boss-name" value="${sign.name }" readonly /></td>
											</tr>
											<tr>
												<td>
													기간&nbsp;및&nbsp;일시
												</td>
												<td colspan="3">
													<span>
														<span>
															<input id="start-date" name="startDate" class="dayoff-date" type="date" value="${trip.startDate}" readonly>
														</span>
														&nbsp;~&nbsp; 
														<span>
															<input id="end-date" name="endDate" class="dayoff-date" type="date" value="${trip.endDate}" readonly>
														</span>
														&nbsp;&nbsp;
														<span>선택일수 : 
															<span id="usingPointArea"></span>
														</span>
													</span>
												</td>
											</tr>
											<tr>
												<td>
													출장지
												</td>
												<td colspan="3">
													<input type="text" name="location" id="trip-where" value="${trip.location}" readonly />
												</td>
											</tr>
											<tr>
												<td>
													출장 목적
												</td>
												<td colspan="3">
													<textarea name="purpose" class="txta_editor" readonly>${trip.purpose}</textarea>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								
								<div class="div-sign-tbl div-sign-tbl-update">
									<form:form action="${pageContext.request.contextPath}/sign/tripUpdate.do" method="post" name="tripUpdateFrm">
										<table class="sign-tbl-bottom">
											<tbody>
												<tr>
													<td>긴급&nbsp;문서</td>
													<td colspan="3">
														<input type="radio" name="emergency" id="emergencyY" value="Y" ${sign.emergency == 'Y' ? 'checked' : ''} /><label for="emergencyY">여</label>
														<input type="radio" name="emergency" id="emergencyN" value="N"  ${sign.emergency == 'N' ? 'checked' : ''} /><label for="emergencyN">부</label>
													</td>
												</tr>
												<tr class="sign-tbl-bottom-tr">
													<td colspan="4" class="sign-tbl-bottom-td">
														아래와 같이 출장신청서를 제출합니다.
													</td>
												</tr>
												<tr class="trip-boss">
													<td rowspan="2">출장자</td>
													<td>부서</td>
													<td>직책</td>
													<td>성명</td>
												</tr>
												<tr class="sign-tbl-bottom-tr">
													<td><input type="text" name="boss-dept" id="boss-dept" value="${sign.deptTitle}" readonly /></td>
													<td><input type="text" name="boss-job" id="boss-job" value="${sign.jobTitle}" readonly /></td>
													<td><input type="text" name="boss-name" id="boss-name" value="${sign.name }" readonly /></td>
												</tr>
												<tr>
													<td>
														기간&nbsp;및&nbsp;일시
													</td>
													<td colspan="3">
														<input type="hidden" name="no" value="${trip.no}" />
														<input type="hidden" name="signNo" value="${sign.no}" />
														
														<span>
															<span>
																<input id="start-date" name="startDate" class="dayoff-date" type="date" value="${trip.startDate}" onKeyPress="noKey(event);"/>
															</span>
															&nbsp;~&nbsp; 
															<span>
																<input id="end-date" name="endDate" class="dayoff-date" type="date" value="${trip.endDate}" onKeyPress="noKey(event);"/>
															</span>
															&nbsp;&nbsp;
															<span>선택일수 : 
																<span id="usingPointArea"></span>
															</span>
														</span>
													</td>
												</tr>
												<tr>
													<td>
														출장지
													</td>
													<td colspan="3">
														<input type="text" name="location" id="trip-where" value="${trip.location}" />
													</td>
												</tr>
												<tr>
													<td>
														출장 목적
													</td>
													<td colspan="3">
														<textarea name="purpose" class="txta_editor">${trip.purpose}</textarea>
													</td>
												</tr>
											</tbody>
										</table>
									</form:form>
								</div>
								
								<script>
									/* 확정 또는 예정된 연차, 반차, 출장 날짜 목록 */
									const noDateList = [];
									<c:forEach items="${noDateList}" var="noDate">
										noDateList.push({
											regDate: "${noDate.reg_date}",
											state: "${noDate.state}"
										});
									</c:forEach>
									
									<c:forEach items="${toBeNoDateList}" var="toBeNoDate">
										noDateList.push({
											regDate: "${toBeNoDate.reg_date}",
											state: "${toBeNoDate.state}"
										});
									</c:forEach>
									console.log(noDateList);
									
									noDateList.sort((a, b) => {
										if (a.regDate > b.regDate) return 1;
										if (a.regDate < b.regDate) return -1;
										return 0;
									});
									

									/* 날짜 키보드 입력 막기 */
									const noKey = (event) => {
										event.preventDefault();
										return false;
									};
									
									const startDate = document.querySelectorAll('#start-date');
									const endDate = document.querySelectorAll('#end-date');
									const usingPointArea = document.querySelectorAll('#usingPointArea');
									
									usingPointArea.forEach((area) => {
										area.innerText = ((new Date(endDate[0].value).getTime() - new Date(startDate[0].value).getTime()) / (1000 * 60 * 60 * 24) + 1);
									})
									
									let start;
									let end;
									let diff = 1;
									
									const diffDay = (start, end) => {
										diff = end - start;
										return diff / (1000 * 60 * 60 * 24) + 1;
									};
									
									const inner = (tag, val) => {
										return tag.innerText = val;
									};
									
									
									startDate[1].addEventListener('change', (e) => {
										endDate[1].min = startDate[1].value;
										
										end = new Date(endDate[1].value).getTime();
										start = new Date(startDate[1].value).getTime();
										
										if (end < start) {
											endDate[1].value = startDate[1].value;
											end = new Date(endDate[1].value).getTime();
										}
										inner(usingPointArea[1], diffDay(start, end));
									});
									
									endDate[1].addEventListener('change', (e) => {
										end = new Date(endDate[1].value).getTime();
										start = new Date(startDate[1].value).getTime();

										inner(usingPointArea[1], diffDay(start, end));
									});
								</script>
							</div>
						</div>
						<!-- 결재 문서 end -->
						<script>
							const detailBtn = document.querySelector('.div-sign-btn-detail');
							const detailDiv = document.querySelector('.div-sign-tbl-detail');
							const updateBtn = document.querySelector('.div-sign-btn-update');
							const updateDiv = document.querySelector('.div-sign-tbl-update');
							
							/* 문서 수정 버튼 클릭 */
							const signUpdateFrm = () => {
								detailBtn.style.display = 'none';
								detailDiv.style.display = 'none';
								updateBtn.style.display = 'inline-block';
								updateDiv.style.display = 'inline-block';
							}; // signUpdateFrm end
							
							
							/* 출장신청서 수정 폼 제출 */
							const signUpdateOk = () => {
								const frm = document.tripUpdateFrm;
								const location = frm.location;
								const purpose = frm.purpose;
								
								if (/^\s+$/.test(location.value) || !location.value) {
									alert('출장지를 작성해주세요.');
									location.select();
									return false;
								}
								
								if (/^\s+$/.test(purpose.value) || !purpose.value) {
									alert('출장 목적을 작성해주세요.');
									purpose.select();
									return false;
								}

								let dateList = [];
								let text = '현재 선택된 기간에는 다른 일정이 있는 날짜가 존재합니다.\n';
								for (let i = 0; i < noDateList.length; i++) {
									let noDate = noDateList[i];
									
									let no = new Date(noDate.regDate);
									if (new Date(startDate[1].value) <= no && new Date(endDate[1].value) >= no) {
										dateList.push(noDate);
									}
									
									if (i === noDateList.length - 1) {
										if (dateList.length > 0) {
											dateList.forEach((date) => {
												text += date.regDate + ' (' + date.state + ')\n';
											});
											alert(text);
											return false;
										} // 신청하면 안되는 날짜가 존재하는 경우
									} // noDateList의 마지막 인덱스인 경우
								};
								
								frm.submit();
							};
							
							
							/* 결재, 보류, 반려 */
							const signStatusUpdate = (status) => {
								const modal = signStatusUpdateModal;
								const h5 = modal.querySelector('h5');
								const btn = modal.querySelector('.btn-status');
								const frmStatus = document.signStatusUpdateFrm.status;
								
								switch (status) {
								case 'C' :
									h5.innerText = '결재하기';
									btn.innerText = '결재';
									break;
								case 'R' :
									h5.innerText = '반려하기';
									btn.innerText = '반려';
									break;
								case 'H' :
									h5.innerText = '보류하기';
									btn.innerText = '보류';
									break;
								} // switch end
								
								frmStatus.value = status;
							};
							
							
							/* 결재, 반려, 보류 폼 제출 */
							document.signStatusUpdateFrm.addEventListener('submit', (e) => {
								e.preventDefault();
								console.log(e.target);
								
								const status = e.target.status;
								const reason = e.target.reason;
								
								if (status.value == 'R' || status.value == 'H') {
									if (/^\s+$/.test(reason.value) || !reason.value) {
										alert('결재 의견을 작성해주세요.');
										reason.select();
										return false;
									}
								}
								
								e.target.submit();
							});
						</script>
						
						
						<div class="div-sign-bottom">
							<div class="div-sign-bottom-title">
								<div class="font-large">결재선</div>
							</div>
							<div class="div-sign-bottom-content">
								<!-- 기안자 -->
								<div class="div-sign-bottom-tbl">
									<table class="div-sign-bottom-content-tbl">
										<colgroup>
                                               <col width="5%" />
                                               <col width="95%" />
                                           </colgroup>
										<thead>
											<tr>
												<td rowspan="4" class="td-img">
													<c:if test="${empty sign.profileImg}">
														<img src="${pageContext.request.contextPath}/resources/images/default.png" class="my-img" />
													</c:if>
													<c:if test="${!empty sign.profileImg}">
														<img src="${pageContext.request.contextPath}/resources/upload/emp/${sign.profileImg}" class="my-img" />
													</c:if>
												</td>
												<th>${sign.name} ${sign.jobTitle}</th>
											</tr>
											<tr>
												<td>${sign.deptTitle}</td>
											</tr>
											<tr>
												<td>
													기안 상신 |&nbsp;
													<fmt:parseDate value="${sign.regDate}" var="regDate" pattern="yyyy-MM-dd" />
													<fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd(E)" />
												</td>
											</tr>
										</thead>
									</table>
								</div>
								
								<!-- 결재자 -->
								<c:forEach items="${sign.signStatusList}" var="signStatus">
									<div class="div-sign-bottom-tbl ${(signStatus.status == 'W' || signStatus.status == 'H' || signStatus.status == 'R') ? 'signStatusHere' : ''}">
										<table class="div-sign-bottom-content-tbl">
											<colgroup>
                                                <col width="5%" />
                                                <col width="95%" />
                                            </colgroup>
											<thead>
												<tr>
													<td rowspan="4" class="td-img">
														<c:if test="${empty signStatus.profileImg}">
															<img src="${pageContext.request.contextPath}/resources/images/default.png" class="my-img" />
														</c:if>
														<c:if test="${!empty signStatus.profileImg}">
															<img src="${pageContext.request.contextPath}/resources/upload/emp/${signStatus.profileImg}" class="my-img" />
														</c:if>
													</td>
													<th>${signStatus.name} ${signStatus.jobTitle}</th>
												</tr>
												<tr>
													<td>${signStatus.deptTitle}</td>
												</tr>
												<tr>
													<td>
														<c:choose>
															<c:when test="${signStatus.status == 'W'}">
																결재 대기
															</c:when>
															<c:when test="${signStatus.status == 'S'}">
																결재 예정
															</c:when>
															<c:when test="${signStatus.status == 'C'}">
																결재 승인
															</c:when>
															<c:when test="${signStatus.status == 'H'}">
																결재 보류
															</c:when>
															<c:when test="${signStatus.status == 'R'}">
																결재 반려
															</c:when>
														</c:choose>
														<c:if test="${!empty signStatus.regDate}">
															&nbsp;|&nbsp;
															<fmt:parseDate value="${signStatus.regDate}" var="regDate" pattern="yyyy-MM-dd" />
															<fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd(E)" />
														</c:if>
													</td>
												</tr>
												<c:if test="${!empty signStatus.reason}">
													<tr class="tr-reason">
														<td>${signStatus.reason}</td>
													</tr>
												</c:if>
											</thead>
										</table>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>