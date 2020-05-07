<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
	<style>
	.placeholder {
	  background-color: #f6f6f6;
	  background-size: cover;
	  background-repeat: no-repeat;
	  position: relative;
	  overflow: hidden;
	}
	
	.placeholder img {
	  position: absolute;
	  opacity: 0;
	  top: 0;
	  left: 0;
	  width: 100%;
	  transition: opacity 1s linear;
	}
	
	.placeholder img.loaded {
	  opacity: 1;
	}
	
	.img-small {
	  filter: blur(50px);
	  /* this is needed so Safari keeps sharp edges */
	  transform: scale(1);
	}
	</style>
	
	<script type="text/javascript">

	window.onload = function() {

		var placeholder = document.querySelector('.placeholder'), small = placeholder
				.querySelector('.img-small')

		// 1: load small image and show it
		var img = new Image();
		img.src = small.src;
		img.onload = function() {
			small.classList.add('loaded');
		};

		// 2: load large image
		var imgLarge = new Image();
		imgLarge.src = placeholder.dataset.large;
		imgLarge.onload = function() {
			imgLarge.classList.add('loaded');
		};
		placeholder.appendChild(imgLarge);
	}

    </script>
</head>
<body>

<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>
	</thead>
	
	<tbody>
	
	<c:forEach items="${list}" var="list">
		<tr>
			<td>${list.bno}</td>
			<td>${list.title}</td>
			<td>${list.regDate}</td>
			<td>${list.writer}</td>
			<td>${list.viewCnt}</td>
		</tr>
	</c:forEach>
	
	</tbody>
	
</table>

	<div class="placeholder" data-large="https://cdn-images-1.medium.com/max/1800/1*sg-uLNm73whmdOgKlrQdZA.jpeg">
	  <img src="https://cdn-images-1.medium.com/freeze/max/27/1*sg-uLNm73whmdOgKlrQdZA.jpeg?q=20" class="img-small">
	  <div style="padding-bottom: 66.6%;"></div>
	</div>
	
	
</body>
</html>