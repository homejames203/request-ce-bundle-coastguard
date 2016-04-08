<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>
<%@include file="bundle/router.jspf" %>
<c:set var="bundleCategories" value="${CategoryHelper.getCategories(kapp)}"/>

<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <bundle:variable name="head">
        <title>Kinetic Data ${text.escape(kapp.name)}</title>
    </bundle:variable>
    <h3>${text.escape(kapp.name)}</h3>
    <div class="row">
        <div class="col-md-12">
            
        </div>
    </div>
</bundle:layout>