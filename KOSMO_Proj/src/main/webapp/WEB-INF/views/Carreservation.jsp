<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body class="animsition">

	<!-- MAIN CONTENT-->
	<div class="main-content">

		<nav class="nav nav-tabs" id="nav-tab" role="tablist">
			<a class="nav-item nav-link active" id="nav-home-tab"
				data-toggle="tab" href="#nav-home" role="tab" aria-controls="home"
				aria-expanded="true">현재 예약</a> <a class="nav-item nav-link"
				id="nav-profile-tab" data-toggle="tab" href="#nav-profile"
				role="tab" aria-controls="profile" aria-expanded="false">완료 예약</a>
		</nav>
		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade active show" id="nav-home" role="tabpanel"
				aria-labelledby="nav-home-tab" aria-expanded="true">

				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">

							</div>
						</div>

						<div class="data-tables datatable-dark"
							style="padding-top: 20px; text-align: center;">

							<table id="dataTable3" style="width: 100%; text-align: center">
								<thead>
									<tr>
										<th style="background-color: #ffaec9">내아이디</th>
										<th style="background-color: #ffaec9">상대방아이디</th>
										<th style="background-color: #ffaec9">출발지</th>
										<th style="background-color: #ffaec9">목적지</th>
										<th style="background-color: #ffaec9">시간</th>
										<th style="background-color: #ffaec9">가격</th>
										<th style="background-color: #ffaec9">타입</th>
									</tr>
								</thead>
									<c:forEach items="${selist }" var="items" varStatus="loop">
										<c:if test="${items.id==id2 }">
											<c:if test="${reser==0}">
												<tr>
													<th>${items.id }</th>
													<th>${items.reservationid }</th>
													<th>${items.startpoint }</th>
													<th>${items.endpoint }</th>
													<th>${items.time }</th>
													<th>${items.price }</th>
													<th>${items.type }</th>
												</tr>
											</c:if>
										</c:if>
									</c:forEach>
							</table>

						</div>
					</div>
				</div>

			</div>

			<div class="tab-pane fade" id="nav-profile" role="tabpanel"
				aria-labelledby="nav-profile-tab" aria-expanded="false">
				<div class="data-tables datatable-dark"
							style="padding-top: 20px; text-align: center;">

							<table id="dataTable3" style="width: 100%; text-align: center">
								<thead>
									<tr>
										<th style="background-color: #ffaec9">내아이디</th>
										<th style="background-color: #ffaec9">상대방아이디</th>
										<th style="background-color: #ffaec9">출발지</th>
										<th style="background-color: #ffaec9">목적지</th>
										<th style="background-color: #ffaec9">시간</th>
										<th style="background-color: #ffaec9">가격</th>
										<th style="background-color: #ffaec9">타입</th>
									</tr>
								</thead>
									<c:forEach items="${selist }" var="items" varStatus="loop">
										<c:if test="${items.id==id2 }">
											<c:if test="${reser==1}">
												<tr>
													<th>${items.id }</th>
													<th>${items.reservationid }</th>
													<th>${items.startpoint }</th>
													<th>${items.endpoint }</th>
													<th>${items.time }</th>
													<th>${items.price }</th>
													<th>${items.type }</th>						
												</tr>
											</c:if>
										</c:if>
									</c:forEach>
							</table>


						</div>


			</div>

		</div>
		<!-- 여기가 탭키 나누는곳 -->

	</div>
	<!-- END MAIN CONTENT-->
</body>


<script src="admin_assets/bootstrap_table/jquery-3.3.1.js"></script>
<script src="admin_assets/bootstrap_table/jquery.dataTables.min.js"></script>
<script src="admin_assets/bootstrap_table/dataTables.bootstrap4.min.js"></script>
   
<!-- Bootstrap JS-->
<script src="admin_assets/vendor/bootstrap-4.1/popper.min.js"></script>
<script src="admin_assets/vendor/bootstrap-4.1/bootstrap.min.js"></script>

<script src="admin_assets/vendor/counter-up/jquery.waypoints.min.js"></script>
<script src="admin_assets/vendor/counter-up/jquery.counterup.min.js">
</script>
<script src="admin_assets/vendor/circle-progress/circle-progress.min.js"></script>
<script src="admin_assets/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="admin_assets/vendor/chartjs/Chart.bundle.min.js"></script>
<script src="admin_assets/vendor/select2/select2.min.js"></script>
<script src="admin_assets/js/main.js"></script>

  
 

</body>

</html>
