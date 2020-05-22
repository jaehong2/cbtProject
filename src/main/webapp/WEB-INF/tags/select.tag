<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="items" required="true" type="java.util.List" %>
<%@ attribute name="name" required="true" type="java.lang.String" %>
<%@ attribute name="value" required="true" type="java.lang.String" %>
<select name ="${name}" class="form-control">

<c:forEach items="${items}" var ="code">
			<option value="${code.detailCd}" 
			<c:if test="${value eq code.detailCd}">selected</c:if>> ${code.detailNm}      
</c:forEach>  
</select>