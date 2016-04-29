<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<!-- The time line -->
<c:if test="${empty submission}">
    <c:set var="submission" value="${Submissions.retrieve(param.id)}" scope="request"/>
</c:if>

<c:forEach var="run" items="${TaskRuns.find(submission)}">
    <ul class="timeline">
        <!-- timeline time label -->
        <li class="time-label">
            <span data-moment class="bg-red">${submission.submittedAt}/></span>
        </li>
        <!-- /.timeline-label -->
        <!-- timeline item -->
        <c:forEach var="task" items="${run.tasks}">
            <c:set var="taskStatusIcon" value="fa-check-square-o bg-green"/>
            <c:if test="${task.status eq 'Work In Progress'}">
                <c:set var="taskStatusIcon" value="fa-wrench bg-yellow"/>
            </c:if>
            <li>
                <i class="fa ${taskStatusIcon}"></i>
                <div class="timeline-item">
                    <span class="time"><i class="fa fa-clock-o"></i> Task Status: ${text.escape(task.status)} </span>
                    <h3 class="timeline-header">${text.escape(task.name)}</h3>
                    <div class="timeline-body">
                        <dl>
                            <dt>Started at: </dt>
                            <dd data-moment-short>${task.createdAt}</dd>
                            <dt>Last Updated at: </dt>
                            <dd data-moment-short>${task.updatedAt}</dd>
                        </dl>
                        <c:if test="${not empty task.messages}">
                            <a class="btn btn-primary btn-xs" data-toggle="collapse" href="#messages-${task.id}">Read more</a>
                            <div class="collapse" id="messages-${task.id}">
                                <ul class="list-unstyled">
                                    <li></li>
                                    <c:forEach var="entry" items="${task.messages}">
                                        <li><span data-moment-short>${entry.date}</span> -- ${text.escape(entry.message)}</li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </c:if>
                    </div>
                </div>
            </li>
        </c:forEach> <!-- END timeline item -->
        <li>
          <i class="fa fa-clock-o bg-gray"></i>
        </li>
    </ul>
</c:forEach>