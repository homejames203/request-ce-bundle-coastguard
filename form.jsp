<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>
<%@include file="bundle/router.jspf" %>
<bundle:layout page="layouts/form.jsp">
    <bundle:scriptpack>
        <bundle:script src="${bundle.location}/js/form.js" />
        <bundle:script src="${bundle.location}/js/formTables.js" />
    </bundle:scriptpack>
    <bundle:variable name="head">
        <title>${text.escape(form.name)}</title>
        
        <%-- If the form has a "Locked By" field and is not being displayed in review mode. --%>
        <c:if test="${form.getField('Locked By') != null && param.review == null}">
            <script>
                // Set the bundle ready callback function (this is called automatically by the 
                // application after the kinetic form has been initialized/activated)
                bundle.config.ready = function(kineticForm) {
                    // Prepare locking
                    bundle.ext.locking.observe(kineticForm, {
                        lockDuration: 15,
                        lockInterval: 10
                    });
                };
            </script>
        </c:if>
    </bundle:variable>
    <section class="page" data-page="${page.name}">
        <c:if test="${param.embedded eq null}">
            <div class="content-header">
                <c:if test="${not empty form.getAttributeValue('Image')}">
                    <img class="formlogo pull-left" src="${bundle.location}/images/forms/${form.getAttributeValue('Image')}"/>
                </c:if>
                <h1>
                    <c:if test="${form.getAttributeValue('Icon')}">
                        <i class="fa ${form.getAttributeValue('Icon')}"/>
                    </c:if>
                    ${text.escape(form.name)}
                </h1>
                <c:if test="${param.review eq null}">
                    <ol class="breadcrumb">
                        <li>
                            <a href="${bundle.kappLocation}">
                                <i class="fa fa-home"></i> 
                                Home
                            </a>
                        </li>
                        <li class="active">${text.escape(form.name)}</li>
                    </ol>
                </c:if>
            </div>
        </c:if>
        <section class="content">
            <c:if test="${param.review != null && pages.size() > 1}">
                <c:import url="partials/review.jsp" charEncoding="UTF-8"></c:import>
            </c:if>
            <div class="errors"></div>
            <div class="box box-primary">
                <app:bodyContent/>
            </div>
        </section>
    </section>
</bundle:layout>
<script>
// Initialize Bootstrappy field overrides.
bundle.config.fields = {
    text: function(field, triggerFn) {
        $(field.wrapper()).addClass('form-group');
        $(field.wrapper()).find('label').addClass('control-label').removeClass(function (index, css) {
            return (css.match (/(^|\s)col-\S+/g) || []).join(' ');
        });
        $(field.element()).addClass('form-control').removeClass(function (index, css) {
            return (css.match (/(^|\s)col-\S+/g) || []).join(' ');
        });
        $(field.element()).on('change', triggerFn);
    },
    // datetime: function(field, triggerFn) {
    //     $(field.wrapper()).addClass('form-group');
    //     $(field.wrapper()).find('label').addClass('control-label');
    //     $(field.element()).addClass('form-control');
    //     $(field.element()).on('change', triggerFn);
    // },
    dropdown: function(field, triggerFn) {
        $(field.wrapper()).addClass('form-group');
        $(field.wrapper()).find('label').addClass('control-label').removeClass(function (index, css) {
            return (css.match (/(^|\s)col-\S+/g) || []).join(' ');
        });
        $(field.element()).addClass('form-control').removeClass(function (index, css) {
            return (css.match (/(^|\s)col-\S+/g) || []).join(' ');
        });
        $(field.element()).on('change', triggerFn);
    },
    checkbox: function(field, triggerFn) {
        $(field.wrapper()).removeClass('checkbox');
        $(field.wrapper()).find('label').first().addClass('control-label').removeClass(function (index, css) {
            return (css.match (/(^|\s)col-\S+/g) || []).join(' ');
        });
        $(field.wrapper()).find('label').first().removeClass('field-label');
        $(field.wrapper()).children().not(':first-child').addClass('checkbox');
        $(field.wrapper()).children().not(':first-child').attr('style', 'margin-left:20px;');
        $(field.element()).on('change', triggerFn);
    },
    radio: function(field, triggerFn) {
        $(field.wrapper()).removeClass('radio');
        $(field.wrapper()).find('label').first().addClass('control-label').removeClass(function (index, css) {
            return (css.match (/(^|\s)col-\S+/g) || []).join(' ');
        });
        $(field.wrapper()).find('label').first().removeClass('field-label');
        $(field.wrapper()).children().not(':first-child').addClass('radio');
        $(field.wrapper()).children().not(':first-child').attr('style', 'margin-left:20px;');
        $(field.element()).on('change', triggerFn);
    }
};
bundle.config.ready = function(form) {
    // Manipulate Default Buttons on Forms
    $('[data-element-type="button"]').addClass('btn btn-default');
    $('[data-button-type="submit-page"]').addClass('pull-right');
    $('[data-button-type="save"], [data-button-type="previous-page"]').css('margin-right','15px');

    // Loop over each Form Section and Add Appropriate Classes
    $('div.box form section').each(function(){
        // If the Section ONLY contains form buttons, add the box-footer class 
        if( $(this).find('button[data-button-type]').length > 0 && $(this).children().length === $(this).find('button[data-button-type]').length ){
            // Check to make sure it wasn't already added to the section via the builder
            if( !$(this).hasClass('box-footer') ){
                $(this).children().not('h1').wrapAll('<div class="box-footer"></div>');
            }
            // Wrap all other Sections with Box-Body. If the sections have a visible header, wrap it with box-header
        } else if ( !$(this).is('[class^="col-"]') && $(this).children('h1').length > 0) {
            $(this).children().not('h1').wrapAll('<div class="box-body"></div>');
            $(this).children('h1').replaceWith('<div class="box-header with-border"><h3 class="box-title">' + $(this).children('h1').text() + '</h3></div>');
        }
    });

    // Add box-body to forms with no sections
    if( $('div.box form section').length === 0 ){
        $('div.box form').children().wrapAll('<div class="box-body"></div>');
    }

    // Wrap all additional questions that aren't in a section with box body div
    $('div.box form').children('.form-group').not('section').wrapAll('<div class="box-body"></div>');

    // Work around for Date-Time fields that can't be manipulated in bundle.config.fields without overriding
    // default datepicker behavior
    $('form div[data-element-type="wrapper"]:has( >label )').children('label').removeClass('col-sm-12 col-sm-6 col-sm-4');
    $('form div[data-element-type="wrapper"]:has( >label )').children('input').addClass('form-control');

    // Initialize typeahead searching on Kinetic Forms if the library exists
    if(typeAheadSearch !== undefined) { typeAheadSearch(); }

    // Help Text Setup (Popover / Bootstrap)
    $('div[help-text]').each(function(){
        var hlptxt = $(this).attr('help-text')
        $(this).children('label').first().append("&nbsp;&nbsp;", $("<i class='fa fa-info-circle fa-1x' aria-hidden='true' tabindex='0' data-toggle='popover' data-trigger='hover' title='Help' role='button'></i>").attr('data-content', hlptxt));
    });
    $('[data-toggle="popover"]').popover()
};
</script>
