<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="items" required="true" type="java.util.Map" %>
	<select name="searchCompany">
			<c:forEach items="${items }" var="option">
				<option value="${option.value}">${option.key }</option>
			</c:forEach>
	</select>	
	
	<!-- company search기능 위한 tag -->