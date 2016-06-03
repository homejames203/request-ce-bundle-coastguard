<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<c:choose>
    <c:when test="${param['type'] eq 'approval'}">
        <c:set scope="request" var="submissionsList" value="${SubmissionHelper.retrieveRecentSubmissions('Approval', 999)}"/>
        <c:set scope="request" var="type" value="Approvals"/>
    </c:when>
    <c:when test="${param['type'] eq 'work-order'}">
        <c:set scope="request" var="submissionsList" value="${SubmissionHelper.retrieveRecentSubmissions('Work Order', 999)}"/>
        <c:set scope="request" var="type" value="Tasks"/>
    </c:when>
    <c:otherwise>
        <c:set scope="request" var="submissionsList" value="${SubmissionHelper.retrieveRecentSubmissions('Service', 999)}"/>
        <c:set scope="request" var="type" value="Requests"/>
    </c:otherwise>
</c:choose>
<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <bundle:variable name="head">
        <title>${text.escape(space.name)} Profile</title>
    </bundle:variable>
    <section class="content-header">
        <h1>
            My ${type}
        </h1>
        <ol class="breadcrumb">
            <li><a href="#">
                <i class="fa fa-home"></i> 
                Home</a>
            </li>
            <li class="active">My ${type}</li>
        </ol>
    </section>

    <section class="content">
        <div class="box box-primary">
            <div class="box-header">
            </div><!-- /.box-header -->
            <div class="box-body">
                <table class="table table-hover datatable">  
                    <thead>
                        <tr>
                            <th>Item Requested</th>
                            <th>Details</th>
                            <th>Requested By</th>
                            <th>Date Submitted</th>
                            <c:if test="${type eq 'Approvals'}">
                                <th>Decision</th>
                            </c:if>
                            <c:if test="${type eq 'Requests' || type eq 'Tasks'}">
                                <th>Status</th>
                            </c:if>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${submissionsList}" var="submission">
                            <c:set var="statusColor" value="label-success"/>
                            <c:choose> 
                                <c:when test="${submission.coreState eq 'Draft'}">
                                    <c:set var="statusColor" value="label-warning"/>
                                </c:when>
                                <c:when test="${submission.coreState eq 'Submitted'}">
                                    <c:set var="statusColor" value="label-success"/>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="statusColor" value="label-primary"/>
                                </c:otherwise>
                            </c:choose>
                            <tr>
                                <td>${text.escape(submission.form.name)}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${submission.coreState eq 'Draft'}">
                                            <a href="${bundle.spaceLocation}/submissions/${submission.id}">${text.escape(submission.label)}</a>
                                        </c:when>
                                        <c:when test="${submission.coreState ne 'Draft' && type eq 'Requests'}">
                                            <a href="${bundle.kappLocation}?page=submission&id=${submission.id}">${text.escape(submission.label)}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${bundle.spaceLocation}/submissions/${submission.id}?review">${text.escape(submission.label)}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${space.getUser(submission.createdBy).displayName}</td>
                                <td data-moment>${submission.createdAt}</td>
                                <c:choose>
                                    <c:when test="${type eq 'Approvals' && submission.form.getField('Decision') ne null}">
                                        <c:if test="${submission.getValue('Decision') eq 'Approved'}">
                                            <c:set var="statusColor" value="label-success"/>
                                        </c:if>
                                        <c:if test="${submission.getValue('Decision') eq 'Denied'}">
                                            <c:set var="statusColor" value="label-danger"/>
                                        </c:if>
                                        <c:set var="approvalStatus" value="${submission.getValue('Decision')}"/>
                                        <c:if test="${submission.coreState eq 'Draft'}">
                                            <c:set var="approvalStatus" value="Pending Approval"/>
                                        </c:if>
                                        <td><span class="label ${statusColor}">${approvalStatus}</span></td>
                                    </c:when>
                                    <c:when test="${type eq 'Requests' || type eq 'Tasks'}">
                                        <td><span class="label ${statusColor}">${submission.coreState}</span></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td><span class="label">${submission.coreState}</span></td>
                                    </c:otherwise>
                                </c:choose>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div><!-- /.box-body -->
            <div class="box-footer text-center">
            </div><!-- /.box-footer -->
        </div>
    </section>
</bundle:layout>