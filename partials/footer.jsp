<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<footer class="main-footer">
    <div class="pull-right hidden-xs">
        <b>Version</b> ${buildVersion}
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="${bundle.kappLocation}">
        <c:choose>
            <c:when test="${not empty kapp.getAttribute('Company Name')}">
               ${kapp.getAttributeValue('Company Name')}
            </c:when>
            <c:otherwise>
                ${kapp.name}
            </c:otherwise>
        </c:choose>
    </a>.</strong> All rights reserved.
</footer>
