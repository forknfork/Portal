<!--
=================================================================
* 시  스  템  명 : PaaS-TA 관리자 포탈
* 업    무    명 : 카탈로그
* 프로그램명(ID) : starterForm.jsp(앱템플릿카탈로그관리)
* 프로그램  개요 : 앱템플릿 카탈로그를 등록/수정하는 화면
* 작    성    자 : 김도준
* 작    성    일 : 2016.07.07
=================================================================
수정자 / 수정일 :
수정사유 / 내역 :
=================================================================
-->
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="../common/common.jsp"%>
<script type="text/javascript" src="<c:url value='/resources/js/fileUpload.js' />"></script>


    <div class="col-sm-6 pt30">
        <c:choose>
            <c:when test="${INSERT_FLAG eq Constants.CUD_U}">
                <h4 class="modify_h4 fwn">앱 템플릿 상세</h4>
            </c:when>
            <c:when test="${INSERT_FLAG eq Constants.CUD_C}">
                <h4 class="modify_h4 fwn">앱 템플릿 등록</h4>
            </c:when>
        </c:choose>
    </div>

    <!--인스턴스 설정-->
    <div class="col-md-11 col-md-offset-14">
        <form class="form-horizontal" role="form" id="starterForm" name="starterForm">
            <input type="hidden" id="thumb_image_path" value="${thumb_image_path}">

            <div class="form-group">
                <label class="control-label col-sm-2" for="starterName">이름</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="starterName">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="categoryList">분류</label>
                <div class="col-sm-9">
                    <select class="form-control" id="categoryList" style="background:url(/resources/images/btn_down.png) no-repeat right; background-color:#fafafa;">
                        <%-- Category Area --%>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="buildPackList">앱 개발환경</label>
                <div class="col-sm-9">
                    <select class="form-control" id="buildPackList" style="background:url(/resources/images/btn_down.png) no-repeat right; background-color:#fafafa;">
                        <%-- build pack area --%>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="servicePackList">서비스</label>
                <div class="col-sm-5" style="width: 33.2%">
                    <select multiple class="form-control" id="servicePackList" name="servicePackList" style="height: 90px; line-height: 90px;">
                        <%-- service pack area --%>
                    </select>
                </div>

                <div class="col-sm-1" style="text-align:center; margin:29px 1.6% 0px 0.1%;">
                    <div><span type="button" class="glyphicon glyphicon-chevron-right" style="font-size:22px;color:#ababab; cursor: pointer;"
                               onClick="SelectMoveRows(document.starterForm.servicePackList, document.starterForm.selectedServicePackList)"></span></div>
                    <div><span type="button" class="glyphicon glyphicon-chevron-left" style="font-size:22px;color:#818181; cursor: pointer;"
                               onClick="SelectMoveRows(document.starterForm.selectedServicePackList, document.starterForm.servicePackList)"></span></div>
                </div>

                <div class="col-sm-5" style="width: 33.2%">
                    <select multiple class="form-control" id="selectedServicePackList" name="selectedServicePackList" style="height: 90px; line-height: 90px;">
                        <%-- selected service pack area --%>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="thumbnail">썸네일<br><font style="font-size:13px;color:#ababab;">(50X50)</font></label>

                <div class="col-sm-8">
                    <input type="text" class="form-control" id="thumbnail" style="width: 102%; background: white; cursor: default" disabled>
                </div>
                <div class="col-sm-1">
                    <button type="button" class="btn btn-cancel btn-sm tar" style="margin-top:11px;margin-left:-5px;" onclick="$('#hiddenThumbnail').click()">
                        <span class="glyphicon glyphicon-floppy-disk"></span>&nbsp;파일찾기
                    </button>
                    <input type="file" id="hiddenThumbnail" style="display: none">
                </div>

                <div>
                    <div class="col-sm-9">
                        <div id="divPreview" class="divPreview"  style="width: 99.9%;">
                            <div class="fl">
                                <a href="javascript:void(0);" class="custom-thumbnail">
                                    <img id="preview" src="" >
                                </a>
                            </div>
                            <div class="fl" style="padding:15px 10px;">
                                <a id="thumbname"></a>
                            </div>
                            <div class="divImageInfo fl ml20">
                                <label id="labelThumbName" style="padding-right: 20px"></label>
                                <button id="btnResetImg" type="button" class="btn-del" aria-label="썸네일 지우기">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="useYn">공개</label>
                <div class="col-sm-9 mt10">
                    <label class="radio-inline"><input type="radio" id="useYn" name="useYn" value="Y" checked="checked">Y</label>
                    <label class="radio-inline"><input type="radio" name="useYn" value="N">N</label>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="summary">요약</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="summary">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="description">설명</label>
                <div class="col-sm-9">
                    <textarea class="form-control" rows="5" id="description"></textarea>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-1 col-sm-9" align="right" id = "statusActivity">
                    <div class="divButtons" style="width:97.8%;">
                        <c:choose>
                            <c:when test="${INSERT_FLAG eq CONSTANT_CUD}">
                                <button type="button" class="btn btn_del2 fl ml-22" id="btnDelete">삭제</button>
                                <button type="button" class="btn btn-cancel2 btn-sm" id="btnCancel">취소</button>
                                <button type="button" class="btn btn-save btn-sm" id="btnRegist">저장</button>
                            </c:when>
                            <c:otherwise>
                                <button type="button" class="btn btn-cancel2 btn-sm" id="btnCancel">취소</button>
                                <button type="button" class="btn btn-save btn-sm" id="btnRegist">등록</button>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>
            </div>

            <input type="hidden" id="resInsertFlag" name="resInsertFlag" value="<c:out value='${INSERT_FLAG}' default='' />" />
            <input type="hidden" id="resCudU" name="resCudU" value="<c:out value='${CONSTANT_CUD}' default='' />" />

            <input type="hidden" id="oldThumbImgPath" name="oldThumbImgPath" value="" />

            <input type="hidden" id="thumbImgPath" name="thumbImgPath" value="" />
            <input type="hidden" id="thumbImgName" name="thumbImgName" value="" />
            <input type="hidden" id="no" name="no" value="<c:out value='${REQUEST_NO}' default='' />" />

        </form>
    </div>
    <!--//인스턴스 설정-->
    <div class="row">
    </div>



    <%--////////////////////////////////////////////////////////////////////////////////////////////////////--%>
    <%--CODE :: END--%>
    <%--////////////////////////////////////////////////////////////////////////////////////////////////////--%>

    <%--FOOTER--%>
    <%@ include file="../common/footer.jsp"%>

    <%--
    ====================================================================================================
    SCRIPT BEGIN
    ====================================================================================================
    --%>

    <script type="text/javascript">
        var CATEGORY_HOME_URL = "<c:url value='/catalog/catalogMain' />";
        var CATEGORY_LIST_PROC_URL = "<c:url value='/commonCode/getCommonCode' />";

        var INSERT_FLAG = "<c:out value='${INSERT_FLAG}' default='' />";
        var DELETE_FLAG = false;

        var STARTER_CATALOG_ID = "<%= Constants.STARTER_CATALOG_ID %>";

        var BUILD_PACK_NAMES_LIST_PROC_URL = "<c:url value='/catalog/getBuildPackNamesList' />";
        var SERVICE_PACK_NAMES_LIST_PROC_URL = "<c:url value='/catalog/getServicePackNamesList' />";

        var GET_PROC_URL = "<c:url value='/catalog/getOneStarterCatalog' />";
        var INSERT_PROC_URL = "<c:url value='/catalog/insertStarterCatalog' />";
        var DUPLICATED_PROC_URL = "<c:url value='/catalog/getStarterCatalogCount' />";
        var UPDATE_PROC_URL = "<c:url value='/catalog/updateStarterCatalog' />";
        var DELETE_PROC_URL = "<c:url value='/catalog/deleteStarterCatalog' />";

        var SAVED_NAME = null;
        var SAVED_THUMBNAIL_NAME = '';
        var SAVED_THUMBNAIL_PATH = '';

        var IMAGE_UPLOAD_PROC_URL = "<c:url value='/catalog/uploadThumbnailImage'/>";
        var IMAGE_DELETE_PROC_URL = "<c:url value='/catalog/deleteThumbnailImage'/>";
        var MAX_SIZE = 500; // KB

        var RESULT_STATUS_SUCCESS = "SUCCESS";
        var RESULT_STATUS_FAIL = "FAIL";

        var buildPackCategoryNoFromDB;
        var servicePackCategoryNoListFromDB;


        /******************************************************************************************* CRUD -> **************/
        function registerStarter(data) {
            var oldPath = $("#oldThumbImgPath").val();
            var thumbpath = $("#thumbImgPath").val();

            if (oldPath != '' && thumbpath == '') procDeleteFile();

            var starterName = $("#starterName").val();
            var categoryList = $("#categoryList").val(); // classification
            var thumbname = $("#thumbImgName").val();
            var useYn = $("input[name=useYn]:checked").val();
            var summary = $("#summary").val();
            var description = $("#description").val();
            var buildPackList = $("#buildPackList").val(); // no

            var selectedServicePackList = [];
            var getList = document.getElementById("selectedServicePackList");
            for (var i = 0; i < getList.length; i++) {
                selectedServicePackList[i] = getList.options[i].value;
            }

            param = {
                name : starterName,
                classification : categoryList,
                thumbImgName : thumbname,
                thumbImgPath : thumbpath,
                useYn : useYn,
                summary : summary,
                description : description,
                buildPackCategoryNo : buildPackList,
                servicePackCategoryNoList : selectedServicePackList
            };

            if ("" != INSERT_FLAG && "<%= Constants.CUD_C %>" == INSERT_FLAG) { // INSERT
                procCallAjax(INSERT_PROC_URL, param, procCallbackCRUDStarterCatalog);

            } else { // UPDATE

                var no = ${REQUEST_NO};

                param2 = {
                    no : no,
                    starterCategoryNo : no
                }
                $.extend(param, param2);
                procCallAjax(UPDATE_PROC_URL, param, procCallbackCRUDStarterCatalog);
            }

        }

        function deleteStarter() {

            procDeleteFile();

        }

        var procCallbackCRUDStarterCatalog = function (data) { // CRUD 공동 사용중

            if (RESULT_STATUS_SUCCESS == data.RESULT) {

                procAlert("success", '<spring:message code="common.info.result.success" />'); // message api에서 입력안함
                procMovePage(CATEGORY_HOME_URL);

            } else if (RESULT_STATUS_FAIL == data.RESULT) {

                procAlert("danger", data.RESULT_MESSAGE);
            }
        }

        /******************************************************************************************* <- CRUD **************/

        // PROCESS CHECK VALID
        var procCheckValid = function() {

            // starter name
            var starterName = $('#starterName').val();
            if (starterName == '') {
                procAlert("warning", '<spring:message code="common.info.empty.req.data" />');
                $('#starterName').focus();
                return false;
            }

            // service pack list
            var reqServicePack = [];
            var getList = document.getElementById("selectedServicePackList");
            for (var i = 0; i < getList.length; i++) {
                reqServicePack[i] = getList.options[i].value;
            }

            if (reqServicePack == '') {
                procAlert("warning", '<spring:message code="common.info.empty.req.data" />');
                $('#selectedServicePackList').focus();
                return false;
            }

            // summart
            var summary = $('#summary').val();
            if (summary == '') {
                procAlert("warning", '<spring:message code="common.info.empty.req.data" />');
                $('#summary').focus();
                return false;
            }

            return true;
        };


        // PROCESS CHECK DUPLICATED NAME
        function procCheckDuplicatedName() {

            if (!procCheckValidStringSpace()) return false;
            if (!procCheckValid()) return false; // valid check

            var currentName = $("#starterName").val();

            if (SAVED_NAME != currentName) {    // 이름 변경 -> DB에 동일 이름 있는지 체크 후 -> 파일업로드체크

                var param = {name: $('#starterName').val()};

                procCallAjax(DUPLICATED_PROC_URL, param, procCallBackDuplicated);

            } else {                            // 파일업로드체크
                checkFileUpload2();
            }

        };

        var procCallBackDuplicated = function (data) {

            if (data != -1 && RESULT_STATUS_SUCCESS != data.RESULT) { // db 중복 체크
                $('#starterName').focus();
                return false;
            } else { // 중복없음
                checkFileUpload2();
            }
        }

        /************************************************************************************** file upload 관련 -> ******/

        function checkFileUpload2() {

            var formData = getFileFormData();
            if (formData != undefined) uploadFile(formData);

            else registerStarter();
        }

        // UPLOAD FILE
        var uploadFile = function(formData) {
            $.ajax({
                url : IMAGE_UPLOAD_PROC_URL
                , method : "POST"
                , processData : false
                , contentType : false
                , data : formData
                , dataType : "json"
                , success : function(data){

                    procCallbackUploadFile(data);
                },
                error: function(xhr, status, error) {
                    procAlert("danger", JSON.parse(xhr.responseText).customMessage);
                },
                complete : function(data) {
                }
            });
        };

        // UPLOAD FILE CALLBACK
        var procCallbackUploadFile = function(data) {
            if (RESULT_STATUS_SUCCESS == data.RESULT) {

                $("#thumbImgPath").val(data.path);
                $("#thumbImgName").val($("#labelThumbName").text());

                var oldPath = $("#oldThumbImgPath").val();
                if (oldPath != null || oldPath != '') procDeleteFile();

                registerStarter();

            } else if (RESULT_STATUS_FAIL == data.RESULT) {
                procAlert("danger", data.RESULT_MESSAGE);
            }
        };

        // PREVIEW
        var setPreView = function(objThumbnail) {
            var this_form = objThumbnail[0];
            var file    = this_form.files[0];
            var preview = $('#preview');
            var img_size = 0;

            if (file) {
                // image file check
                var pathHeader = this_form.value.lastIndexOf("\\");
                var pathMiddle = this_form.value.lastIndexOf(".");
                var pathEnd = this_form.value.length;
                var filename = this_form.value.substring(pathHeader + 1, pathEnd);
                var ext = this_form.value.substring(pathMiddle + 1, pathEnd).toLowerCase();

                if (ext != "jpg" && ext != "png" && ext != "gif") {
                    procAlert('warning', '이미지 파일(jpg, png, gif)만 등록 가능합니다.');
                    //jasny bootstrap fileinput을 이용함. 참고는 http://www.jasny.net/bootstrap/javascript/#fileinput 참조바람
                    resetThumbnail();
                    return false;
                }

                // file 읽어 오기
                var reader = new FileReader();

                reader.onload = function(e) {
                    $('#divPreviewMessage').attr('style', 'display: none;');
                    var image = new Image();
                    // 파일의 내용을 읽어서 넣어준다.
                    image.src = e.target.result;
                    img_size = Math.round(e.total / 1024);
                };

                reader.onloadend = function (e) {
                    if (img_size > MAX_SIZE) {
                        resetThumbnail();

                        var alertMessage = '이미지 크기는 ' + MAX_SIZE + 'Kb를 넘을 수 없습니다.';
                        var divPreviewMessage = $("#divPreviewMessage");

                        divPreviewMessage.text(alertMessage);
                        divPreviewMessage.attr('style', 'display: block;');

                        procAlert('warning', alertMessage);

                        return false;
                    }
                    $('#divPreview').attr('style', 'display: block; height: 94px;');e
                    preview.attr("src", e.target.result);

                    $("#labelThumbName").text(filename);

                };

                reader.readAsDataURL(file);

            } else {
                resetThumbnail();
            }
        };

        // RESET THUMBNAIL
        var resetThumbnail = function() {
        //    $('#thumbnail').filestyle('clear');
            $('#preview').attr('src', '');
            $("#labelThumbName").text('');

            $('#divPreview').attr('style', 'display: none;');
            $('#divPreviewMessage').attr('style', 'display: none;');

        };

        var procDeleteFile = function() {
            var oldPath = $("#oldThumbImgPath").val();

            if (oldPath != null || oldPath != '') {
                var param = {
                    thumbImgPath : oldPath
                };

                procCallAjax(IMAGE_DELETE_PROC_URL, param, procCallbackDeleteFile);
            }
        };

        var procCallbackDeleteFile = function(data) {
            if (RESULT_STATUS_SUCCESS == data.RESULT) {
                $("#oldThumbImgPath").val('');
            }

            // DELETE
            if (DELETE_FLAG) {
                var no = ${REQUEST_NO};

                param = {
                    no : no,
                    starterCategoryNo : no
                }
                procCallAjax(DELETE_PROC_URL, param, procCallbackCRUDStarterCatalog);

            }
            // UPDATE
            else {// 삭제 후 새파일 업로드! // true check?
                var formData = getFileFormData();

                if (formData != undefined) uploadFile(formData);
                else registerStarter();

            }
        };
        /************************************************************************************** <- file upload 관련 ******/

        /*******************/
        /* .ready function */
        /*******************/
        $(document.body).ready(function() {
            param = {

            };

            if (INSERT_FLAG == "<%= Constants.CUD_C %>") { // 등록

                buildPackCategoryNoFromDB = -1;
                servicePackCategoryNoListFromDB = null;

                procCallAjax(BUILD_PACK_NAMES_LIST_PROC_URL, param, procCallbackGetBuildPackNamesList);
                procCallAjax(SERVICE_PACK_NAMES_LIST_PROC_URL, param, procCallbackGetServicePackNamesList);
                procCallAjax(CATEGORY_LIST_PROC_URL + "/" + STARTER_CATALOG_ID, null, procCallbackCategoryList);


            } else { // 상세

                var reqNo = ${REQUEST_NO};

                if (reqNo != -1) {
                    param = {
                        no : reqNo
                    }
                    procCallAjax(GET_PROC_URL, param, procCallbackGetOneStarter);

                }
            }
            // init Thumbnail
            resetThumbnail();

            $("#hiddenThumbnail").on("change", function(){
                setPreView($(this));
            });

        });

        var procCallbackGetOneStarter = function (data) {

            SAVED_NAME = data.info.name;
            SAVED_THUMBNAIL_NAME = data.info.thumbImgName;
            SAVED_THUMBNAIL_PATH = data.info.thumbImgPath;

            $("#labelThumbName").text(data.info.thumbImgName);
            $("#oldThumbImgPath").val(data.info.thumbImgPath);

            DELETE_FLAG = false;

            $("#starterName").val(data.info.name);
            $("#categoryList").val(data.info.classification);
            $("#thumbImgName").val(data.info.thumbImgName);
            $("#thumbImgPath").val(data.info.thumbImgPath);

            if (data.info.thumbImgPath == '' || data.info.thumbImgPath == null) {
                $('#divPreview').hide();

            } else {
                $('#divPreview').attr('style', 'display: block; height: 94px;');
                $('#preview').attr('src', IMAGE_PATH_PREFIX+$("#thumbImgPath").val());
            }

            var useYnValue = data.info.useYn;
            if (useYnValue == "Y") $("input:radio[name='useYn']:radio[value='Y']").attr("checked", true);
            else if (useYnValue == "N") $("input:radio[name='useYn']:radio[value='N']").attr("checked", true);

            $("#summary").val(data.info.summary);
            $("#description").val(data.info.description);

            buildPackCategoryNoFromDB = data.info.buildPackCategoryNo;
            servicePackCategoryNoListFromDB = data.info.servicePackCategoryNoList;

            procCallAjax(BUILD_PACK_NAMES_LIST_PROC_URL, param, procCallbackGetBuildPackNamesList);
            procCallAjax(SERVICE_PACK_NAMES_LIST_PROC_URL, param, procCallbackGetServicePackNamesList);

            procCallAjax(CATEGORY_LIST_PROC_URL + "/" + STARTER_CATALOG_ID, null, procCallbackCategoryList);
        }

        var procCallbackGetBuildPackNamesList = function (data) {

            if (buildPackCategoryNoFromDB == -1) {  // 등록
                for (var i = 0; i < data.list.length; i ++) {
                    $("#buildPackList").append("<option value='"+data.list[i].no+"'> "+data.list[i].name+" </option>");
                }
            }
            else {                                   // 상세
                for (var i = 0; i < data.list.length; i ++) {
                    if (data.list[i].no == buildPackCategoryNoFromDB)
                        $("#buildPackList").append("<option value='"+data.list[i].no+"' selected='selected'> "+data.list[i].name+" </option>");
                    else
                        $("#buildPackList").append("<option value='"+data.list[i].no+"'> "+data.list[i].name+" </option>");
                }
            }
        }

        var procCallbackGetServicePackNamesList = function (data) {

            if (servicePackCategoryNoListFromDB == null) { // 등록
                for (var i = 0; i < data.list.length; i ++) {
                    $("#servicePackList").append("<option value='"+data.list[i].no+"'> "+data.list[i].name+" </option>");
                }
            }
            else { // 상세

                for (var i = 0; i < data.list.length; i ++) {

                    if (servicePackCategoryNoListFromDB.includes(data.list[i].no)) {
                        $("#selectedServicePackList").append("<option value='" + data.list[i].no + "'> " + data.list[i].name + " </option>");
                    } else {
                        $("#servicePackList").append("<option value='" + data.list[i].no + "'> " + data.list[i].name + " </option>");
                    }
                }

            }
        }

        // GET CATEGORY LIST CALLBACK
        var procCallbackCategoryList = function(data) {

            if (RESULT_STATUS_FAIL == data.RESULT) return false;

            var objSelectBox = $('#categoryList');
            var listLength = data.list.length;
            var htmlString = [];

            for (i = 0; i < listLength; i++) {
                htmlString.push("<option value='" + data.list[i].key + "'>" + data.list[i].value + "</option>");
            }

            objSelectBox.append(htmlString);

        };


        /************************************************************/
        /* service pack box moves 관련 (SelectMoveRows, SelectSort) */
        /************************************************************/
        function SelectMoveRows(SS1,SS2)
        {
            var SelID='';
            var SelText='';
            // Move rows from SS1 to SS2 from bottom to top
            for (i=SS1.options.length - 1; i>=0; i--)
            {
                if (SS1.options[i].selected == true)
                {
                    SelID=SS1.options[i].value;
                    SelText=SS1.options[i].text;
                    var newRow = new Option(SelText,SelID);
                    SS2.options[SS2.length]=newRow;
                    SS1.options[i]=null;
                }
            }
            SelectSort(SS2);
        }
        function SelectSort(SelList)
        {

            var ID='';
            var Text='';
            for (x=0; x < SelList.length - 1; x++)
            {
                for (y=x + 1; y < SelList.length; y++)
                {
                    if (SelList[x].value > SelList[y].value)
                    {
                        // Swap rows
                        ID=SelList[x].value;
                        Text=SelList[x].text;
                        SelList[x].value=SelList[y].value;
                        SelList[x].text=SelList[y].text;
                        SelList[y].value=ID;
                        SelList[y].text=Text;
                    }
                }
            }
        }

        /***********/
        /* Buttons */
        /***********/
        // BIND :: BUTTON EVENT
        $("#btnRegist").on("click", function() {

            // 이름 체크 -> 파일 체크 -> C/U 결정
            procCheckDuplicatedName();

        });

        // BIND :: BUTTON EVENT
        $("#btnCancel").on("click", function() {
            procMovePage(CATEGORY_HOME_URL + "/<%= Constants.TAB_NAME_STARTER %>");
        });

        // BIND :: BUTTON EVENT
        $("#btnDelete").on("click", function() {
            DELETE_FLAG = true;
            procPopup('카탈로그', DELETE_MESSAGE, 'procDeleteFile();');
        });

        $("#btnResetImg").on("click", function() {

            $("#thumbImgPath").val('');
            $("#thumbImgName").val('');
            $("#labelThumbName").text('');

            resetThumbnail();
        });

    </script>
    <%--
    ====================================================================================================
    SCRIPT END
    ====================================================================================================
    --%>
