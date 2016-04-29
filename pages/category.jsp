<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<%
String category = request.getParameter("category");
request.setAttribute("category", category);
%>
<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <bundle:variable name="head">
        <title>${kapp.getAttribute('Company Name').value} - ${text.escape(kapp.getCategory(category).name)}</title>
    </bundle:variable>
    <bundle:scriptpack>
        <bundle:script src="${bundle.location}/js/formCard.js" />
        <bundle:script src="${bundle.location}/libraries/starrr/starrr.js" />
    </bundle:scriptpack>


    <section class="content-header">
        <h1>
            ${text.escape(kapp.getCategory(category).name)}
        </h1>
        <ol class="breadcrumb">
            <li><a href="${bundle.kappLocation}">
                <i class="fa fa-search"></i> 
                Home</a>
            </li>
        <li class="active">${text.escape(kapp.getCategory(category).name)}</li>
        </ol>
    </section>


    <section class="content">
        <div class="row">
            <div class="col-md-12">
            <c:forEach var="form" items="${kapp.getCategory(category).forms}">
                <c:set var="form" scope="request" value="${form}"/>
                <c:import url="${bundle.path}/partials/formCard.jsp" charEncoding="UTF-8"/>
            </c:forEach>
            </div>
            <div class="hidden">
                <div class="box box-solid">
                    <div class="box-header with-border">
                        <h3 class="box-title">My ${text.escape(kapp.getCategory(category).name)} Tickets</h3>
                    </div>
                    <div class="box-body">
                    </div>
                </div>
            </div>
        </div>
    </section>
</bundle:layout>