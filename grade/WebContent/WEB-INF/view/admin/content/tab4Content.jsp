<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="t" begin="1" end="${certList.size() }">
	<div class="tab_content">
		<div class="content num" id="tab4Auto${t }">${certList.get(t-1).auto }</div>
		<div class="content c1">${certList.get(t-1).day }</div>
		<div class="content c2">${certList.get(t-1).id }</div>
		<div class="content c1">${certList.get(t-1).name }</div>
		<div class="content c3">${certList.get(t-1).schoolName }</div>
		<div class="content c4">${certList.get(t-1).subject }</div>
		<div class="content c5">
			<span onclick="tab4Img('${certList.get(t-1).uuid }')">${certList.get(t-1).uuid }</span>
		</div>
		<div class="content c2">
			<div class="input_wrap">
				<label for="tab4Ent${t }">재학</label>
				<input type="checkbox" id="tab4Ent${t }" onclick="tab4Ent('${t }')" ${certList.get(t-1).certType == '재학' ? 'checked' : '' } ${tab4Type == 'end' ? 'disabled' : '' }>
			</div>
			<div class="input_wrap">
				<label for="tab4Pass${t }">합격</label>
				<input type="checkbox" id="tab4Pass${t }" onclick="tab4Pass('${t }')" ${certList.get(t-1).certType == '합격' ? 'checked' : '' } ${tab4Type == 'end' ? 'disabled' : '' }>
			</div>
		</div>
	</div>
</c:forEach>