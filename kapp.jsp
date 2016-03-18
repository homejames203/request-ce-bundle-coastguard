<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>
<%@include file="bundle/router.jspf" %>
<c:set var="bundleCategories" value="${CategoryHelper.getCategories(kapp)}"/>

<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <bundle:variable name="head">
        <title>Kinetic Data ${text.escape(kapp.name)}</title>
    </bundle:variable>
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="tab-home">
            <div class="row">
                <div class="col-md-12">
                    <%-- For each of the categories --%>
                    <c:forEach items="${bundleCategories}" var="category">
                        <%-- If the category is not hidden, and it contains at least 1 form --%>
                        <c:if test="${!category.hasAttributeValue('Hidden',true)}">
                            <div class="category">
                                <h3>${text.escape(category.getDisplayName())}</h3>
                                <div class="row">
                                    <%-- Show the first x number of forms of the category --%>
                                    <c:forEach items="${category.getForms()}" var="categoryForm" begin="0" end="8">
                                    <%-- Only show New or Active forms --%>
                                    <c:if test="${categoryForm.status eq 'New' || categoryForm.status eq 'Active'}">
                                    <%-- Render the form panel --%>
                                    <c:set scope="request" var="thisForm" value="${categoryForm}"/>
                                    <c:import url="${bundle.path}/partials/formCard.jsp" charEncoding="UTF-8" />
                                    </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div role="tabpanel" class="tab-pane" id="tab-requests">
            <h3>My Requests</h3>
            <c:set scope="request" var="submissionsList" value="${SubmissionHelper.retrieveRecentSubmissions('Service')}"/>
            <c:import url="${bundle.path}/partials/submissions.jsp" charEncoding="UTF-8"/>
        </div>
        <div role="tabpanel" class="tab-pane" id="tab-approvals">
            <h3>My Approvals</h3>
            <c:set scope="request" var="submissionsList" value="${SubmissionHelper.retrieveRecentSubmissions('Approval')}"/>
            <c:import url="${bundle.path}/partials/submissions.jsp" charEncoding="UTF-8"/>
        </div>
    </div>
</bundle:layout>