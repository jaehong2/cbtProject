<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="items" required="true" type="java.util.Map" %>
	<select name="searchTaker">
			<c:forEach items="${items }" var="option">
				<option value="${option.value}">${option.key }</option>
			</c:forEach>
	</select>	
	
	<!-- taker search기능 위한 tag -->