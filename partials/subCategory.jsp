<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<ul>
<c:forEach var="subcategory" items="${currentCat.getSubcategories()}">
    <li>
        <a href="${bundle.spaceLocation}/${kapp.slug}?page=category&category=${subcategory.slug}">
            <h5>${text.escape(subcategory.getName())}</h5>
        </a>
        <c:set var="currentCat" value="${subcategory}" scope="request"/>
        <jsp:include page="subCategory.jsp"/>
    </li>
</c:forEach>
</ul>