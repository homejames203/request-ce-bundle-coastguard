<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<c:set var="totalSearchesFound" value="${fn:length(SubmissionHelper.searchResultsSubmissions('true'))}"/>
<c:set var="searchesNotFound" value="${SubmissionHelper.searchResultsSubmissions('false')}"/>
<c:set var="totalSearchesNotFound" value="${fn:length(searchesNotFound)}"/>
<c:set var="totalSearches" value="${fn:length(SubmissionHelper.searchResultsSubmissions('all'))}"/>

<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <bundle:scriptpack>
        <bundle:script src="${bundle.location}/libraries/knob/jquery.knob.js" />
        <bundle:script src="${bundle.location}/js/dashboard.js" />
    </bundle:scriptpack>
    <bundle:variable name="head">
        <title>${space.getAttribute('Company Name').value} - Management Dashboard</title>
    </bundle:variable>


    <section class="content-header">
        <h1>
            Management Dashboard
        </h1>
        <ol class="breadcrumb">
            <li><a href="${bundle.kappLocation}">
                <i class="fa fa-search"></i> 
                Home</a>
            </li>
            <li class="active">Dashboard</li>
        </ol>
    </section>
    <section class="content">
        <div class="row">
            <section class="col-lg-12 connectedSortable">
                <div class="box box-success">
                    <div class="box-header">
                        <i class="fa fa-search"></i>
                        <h3 class="box-title">Portal Search Activity</h3>
                    </div>
                    <div class="box-body">
                        <div class="col-md-3 col-sm-6 col-xs-6 text-center">
                            <input type="text" class="knob" value="${totalSearches}"  data-width="120" data-height="120" data-fgColor="#3c8dbc" data-readonly="true">
                            <div class="knob-label">Total Portal Searches</div>
                        </div><!-- ./col -->
                        <div class="col-md-3 col-sm-6 col-xs-6 text-center">
                            <input type="text" class="knob" value="${totalSearchesFound}" data-width="120" data-height="120" data-fgColor="#f56954" data-readonly="true">
                            <div class="knob-label">Portal Searches WITH Results</div>
                        </div><!-- ./col -->
                        <div class="col-md-3 col-sm-6 col-xs-6 text-center">
                            <input type="text" class="knob" value="${totalSearchesNotFound}" data-width="120" data-height="120" data-fgColor="#00a65a" data-readonly="true">
                            <div class="knob-label">Portal Searches with NO Results</div>
                        </div><!-- ./col -->
                        <div class="col-md-3 col-sm-6 col-xs-6 text-center">
                            <input type="text" class="knob" value="${totalSearchesFound*100/totalSearches}" data-width="140" data-height="140" data-fgColor="#932ab6" data-readonly="true">
                            <div class="knob-label"><b>% Searches with Results Found</b></div>
                        </div><!-- ./col -->
                    </div>
                    <div class="box-body">
                      <table class="table table-condensed">
                        <tr>
                          <th>Search Queries Not Found in Portal</th>
                        </tr>
                        <c:forEach var="search" items="${searchesNotFound}">
                            <tr>
                              <td>${search.getValue('Search Query')}</td>
                            </tr>
                        </c:forEach>
                      </table>
                    </div>
                </div>
            </section>
        </div>
    </section>
</bundle:layout>