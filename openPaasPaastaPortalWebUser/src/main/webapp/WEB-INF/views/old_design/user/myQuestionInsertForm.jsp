<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../layout/top.jsp" %>
<%@include file="../layout/left.jsp" %>
<%@include file="../layout/alert.jsp" %>

<%--FILE UPLOAD--%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/fileUpload.css'/>">

<div id="myQuestionViewArea" style="display: none;">
    <div class="form-group custom-search-form">
        <div class="col-sm-12 pt10">
            <h4 class="modify_h4"> 문의 하기 </h4>
        </div>
        <div class="panel content-box col-sm-12 col-md-12">
            <form id="myQuestionInsertForm" name="myQuestionInsertForm" class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="control-label col-sm-1 custom_text_align custom_control_label" for="classification"> 분류 </label>
                    <div class="col-sm-11">
                        <select class="form-control modify_form_control" id="classification" name="classification">
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-1 custom_text_align custom_control_label" for="title"> 제목 </label>
                    <div class="col-sm-11">
                        <input type="text" class="form-control modify_form_control toCheckString" id="title" name="title" maxlength="100" >
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-1 custom_text_align custom_control_label" for="content"> 내용 </label>
                    <div class="col-sm-11">
                        <textarea class="form-control modify_form_control" rows="10" id="content" name="content"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-1 custom_text_align custom_control_label" for="reqFile"> 파일 </label>
                    <div class="col-sm-11">
                        <div id="reqFileArea" class="custom-container fl" role="main">
                            <div class="custom-box">
                                <div class="">
                                    <svg class="custom-box-icon" xmlns="http://www.w3.org/2000/svg" width="50" height="43" viewBox="0 0 50 43">
                                        <path d="M48.4 26.5c-.9 0-1.7.7-1.7 1.7v11.6h-43.3v-11.6c0-.9-.7-1.7-1.7-1.7s-1.7.7-1.7 1.7v13.2c0 .9.7 1.7 1.7 1.7h46.7c.9 0 1.7-.7 1.7-1.7v-13.2c0-1-.7-1.7-1.7-1.7zm-24.5 6.1c.3.3.8.5 1.2.5.4 0 .9-.2 1.2-.5l10-11.6c.7-.7.7-1.7 0-2.4s-1.7-.7-2.4 0l-7.1 8.3v-25.3c0-.9-.7-1.7-1.7-1.7s-1.7.7-1.7 1.7v25.3l-7.1-8.3c-.7-.7-1.7-.7-2.4 0s-.7 1.7 0 2.4l10 11.6z"></path>
                                    </svg>
                                    <div id="reqFileLabel" class="req_file_label"><strong> Choose a file </strong><span class="custom-box-dragndrop"> or drag it here. </span></div>
                                </div>
                            </div>
                        </div>
                        <div class="fl">
                            <label for="reqFile" class="sr-only"> FILE </label>
                            <input type="file" name="files[]" id="reqFile" class="req_file_object">
                        </div>
                        <div class="col-sm-12 fl pd0">
                            <div class="panel panel-default">
                                <div class="panel-body pd10" style="min-height: 48px;">
                                    <div class="fl" style="margin: 3px 0 0 0;">
                                        <span id="reqFileName" class="modify_panel_title"> 파일 첨부는 1개 파일만 가능합니다. </span>
                                    </div>
                                    <div id="fileDeleteButtonArea" class="ml10 fl" style="display: none;">
                                        <button type="button" id="btnDeleteFile" class="btn btn-save btn-sm"> 첨부파일 삭제 </button>
                                    </div>
                                    <div class="fr">
                                        <button type="button" id="btnFileSearch" class="btn fr">
                                            <span class="glyphicon glyphicon-folder-open"></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 fl mb10 pd0">
                            <div class="fl">
                                <span class="glyphicon glyphicon-info-sign modify_span_size custom_color_warning"></span><span class="modify_span_size custom_color_warning"> 하위 버전(IE9 이하)의 브라우저는 Drag & Drop 기능을 지원하지 않습니다. </span>
                            </div>
                            <div class="fr">
                                (<span id="reqFileSize" class="modify_span_size"> 0 </span> KB / <%= Constants.MY_QUESTION_LIMIT_FILE_SIZE_MB %> MB)
                            </div>
                        </div>
                    </div>
                </div>

                <%--HIDDEN VALUE--%>
                <input type="hidden" id="no" name="no" value="<c:out value='${MY_QUESTION_NO}' default='' />" />
                <input type="hidden" id="fileName" name="fileName" value="" />
                <input type="hidden" id="filePath" name="filePath" value="" />
                <input type="hidden" id="fileSize" name="fileSize" value="" />
                <input type="hidden" id="orgFileName" name="orgFileName" value="" />
                <input type="hidden" id="orgFilePath" name="orgFilePath" value="" />
                <input type="hidden" id="orgFileSize" name="orgFileSize" value="" />

            </form>
            <div class="form-group">
                <div class="col-sm-12 pd0" align="right">
                    <div class="">
                        <c:set var="insertFlag" value="${INSERT_FLAG}" />
                        <c:set var="checkCudU" value="<%= Constants.CUD_U %>" />
                        <c:choose>
                            <c:when test="${insertFlag eq checkCudU}">
                                <button type="button" class="btn btn-danger btn-sm fl" id="btnDelete">삭제</button>
                                <button type="button" class="btn btn-default btn-sm" id="btnSave">저장</button>
                                <button type="button" class="btn btn-save btn-sm" id="btnCancel">취소</button>
                            </c:when>
                            <c:otherwise>
                                <button type="button" class="btn btn-default btn-sm" id="btnSave">등록</button>
                                <button type="button" class="btn btn-save btn-sm" id="btnCancel">취소</button>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--HIDDEN VALUE--%>
<input type="hidden" id="insertFlag" name="insertFlag" value="<c:out value='${INSERT_FLAG}' default='' />" />


<%--
====================================================================================================
SCRIPT BEGIN
====================================================================================================
--%>


<script type="text/javascript">

    var CATEGORY_LIST_PROC_URL = "<c:url value='/commonCode/getCommonCode' />";
    var HOME_URL = "<c:url value='/myQuestion//myQuestionMain' />";
    var LIST_PROC_URL = "<c:url value='/myQuestion//getMyQuestionList' />";
    var UPLOAD_FILE_PROC_URL = "<c:url value='/myQuestion/uploadFile'/>";
    var DELETE_FILE_PROC_URL = "<c:url value='/myQuestion/deleteFile'/>";
    var INSERT_PROC_URL = "<c:url value='/myQuestion/insertMyQuestion' />";
    var UPDATE_PROC_URL = "<c:url value='/myQuestion/updateMyQuestion' />";
    var DELETE_PROC_URL = "<c:url value='/myQuestion/deleteMyQuestion' />";
    var INIT_MESSAGE = "파일 첨부는 1개 파일만 가능합니다.";
    var REQUEST_FILE;
    var REQUEST_FILE_OBJECT;
    REQUEST_FILE_OBJECT = $('#reqFile');


    // GET CLASSIFICATION LIST
    var getClassificationList = function() {
        procCallAjax(CATEGORY_LIST_PROC_URL + '/' + '<%= Constants.QUESTION_CLASSIFICATION_ID %>', null, procCallbackClassificationList);
    };


    // GET CLASSIFICATION LIST CALLBACK
    var procCallbackClassificationList = function(data) {
        if (RESULT_STATUS_FAIL == data.RESULT) return false;

        var insertFlag = $('#insertFlag').val();
        var objSelectBox = $('#classification');
        var listLength = data.list.length;
        var htmlString = [];

        for (var i = 0; i < listLength; i++) {
            htmlString.push("<option value='" + data.list[i].key + "'>" + data.list[i].value + "</option>");
        }

        objSelectBox.append(htmlString);

        // INSERT
        if (CUD_C == insertFlag) procSetCompleteView();

        // UPDATE
        if (CUD_U == insertFlag) getMyQuestionList();
    };


    // GET LIST
    var getMyQuestionList = function() {
        var param = {no : document.getElementById('no').value,
                     pageSize : 1,
                     pageNo : 1
        };

        procCallAjax(LIST_PROC_URL, param, procCallbackGetMyQuestionList);
    };


    // GET LIST CALLBACK
    var procCallbackGetMyQuestionList = function(data) {
        var classificationObject = $('#classification');
        var titleObject = $('#title');
        var contentObject = $('#content');
        var resultData = data.list[0];

        if (data.list.length < 1) return false;

        classificationObject.val(resultData.classification);
        titleObject.val(resultData.title);
        contentObject.val(resultData.content);

        var fileName = resultData.fileName;

        if ('' != fileName) {
            var filePath = resultData.filePath;
            var fileSize = resultData.fileSize;

            $('#fileName').val(fileName);
            $('#filePath').val(filePath);
            $('#fileSize').val(fileSize);
            $('#orgFileName').val(fileName);
            $('#orgFilePath').val(filePath);
            $('#orgFileSize').val(fileSize);

            procSetFileLabel(fileName, fileSize, filePath);
        }

        procSetCompleteView();
    };


    // SAVE
    var procSave = function() {
        if (!procCheckValidStringSpace()) return false;
        if (!procCheckValid()) return false;

        procCallSpinner(SPINNER_SPIN_START);

        var formData = getFileFormData();

        if (!formData) {
            procInsert({RESULT : RESULT_STATUS_SUCCESS, path : '<%= Constants.NONE_VALUE %>'});
        } else {
            procUploadFile(formData, UPLOAD_FILE_PROC_URL, procInsert);
        }
    };


    // CHECK VALID
    var procCheckValid = function() {
        var reqTitle = $('#title');
        var reqContent = $('#content');

        if (reqTitle.val() == '') {
            showAlert("fail", '<spring:message code="common.info.empty.req.data" />');
            reqTitle.focus();

            return false;
        }

        if (reqContent.val() == '') {
            showAlert("fail", '<spring:message code="common.info.empty.req.data" />');
            reqContent.focus();

            return false;
        }

        return true;
    };


    // INSERT
    var procInsert = function(data) {
        if (RESULT_STATUS_SUCCESS != data.RESULT) {
            showAlert("fail", data.RESULT_MESSAGE);

            procCallSpinner(SPINNER_SPIN_STOP);
            return false;
        }

        var resultPath = data.path;
        if ('<%= Constants.NONE_VALUE %>' != resultPath) $("#filePath").val(resultPath);

        var param = $("#myQuestionInsertForm").serializeObject();
        var insertFlag = $('#insertFlag').val();

        // INSERT
        if (CUD_C == insertFlag) procCallAjax(INSERT_PROC_URL, param, procCallbackInsert);

        // UPDATE
        if (CUD_U == insertFlag) procCallAjax(UPDATE_PROC_URL, param, procCallbackUpdate);
    };


    // INSERT CALLBACK
    var procCallbackInsert = function(data) {
        if (RESULT_STATUS_SUCCESS == data.RESULT) {
            showAlert("success", '<spring:message code="common.info.result.success" />');
            procMovePage(HOME_URL);

        } else {
            procCallSpinner(SPINNER_SPIN_STOP);
            showAlert("fail", data.RESULT_MESSAGE);
        }
    };


    // UPDATE CALLBACK
    var procCallbackUpdate = function(data) {
        if (RESULT_STATUS_SUCCESS == data.RESULT) {
            procDeleteFile();
            showAlert("success", '<spring:message code="common.info.result.success" />');

        } else {
            procCallSpinner(SPINNER_SPIN_STOP);
            showAlert("fail", data.RESULT_MESSAGE);
        }
    };


    // DELETE FILE
    var procDeleteFile = function() {
        if (procDeleteFileCheckValid()) {
            var param = {filePath : $("#orgFilePath").val()};
            procCallAjax(DELETE_FILE_PROC_URL, param, procCallbackDeleteFile);

        } else {
            procMovePage(HOME_URL);
        }
    };


    // DELETE FILE CHECK VALID
    var procDeleteFileCheckValid = function() {
        var doc = document;
        var insertFlag = doc.getElementById('insertFlag').value;
        var orgFilePath = doc.getElementById('orgFilePath').value;
        var filePath = doc.getElementById('filePath').value;

        return !("" != insertFlag && CUD_U == insertFlag && (orgFilePath == filePath || orgFilePath == "" || orgFilePath == null));
    };


    // DELETE
    var procDelete = function() {
        $('div.modal').modal('toggle');
        procCallAjax(DELETE_PROC_URL, {no : $("#no").val()}, procCallbackDelete);
    };


    // DELETE CALLBACK
    var procCallbackDelete = function(data) {
        if (RESULT_STATUS_SUCCESS == data.RESULT) {
            procDeleteFile();
            showAlert("success", '<spring:message code="common.info.result.success" />');

        } else {
            procCallSpinner(SPINNER_SPIN_STOP);
            showAlert("fail", data.RESULT_MESSAGE);
        }
    };


    // // DELETE FILE CALLBACK
    var procCallbackDeleteFile = function() {
        procMovePage(HOME_URL);
    };


    // SET FILE INFO
    var procSetFileInfo = function(reqFile) {
        var reqFileData = reqFile[0];
        var fileName = reqFileData.name;
        var limitFileSizeMb = '<%= Constants.MY_QUESTION_LIMIT_FILE_SIZE_MB %>';
        var limitFileSize = parseInt(limitFileSizeMb) << 20;
        var orgFileSize = reqFileData.size;

        if (limitFileSize < orgFileSize) {
            var alertMessage = '파일 크기는 ' + limitFileSizeMb + ' MB 를 넘을 수 없습니다.';
            showAlert("fail", alertMessage);
            window.scrollTo(0, 0);

            return false;

        } else {
            showAlert("success", '<spring:message code="common.system.welcome.message" />');
        }

        REQUEST_FILE = reqFile;

        procSetFileLabel(fileName, orgFileSize, '<%= Constants.NONE_VALUE %>');
    };


    // SET FILE LABEL
    var procSetFileLabel = function(reqFileName, reqOrgFileSize, reqFilePath) {
        if (null == reqFileName || '' == reqFileName) return false;

        var fileSize = procConvertFormatNumber(procCalculateFloor(parseInt(reqOrgFileSize) / 1024, 2));
        var fileName = reqFileName + " (" + fileSize + " KB)";

        var doc = document;
        doc.getElementById('fileName').value = reqFileName;
        doc.getElementById('fileSize').value = reqOrgFileSize;

        if ('<%= Constants.NONE_VALUE %>' != reqFilePath) {
            var linkHtml = '<a href="javascript:void(0);" onclick="procDownload(\'' + reqFilePath + '\', \'' + reqFileName + '\')">' + fileName + '</a>';
            $('#reqFileName').html(linkHtml);

        } else {
            $('#reqFileName').text(fileName);
        }

        $('#reqFileLabel').text(fileName);
        $('#reqFileSize').text(fileSize);
        $('#fileDeleteButtonArea').show();

        // BIND :: BUTTON EVENT
        $("#btnDeleteFile").on("click", function() {
            procDeleteFileLabel();
        });

        var objBox = $('.custom-box');
        objBox.fadeOut('fast', function () {
            objBox.addClass('custom-selected-file');
            objBox.fadeIn('fast');
        });
    };


    // DELETE FILE LABEL
    var procDeleteFileLabel = function() {
        var reqFileLabel = $('#reqFileLabel');
        var reqFileName = $('#reqFileName');
        var fileDeleteButtonArea = $('#fileDeleteButtonArea');

        fileDeleteButtonArea.hide();
        reqFileName.text(INIT_MESSAGE);

        var tempHtml = '<strong> Choose a file </strong><span class="custom-box-dragndrop"> or drag it here. </span>';
        reqFileLabel.html(tempHtml);

        var doc = document;
        doc.getElementById('fileName').value = '';
        doc.getElementById('filePath').value = '';
        doc.getElementById('fileSize').value = '';
        $('#reqFileSize').text('0');

        var objBox = $('.custom-box');
        objBox.fadeOut('fast', function () {
            objBox.removeClass('custom-selected-file');
            objBox.fadeIn('fast');
        });
    };


    // SET COMPLETE VIEW
    var procSetCompleteView = function() {
        $('#myQuestionViewArea').show();
        $('#custom_footer').show();
        procCallSpinner(SPINNER_SPIN_STOP);

        $('#title').focus();
    };


    // CALCULATE FLOOR
    var procCalculateFloor = function(reqNumber, reqPosition) {
        var digits = Math.pow(10, reqPosition);
        var num = Math.round(reqNumber * digits) / digits;

        return num.toFixed(reqPosition);
    };


    // CONVERT FORMAT NUMBER
    var procConvertFormatNumber = function (reqString) {
        return reqString.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    };


    // INIT PAGE
    var procInitPage = function() {
        $('#myQuestionViewArea').hide();
        $('#custom_footer').hide();
        procCallSpinner(SPINNER_SPIN_START);

        $('.custom_text_align').css('text-align', 'left');
        $('#reqFileName').text(INIT_MESSAGE);

        getClassificationList();
    };


    // BIND :: BUTTON EVENT
    $("#reqFileArea, #btnFileSearch").on("click", function() {
        REQUEST_FILE_OBJECT.click();
    });


    // BIND :: FILE CHANGE
    REQUEST_FILE_OBJECT.on("change", function() {
        procSetFileInfo($(this)[0].files);
    });


    // BIND :: BUTTON EVENT
    $("#btnSave").on("click", function() {
        procSave();
    });


    // BIND :: BUTTON EVENT
    $("#btnCancel").on("click", function() {
        procMovePage(HOME_URL);
    });


    // BIND :: BUTTON EVENT
    $("#btnDelete").on("click", function() {
        procPopup('내 문의', "<spring:message code='common.info.popup.delete.message' />", 'procDelete();');
    });


    // ON LOAD
    $(document.body).ready(function() {
        procInitPage();
    });

</script>

<%--FILE UPLOAD--%>
<script type="text/javascript" src="<c:url value='/resources/js/fileUpload.js' />"></script>


<%--
====================================================================================================
SCRIPT END
====================================================================================================
--%>


<%@include file="../layout/bottom.jsp" %>
