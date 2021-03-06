<!--
=================================================================
* 시  스  템  명 : PaaS-TA 관리자 포탈
* 업    무    명 : 공통코드
* 프로그램명(ID) : commonCodeMain.jsp(공통코드관리)
* 프로그램  개요 : 공통코드 조회, 등록, 수정, 삭제하는 화면
* 작    성    자 : 김도준
* 작    성    일 : 2016.06.20
=================================================================
수정자 / 수정일 :
수정사유 / 내역 :
=================================================================
-->
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="../common/common.jsp"%>

<%--AXIS COMMCON--%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/axisj/ui/arongi/AXJ.css'/>">
<script type="text/javascript" src="<c:url value='/resources/axisj/lib/AXJ.js' />"></script>

<%--AXIS UI--%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/axisj/ui/arongi/AXInput.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/axisj/ui/arongi/AXSelect.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/axisj/ui/arongi/AXGrid.css'/>">
<script type="text/javascript" src="<c:url value='/resources/axisj/lib/AXInput.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/axisj/lib/AXSelect.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/axisj/lib/AXGrid.js' />"></script>


<%--TITLE--%>
<div class="col-sm-6 pt30">
    <h4 class="modify_h4 fwn">코드 관리</h4>
</div>

<%--SEARCH FORM--%>
<form id="searchForm" onsubmit="return false;">
<div class="content-box2 col-md-12 col-md-offset-13">
    <div class="box">
        <div class="form-group col-sm-3 mr-25">
            <label for="useYn" class="control-label-white col-sm-4 mt13 ml-10"> 사용여부 </label>
            <div class="col-sm-8">
                <select id="useYn" name="useYn" class="form-control" style="background:url(/resources/images/btn_down.png) no-repeat right; background-color:#fafafa;">
                    <option value="<%= Constants.SEARCH_TYPE_ALL %>"> 전체 </option>
                    <option value="<%= Constants.USE_YN_Y %>"> 사용 </option>
                    <option value="<%= Constants.USE_YN_N %>"> 미사용 </option>
                </select>
            </div>
        </div>
        <div class="form-group col-sm-3 mr-25">
            <label for="searchType" class="control-label-white col-sm-4 mt13"> 검색유형 </label>
            <div class="col-sm-8">
                <select id="searchType" name="searchType" class="form-control" style="background:url(/resources/images/btn_down.png) no-repeat right; background-color:#fafafa;">
                    <option value="<%= Constants.SEARCH_TYPE_ALL %>">전체</option>
                    <option value="<%= Constants.SEARCH_TYPE_NAME %>">코드 이름</option>
                    <option value="<%= Constants.SEARCH_TYPE_VALUE %>">Value</option>
                </select>
            </div>
        </div>
        <div class="form-group col-sm-6 mr-25">
            <label for="searchKeyword"class="control-label-white col-sm-4 mt13 ml-10" style="width: 15%"> 검색어 </label>
            <div class="input-group col-sm-8" style="widows: 120%;">
                <input type="text" id="searchKeyword" class="form-control2 ml10" style="width: 99%;" placeholder="검색어를 입력하세요." onkeypress="procCheckSearchFormKeyEvent(event);">
                <div class="input-group-btn">
                    <button type="button" id="btnSearch" class="btn" style="margin: 11px 0 0 0; color: #c4c3c3; background-color: #f7f7f9; height: 30px;">
                        <span class="glyphicon glyphicon-search" style="top: -1px; left: 4px;"></span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="hiddenValuesCommonCodeGroup"></div>
<div id="hiddenValuesCommonCodeDetail"></div>
</form>


<%--SEARCH FORM--%>
<%--<form id="searchForm" class="form-inline clearfix" onsubmit="return false;">
    <div class="search_box">
        <h2>코드관리</h2>
        <div class="box">
            <div class="form-group">
                <div class="">
                    <label for="useYn" class="control-label">사용 여부</label>
                    <select id="useYn" name="useYn" class="form-control">
                        <option value="<%= Constants.SEARCH_TYPE_ALL %>">전체</option>
                        <option value="<%= Constants.USE_YN_Y %>">사용</option>
                        <option value="<%= Constants.USE_YN_N %>">미사용</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="searchType" class="control-label">검색 유형</label>
                <select id="searchType" name="searchType" class="form-control">
                    <option value="<%= Constants.SEARCH_TYPE_ALL %>">전체</option>
                    <option value="<%= Constants.SEARCH_TYPE_NAME %>">코드 이름</option>
                    <option value="<%= Constants.SEARCH_TYPE_VALUE %>">Value</option>
                </select>
            </div>
            <div class="form-group">
                <label for="searchKeyword" class="control-label">검색어</label>
                <div class="input-group">
                    <input type="text" maxlength="100" id="searchKeyword" class="form-control" placeholder="검색어를 입력하세요."
                    onkeypress="procCheckSearchFormKeyEvent(event);">
                    <div class="input-group-btn">
                        <button type="button" id="btnSearch" class="btn btn_search">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="hiddenValuesCommonCodeGroup"></div>
    <div id="hiddenValuesCommonCodeDetail"></div>
</form>--%>


<div class="panel content-box col-sm-12 col-md-12 mt-50 col-md-offset-13 w98">
<div class="box">
    <div class="custom-boxL">
        <%--<div class="custom-content-box">--%>
            <div class="clearfix custom-mb5">
                <div class="fr">
                    <button type="button" class="btn btn-cancel2 btn-sm" onclick="fnObj.append();">추가</button>
                    <button type="button" class="btn btn-save btn-sm" onclick="procSaveList(myGrid,
                            '<%= Constants.PROC_NAME_COMMON_CODE_GROUP %>');">저장</button>
                </div>
            </div>
            <div id="AXGridTarget">
            </div>
        <%--</div>--%>
    </div>

    <div class="custom-boxR">
        <%--<div class="content-box">--%>
            <div class="clearfix custom-mb5">
                <div class="fr">
                    <button type="button" class="btn btn-cancel2 btn-sm" onclick="fnObj2.append();">추가</button>
                    <button type="button" class="btn btn_del2 btn-sm" onclick="fnObj2.deleteListItem();">삭제</button>
                    <button type="button" class="btn btn-save btn-sm" onclick="procSaveList(myGrid2,
                            '<%= Constants.PROC_NAME_COMMON_CODE_DETAIL%>');">저장</button>
                </div>
            </div>
            <div id="AXGridTarget2">
            </div>
        <%--</div>--%>
    </div>
</div>
</div>

<%--
====================================================================================================
SCRIPT BEGIN
====================================================================================================
--%>

<script type="text/javascript">

    var LIST_PROC_URL = "<c:url value='/commonCode/getCommonCode'/>";
    var INSERT_PROC_URL = "<c:url value='/commonCode/insertCommonCode'/>";
    var UPDATE_PROC_URL = "<c:url value='/commonCode/updateCommonCode'/>";
    var DELETE_PROC_URL = "<c:url value='/commonCode/deleteCommonCode'/>";
    var PROC_TYPE_COMMON_CODE_GROUP = "<%= Constants.PROC_NAME_COMMON_CODE_GROUP %>";
    var PROC_TYPE_COMMON_CODE_DETAIL = "<%= Constants.PROC_NAME_COMMON_CODE_DETAIL %>";
    var RESULT_STATUS_FAIL_DUPLICATED = "<%= Constants.RESULT_STATUS_FAIL_DUPLICATED %>";
    var GROUP_ID = "";
    var LAST_USE_YN = "";
    var LAST_CHECKED_LIST = [];
    var EDIT_CELL_INDEX_GRID_01 = 0;
    var EDIT_CELL_INDEX_GRID_02 = 0;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////
// GRID :: BEGIN
// GRID 1 :: COMMON CODE GROUP :: BEGIN
//////////////////////////////////////////////////////////////////////////////////////////////////////////////


    var myGrid = new AXGrid();
    var fnObj = {
        pageStart: function() {
            myGrid.setConfig({
                targetID : "AXGridTarget",
                theme : "AXGrid",
                fitToWidth: true,
                colHeadAlign: "center",
                height: "606",
                colGroup : [
                    {key:"id", label:"코드 ID", width:"150", tooltip:"true", formatter: function() {
                        if ($('#orgId_' + this.index).length < 1) {
                            var hiddenValues = $('#hiddenValuesCommonCodeGroup');
                            var stringHiddenValue = '<input type="hidden" id="orgId_'
                                    + this.index + '" class="" value="' + this.item.id + '" />'
                                    + '<input type="hidden" id="flagModifyCommonCodeGroup_'
                                    + this.index + '" class="" value="<%= Constants.USE_YN_N %>" />';

                            hiddenValues.append(stringHiddenValue);
                        }

                        return this.item.id;

                        },
                        editor: {
                            type: "text",
                            maxLength: 50,
                            disabled: function() {
                                return ($('#flagModifyCommonCodeGroup_' + this.index).val() != '<%= Constants.USE_YN_Y %>');
                            },
                            beforeUpdate: function (val) {
                                return val;
                            },
                            afterUpdate: function (val) {
                                return val;
                            },
                            updateWith: ["reqCud"]
                        }
                    },
                    {key:"name", label:"코드 이름", width:"200", tooltip:"true", formatter: function() {
                            if (this.item.reqCud == "C") {
                                return this.item.name + ' <div class="createInputCommonCodeGroup btn_common_code_group_'
                                    + this.index + '" style="float:right; display:none;"> '
                                    + ' <button type="button" class="btn btn-cancel2 btn-sm" '
                                    + ' onclick="fnObj.CancelWriteForm(' + this.index + ', '
                                    + "'<%= Constants.CUD_C%>'" + ');"> 취소 </button> '
                                    + ' <button type="button" class="btn btn-save btn-sm" '
                                    + ' onclick="procInsertItem(' + this.index
                                    + ', myGrid, PROC_TYPE_COMMON_CODE_GROUP);"> 저장 </button> '
                                    + ' </div> ';
                            }

                            if (this.item.reqCud == "U") {
                                return this.item.name + ' <div class="createInputCommonCodeGroup btn_common_code_group_'
                                    + this.index + '" style="float:right; display:none;"> '
                                    + ' <button type="button" class="btn btn-cancel2 btn-sm"'
                                    + ' onclick="fnObj.CancelWriteForm(' + this.index + ', '
                                    + "'<%= Constants.CUD_U%>'" + ');"> 취소 </button> '
                                    + ' <button type="button" class="btn btn-save btn-sm"'
                                    + ' onclick="procPopup(' + "'코드'" + ', UPDATE_MESSAGE, ' + "'procUpdateItem("
                                    + this.index + ", myGrid, PROC_TYPE_COMMON_CODE_GROUP);'" + ')"> 저장 </button> '
                                    + ' </div> ';
                            }

                            if (this.item.reqCud == null) {
                                return this.item.name + ' <div class="createInputCommonCodeGroup btn_common_code_group_'
                                    + this.index + '" style="float:right; display:none;"> '
                                    + ' <button type="button" class="btn btn-save btn-sm" '
                                    + ' onclick="fnObj.updateItem(' + this.index + ');"> 수정 </button> '
                                    + ' <button type="button" class="btn btn_del2 btn-sm" '
                                    + ' onclick="fnObj.deleteItem(' + this.index + ');"> 삭제 </button> '
                                    + ' </div> ';
                            }
                        },
                        editor: {
                            type: "text",
                            maxLength: 50,
                            disabled: function(){
                                return ($('#flagModifyCommonCodeGroup_' + this.index).val() != '<%= Constants.USE_YN_Y %>');
                            },
                            beforeUpdate: function (val) {
                                return val;
                            },
                            afterUpdate: function (val) {
                                return val;
                            },
                            updateWith: ["reqCud"]
                        }
                    }
                ],
                body: {
                    onclick: function() {
                    },
                    ondblclick: function() {
                        GROUP_ID = this.item.id;
                        $('#hiddenValuesCommonCodeDetail').html('');

                        if (GROUP_ID) procGetList(myGrid2, PROC_TYPE_COMMON_CODE_DETAIL, GROUP_ID);
                    }
                },
                page: {
                    paging:true,
                    pageNo: <%= Constants.COMMON_CODE_PAGE_NO %>,
                    pageSize:<%= Constants.COMMON_CODE_PAGE_SIZE %>
                }
            });
        },
        append: function() {
            $.Event(event).stopPropagation();

            var param = {
                id: "",
                name: ""
            };

            myGrid.editCellClear(0, 0, EDIT_CELL_INDEX_GRID_01);
            myGrid.pushList(param, 0);

            var listSize = myGrid.getList().length;
            var hiddenValues= $('#hiddenValuesCommonCodeGroup');
            var arrayHiddenValues = [];
            var stringHiddenValue = "";

            for (var i = 0; i < listSize; i++) {
                if (i > 0) {
                    stringHiddenValue = '<input type="hidden" id="orgId_'
                            + i + '" class="" value="' + $('#orgId_' + (i - 1)).val() + '" />'
                            + '<input type="hidden" id="flagModifyCommonCodeGroup_'
                            + i + '" class="" value="' + $('#flagModifyCommonCodeGroup_' + (i - 1)).val() + '" />';
                } else {
                    stringHiddenValue = '<input type="hidden" id="orgId_'
                            + i + '" class="" value="" />'
                            + '<input type="hidden" id="flagModifyCommonCodeGroup_'
                            + i + '" class="" value="<%= Constants.USE_YN_Y %>" />';
                }

                arrayHiddenValues.push(stringHiddenValue);
            }

            hiddenValues.html(arrayHiddenValues.join(" "));

            $('#flagModifyCommonCodeGroup_' + EDIT_CELL_INDEX_GRID_01).val('<%= Constants.USE_YN_Y %>');
            myGrid.editCell(0, 0, 0);
            EDIT_CELL_INDEX_GRID_01++;
        },
        updateItem: function (index) {
            $.Event(event).stopPropagation();

            var item = myGrid.list[index];
            $('#flagModifyCommonCodeGroup_' + index).val('<%= Constants.USE_YN_Y %>');
            item.reqCud = "U";

            myGrid.editCell(0, 0, index);
            var htmlString = ' <button type="button" class="btn btn-cancel2 btn-sm"'
                    + ' onclick="fnObj.CancelWriteForm(' + index + ', '
                    + "'<%= Constants.CUD_U%>'" + ');"> 취소 </button> '
                    + ' <button type="button" class="btn btn-save btn-sm"'
                    + ' onclick="procPopup(' + "'코드'" + ', UPDATE_MESSAGE, ' + "'procUpdateItem("
                    + index + ", myGrid, PROC_TYPE_COMMON_CODE_GROUP);'" + ')"> 저장 </button> ';

            $('.btn_common_code_group_' + index).html(htmlString);
        },
        CancelWriteForm: function (index, reqStatus) {
            $.Event(event).stopPropagation();

            // STATUS :: INSERT
            if ('<%= Constants.CUD_C%>' == reqStatus) {

                var listSize = myGrid.getList().length;
                var hiddenValues = $('#hiddenValuesCommonCodeGroup');
                var arrayHiddenValues = [];
                var stringHiddenValue = "";

                for (var i = 0; i < listSize; i++) {
                    if (i < listSize - 1) {
                        stringHiddenValue = '<input type="hidden" id="orgId_'
                                + i + '" class="" value="' + $('#orgId_' + (i + 1)).val() + '" />'
                                + '<input type="hidden" id="flagModifyCommonCodeGroup_'
                                + i + '" class="" value="' + $('#flagModifyCommonCodeGroup_' + (i + 1)).val() + '" />';

                        arrayHiddenValues.push(stringHiddenValue);
                    }
                }

                hiddenValues.html(arrayHiddenValues.join(" "));

                var removeList = [{index:index}];
                myGrid.removeListIndex(removeList);
            }

            // STATUS :: MODIFY
            if ('<%= Constants.CUD_U%>' == reqStatus) {
                var item = myGrid.list[index];
                $('#flagModifyCommonCodeGroup_' + index).val('<%= Constants.USE_YN_N %>');
                item.reqCud = null;

                myGrid.removeListIndex(-1);

                var htmlString = ' <button type="button" class="btn btn-save btn-sm" '
                        + ' onclick="fnObj.updateItem(' + index + ');"> 수정 </button> '
                        + ' <button type="button" class="btn btn_del2 btn-sm" '
                        + ' onclick="fnObj.deleteItem(' + index + ');"> 삭제 </button> ';

                $('.btn_common_code_group_' + index).html(htmlString);
            }
        },
        deleteItem: function (index) {
            $.Event(event).stopPropagation();

            procPopup('코드', DELETE_MESSAGE, 'procDeleteItem(' + index + ', myGrid, PROC_TYPE_COMMON_CODE_GROUP);');
        }
    };


//////////////////////////////////////////////////////////////////////////////////////////////////////////////
// GRID 1 :: COMMON CODE GROUP :: END
// GRID 2 :: COMMON CODE DETAIL :: BEGIN
//////////////////////////////////////////////////////////////////////////////////////////////////////////////


    var myGrid2 = new AXGrid();
    var fnObj2 = {
        pageStart: function() {
            myGrid2.setConfig({
                targetID : "AXGridTarget2",
                theme : "AXGrid",
                fitToWidth: true,
                colHeadAlign: "center",
                height: "606",
                colGroup : [
                    {key:"no", label:"checkbox", width:"30", align:"center", formatter:"checkbox"},
                    {key:"key", label:"Key", width:"100", tooltip:"true", formatter: function() {
                            if ($('#orgKey_' + this.index).length < 1) {
                                var hiddenValues = $('#hiddenValuesCommonCodeDetail');
                                var stringHiddenValue = '<input type="hidden" id="orgKey_'
                                        + this.index + '" class="" value="' + this.item.key + '" />'
                                        + '<input type="hidden" id="flagModifyCommonCodeDetail_'
                                        + this.index + '" class="" value="<%= Constants.USE_YN_N %>" />';
    
                                hiddenValues.append(stringHiddenValue);
                            }
    
                            return this.item.key;
    
                        },
                        editor: {
                            type: "text",
                            maxLength: 50,
                            disabled: function() {
                                return ($('#flagModifyCommonCodeDetail_' + this.index).val() != '<%= Constants.USE_YN_Y %>');
                            },
                            beforeUpdate: function (val) {
                                return val;
                            },
                            afterUpdate: function (val) {
                                return val;
                            },
                            updateWith: ["reqCud"]
                        }
                    },
                    {key:"value", label:"Value", width:"100", tooltip:"true",
                        editor: {
                            type: "text",
                            maxLength: 50,
                            disabled: function(){
                                return ($('#flagModifyCommonCodeDetail_' + this.index).val() != '<%= Constants.USE_YN_Y %>');
                            },
                            beforeUpdate: function (val) {
                                return val;
                            },
                            afterUpdate: function (val) {
                                return val;
                            },
                            updateWith: ["reqCud"]
                        }
                    },
                    {key:"summary", label:"요약", width:"150", tooltip:"true",
                        editor: {
                            type: "text",
                            maxLength: 50,
                            disabled: function(){
                                return ($('#flagModifyCommonCodeDetail_' + this.index).val() != '<%= Constants.USE_YN_Y %>');
                            },
                            beforeUpdate: function (val) {
                                return val;
                            },
                            afterUpdate: function (val) {
                                return val;
                            },
                            updateWith: ["reqCud"]
                        }
                    },
                    {key:"useYn", label:"사용", width:"180", formatter: function() {
                            if (this.item.reqCud == "C") {
                                return ' <div><div class="radio_common_code_detail_' + this.index
                                        + '" style="float:left;"> '
                                        + ' <input type="radio" id="useYn_Y_' + this.index + '" name="useYn_'
                                        + this.index + '" value="<%= Constants.USE_YN_Y %>" checked /> Y '
                                        + ' <input type="radio" id="useYn_N_' + this.index + '" name="useYn_'
                                        + this.index + '" value="<%= Constants.USE_YN_N %>"> N '
                                        + ' </div> '

                                        + ' <div class="btn_common_code_detail_' + this.index
                                        + '" style="float:right; display:none;"> '
                                        + ' <button type="button" class="btn btn-cancel2 btn-sm" '
                                        + ' onclick="fnObj2.CancelWriteForm(' + this.index + ', '
                                        + "'<%= Constants.CUD_C%>'" + ');"> 취소 </button> '
                                        + ' <button type="button" class="btn btn-save btn-sm" '
                                        + ' onclick="procInsertItem(' + this.index
                                        + ', myGrid2, PROC_TYPE_COMMON_CODE_DETAIL);"> 저장 </button> '
                                        + ' </div> '
                                        + ' </div> ';
                            }

                            if (this.item.reqCud == "U") {
                                return ' <div><div class="radio_common_code_detail_' + this.index
                                        + '" style="float:left;"> '
                                        + ' <input type="radio" id="useYn_Y_' + this.index + '" name="useYn_'
                                        + this.index + '" value="<%= Constants.USE_YN_Y %>" checked /> Y '
                                        + ' <input type="radio" id="useYn_N_' + this.index + '" name="useYn_'
                                        + this.index + '" value="<%= Constants.USE_YN_N %>"> N '
                                        + ' </div> '

                                        + ' <div class="btn_common_code_detail_' + this.index
                                        + '" style="float:right; display:none;"> '
                                        + ' <button type="button" class="btn btn-cancel2 btn-sm" '
                                        + ' onclick="fnObj2.CancelWriteForm(' + this.index + ', '
                                        + "'<%= Constants.CUD_U%>'" + ');"> 취소 </button> '
                                        + ' <button type="button" class="btn btn-save btn-sm" '
                                        + ' onclick="procInsertItem(' + this.index
                                        + ', myGrid2, PROC_TYPE_COMMON_CODE_DETAIL);"> 저장 </button> '
                                        + ' </div> '
                                        + ' </div> ';
                            }

                            if (this.item.reqCud == null) {
                                var useYnCheckY = "checked";
                                var useYnCheckN = "checked";

                                var useYn = this.item.useYn;

                                if (undefined == useYn || 'undefined' == useYn) useYn = LAST_USE_YN;

                                if (useYn == "Y") {
                                    useYnCheckN = "";
                                } else {
                                    useYnCheckY = "";
                                }

                                return ' <div><div class="radio_common_code_detail_' + this.index
                                        + '" style="float:left;"> '
                                        + ' <input type="radio" id="useYn_Y_' + this.index + '" name="useYn_'
                                        + this.index + '" value="<%= Constants.USE_YN_Y %>" disabled ' + useYnCheckY + ' /> Y '
                                        + ' <input type="radio" id="useYn_N_' + this.index + '" name="useYn_'
                                        + this.index + '" value="<%= Constants.USE_YN_N %>" disabled ' + useYnCheckN + '> N '
                                        + ' </div> '

                                        + ' <div class="btn_common_code_detail_' + this.index
                                        + '" style="float:right; display:none;"> '
                                        + ' <button type="button" class="btn btn-cancel2 btn-sm" '
                                        + ' onclick="fnObj2.updateItem(' + this.index + ');"> 수정 </button> '
                                        + ' <button type="button" class="btn btn_del2 btn-sm" '
                                        + ' onclick="fnObj2.deleteItem(' + this.index + ');"> 삭제 </button> '
                                        + ' </div> '
                                        + ' </div> ';
                            }
                        }
                    }
                ],
                body: {
                    onclick: function() {
                    },
                    ondblclick: function() {
                    }
                },
                page: {
                    paging:true,
                    pageNo: <%= Constants.COMMON_CODE_PAGE_NO %>,
                    pageSize:<%= Constants.COMMON_CODE_PAGE_SIZE %>
                }
            });
        },
        append: function() {
            $.Event(event).stopPropagation();

            var param = {
                key: "",
                value: ""
            };

            myGrid2.editCellClear(0, 0, EDIT_CELL_INDEX_GRID_02);
            myGrid2.pushList(param, 0);

            var listSize = myGrid2.getList().length;
            var hiddenValues= $('#hiddenValuesCommonCodeDetail');
            var arrayHiddenValues = [];
            var stringHiddenValue = "";

            for (var i = 0; i < listSize; i++) {
                if (i > 0) {
                    stringHiddenValue = '<input type="hidden" id="orgKey_'
                            + i + '" class="" value="' + $('#orgKey_' + (i - 1)).val() + '" />'
                            + '<input type="hidden" id="flagModifyCommonCodeDetail_'
                            + i + '" class="" value="' + $('#flagModifyCommonCodeDetail_' + (i - 1)).val() + '" />';
                } else {
                    stringHiddenValue = '<input type="hidden" id="orgKey_'
                            + i + '" class="" value="" />'
                            + '<input type="hidden" id="flagModifyCommonCodeDetail_'
                            + i + '" class="" value="<%= Constants.USE_YN_Y %>" />';
                }

                arrayHiddenValues.push(stringHiddenValue);
            }

            hiddenValues.html(arrayHiddenValues.join(" "));

            $('#flagModifyCommonCodeDetail_' + EDIT_CELL_INDEX_GRID_02).val('<%= Constants.USE_YN_Y %>');
            myGrid2.editCell(0, 1, 0);
            EDIT_CELL_INDEX_GRID_02++;
        },
        updateItem: function (index) {
            $.Event(event).stopPropagation();
            $('#flagModifyCommonCodeDetail_' + index).val('<%= Constants.USE_YN_Y %>');

            var item = myGrid2.list[index];
            item.reqCud = "U";

            $("input:radio[name='useYn_" + index + "']").removeAttr("disabled");

            myGrid2.editCell(0, 1, index);
            var htmlString = ' <button type="button" class="btn btn-cancel2 btn-sm"'
                    + ' onclick="fnObj2.CancelWriteForm(' + index + ', '
                    + "'<%= Constants.CUD_U%>'" + ');"> 취소 </button> '
                    + ' <button type="button" class="btn btn-save btn-sm"'
                    + ' onclick="procPopup(' + "'코드'" + ', UPDATE_MESSAGE, ' + "'procUpdateItem("
                    + index + ", myGrid2, PROC_TYPE_COMMON_CODE_DETAIL);'" + ')"> 저장 </button> ';

            $('.btn_common_code_detail_' + index).html(htmlString);

            var useYnCheckY = "checked";
            var useYnCheckN = "checked";

            var useYn = item.useYn;

            if (undefined == useYn || 'undefined' == useYn) useYn = LAST_USE_YN;

            if (useYn == "Y") {
                useYnCheckN = "";
            } else {
                useYnCheckY = "";
            }

            htmlString = ' <input type="radio" id="useYn_Y_' + index + '" name="useYn_'
                    + index + '" value="<%= Constants.USE_YN_Y %>"' + useYnCheckY + ' /> Y '
                    + ' <input type="radio" id="useYn_N_' + index + '" name="useYn_'
                    + index + '" value="<%= Constants.USE_YN_N %>"' + useYnCheckN + '> N ';

            $('.radio_common_code_detail_' + index).html(htmlString);
        },
        CancelWriteForm: function (index, reqStatus) {
            $.Event(event).stopPropagation();

            // STATUS :: INSERT
            if ('<%= Constants.CUD_C%>' == reqStatus) {

                var listSize = myGrid.getList().length;
                var hiddenValues = $('#hiddenValuesCommonCodeDetail');
                var arrayHiddenValues = [];
                var stringHiddenValue = "";

                for (var i = 0; i < listSize; i++) {
                    if (i < listSize - 1) {
                        stringHiddenValue = '<input type="hidden" id="orgKey_'
                                + i + '" class="" value="' + $('#orgKey_' + (i + 1)).val() + '" />'
                                + '<input type="hidden" id="flagModifyCommonCodeDetail_'
                                + i + '" class="" value="' + $('#flagModifyCommonCodeDetail_' + (i + 1)).val() + '" />';

                        arrayHiddenValues.push(stringHiddenValue);
                    }
                }

                hiddenValues.html(arrayHiddenValues.join(" "));

                var removeList = [{index:index}];
                myGrid2.removeListIndex(removeList);
            }

            // STATUS :: MODIFY
            if ('<%= Constants.CUD_U%>' == reqStatus) {
                var item = myGrid2.list[index];
                item.reqCud = null;

                var useYn = item.useYn;

                if (undefined == useYn || 'undefined' == useYn) useYn = LAST_USE_YN;

                $('#flagModifyCommonCodeDetail_' + index).val(useYn);

                myGrid2.removeListIndex(-1);

                var htmlString = ' <button type="button" class="btn btn-save btn-sm" '
                        + ' onclick="fnObj2.updateItem(' + index + ');"> 수정 </button> '
                        + ' <button type="button" class="btn btn_del2 btn-sm" '
                        + ' onclick="fnObj2.deleteItem(' + index + ');"> 삭제 </button> ';

                $('.btn_common_code_detail_' + index).html(htmlString);
            }
        },
        deleteItem: function (index) {
            $.Event(event).stopPropagation();

            procPopup('코드', DELETE_MESSAGE, 'procDeleteItem(' + index + ', myGrid2, PROC_TYPE_COMMON_CODE_DETAIL);');
        },
        deleteListItem: function (index) {
            $.Event(event).stopPropagation();

            var checkedList = myGrid2.getCheckedList(0);

            if (checkedList.length == 0) {
                procAlert("danger", '<spring:message code="common.info.result.fail.delete" />');
                return false;
            } else {
                procPopup('코드', DELETE_MESSAGE, 'procDeleteList(myGrid2, PROC_TYPE_COMMON_CODE_DETAIL);');
            }
        }
    };


//////////////////////////////////////////////////////////////////////////////////////////////////////////////
// GRID 2 :: COMMON CODE DETAIL :: END
// GRID :: END
// FUNCTION :: BEGIN
//////////////////////////////////////////////////////////////////////////////////////////////////////////////


    // GET LIST
    var procGetList = function(objGrid, procType, groupId) {
        var useYn = $("#useYn").val();
        var searchType = $("#searchType").val();
        var searchKeyword = $("#searchKeyword").val().toLowerCase();

        var param = {
            useYn: useYn,
            groupId: groupId,
            searchType: searchType,
            searchKeyword: searchKeyword,
            procType: procType
        };

        objGrid.setList({
            contentType: "application/json; charset=UTF-8",
            ajaxUrl:LIST_PROC_URL,
            ajaxPars: param,
            onLoad:function() {
                if (myGrid == objGrid && objGrid.getList().length < 1) {
                    var removeList = [];

                    for (var i = 0; i < <%= Constants.COMMON_CODE_PAGE_SIZE %>; i++) {
                        removeList.push({index:i});
                    }

                    myGrid.removeListIndex(removeList);
                    myGrid2.removeListIndex(removeList);

                    procAlert("warning", '<spring:message code="common.info.empty.data" />');
                    return false;
                }

                if (PROC_TYPE_COMMON_CODE_GROUP == procType) {
                    GROUP_ID = objGrid.list[0].id;
                    objGrid.setFocus(0);
                    procGetList (myGrid2, PROC_TYPE_COMMON_CODE_DETAIL, objGrid.list[0].id);
                }
            }
        });
    };


    // COMMON PARAM
    var procCommonParam = function(index, objGrid, procType) {
        var item = objGrid.list[index];
        var param = {};

        if (PROC_TYPE_COMMON_CODE_GROUP == procType) {
            var reqOrgId = $('#orgId_' + index).val();
            var reqId = item.id;
            var reqName = item.name;

            if (!procCheckValidStringSpace(reqId)) {
                window.setTimeout(function () {
                    objGrid.editCell(0, 0, index);
                }, 1000);
                procAlert("warning", '<spring:message code="common.info.empty.req.data" />');
                return false;
            }

            if (!procCheckValidStringSpace(reqName)) {
                window.setTimeout(function() {
                    objGrid.editCell(0, 1, index);
                }, 1000);
                procAlert("warning", '<spring:message code="common.info.empty.req.data" />');
                return false;
            }

            param = {
                orgId: reqOrgId,
                id: reqId,
                name: reqName,
                procType: procType,
                index: index
            };
        }

        if (PROC_TYPE_COMMON_CODE_DETAIL == procType) {
            var reqKey = item.key;
            var reqValue = item.value;
            var reqSummary = item.summary;
            var reqOrgKey = $('#orgKey_' + index).val();

            if (!procCheckValidStringSpace(reqKey)) {
                window.setTimeout(function() {
                    objGrid.editCell(0, 1, index);
                }, 1000);
                procAlert("warning", '<spring:message code="common.info.empty.req.data" />');
                return false;

            }

            if (!procCheckValidStringSpace(reqValue)) {
                window.setTimeout(function() {
                    objGrid.editCell(0, 2, index);
                }, 1000);
                procAlert("warning", '<spring:message code="common.info.empty.req.data" />');
                return false;
            }

            LAST_USE_YN = $("input:radio[name='useYn_" + index + "']:checked").val();

            param = {
                key: reqKey,
                orgKey: reqOrgKey,
                value: reqValue,
                summary: reqSummary,
                groupId: GROUP_ID,
                useYn: LAST_USE_YN,
                procType: procType,
                index: index
            };
        }

        return param;
    };


    // SAVE LIST
    var procSaveList = function(objGrid, procType) {
        window.setTimeout(function() {
            var commonCodeList = objGrid.getList();
            var listSize = commonCodeList.length;

            if (PROC_TYPE_COMMON_CODE_GROUP == procType) {
                for (var i = 0; i < listSize; i++) {
                    var param = procCommonParam(i, objGrid, procType);

                    if (!param) return false;
                }
            }

            if (PROC_TYPE_COMMON_CODE_DETAIL == procType) {
                for (var j = 0; j < listSize; j++) {
                    var reqOrgKey = $('#orgKey_' + j);

                    if (reqOrgKey.val() == 'null') {
                        reqOrgKey.val(commonCodeList[j].key);
                    }

                    commonCodeList[j].useYn = $("input:radio[name='useYn_" + j + "']:checked").val();

                    var param2 = procCommonParam(j, objGrid, procType);

                    if (!param2) return false;
                }
            }

            var listParam = {
                commonCodeList: commonCodeList,
                groupId: GROUP_ID,
                procType: procType
            };

            procGridCallAjax(INSERT_PROC_URL, objGrid, procType, listParam, procCallbackSaveList);

        }, 1);
    };


    // SAVE LIST CALLBACK
    var procCallbackSaveList = function(objGrid, procType) {
        objGrid.reloadList();

        if (PROC_TYPE_COMMON_CODE_GROUP == procType) myGrid2.reloadList();

        procAlert("success", '<spring:message code="common.info.result.success" />');
    };


    // MODIFY BUTTONS
    var procModifyButtons = function(objGrid, procType, index) {
        //FOR GRID BUG
        window.setTimeout(function () {

            var item = objGrid.list[index];
            item.reqCud = null;
            var htmlString = '';

            if (PROC_TYPE_COMMON_CODE_GROUP == procType) {
                $('#flagModifyCommonCodeGroup_' + index).val('<%= Constants.USE_YN_N %>');

                htmlString = ' <button type="button" class="btn btn-primary btn-sm" '
                        + ' onclick="fnObj.updateItem(' + index + ');"> 수정 </button> '
                        + ' <button type="button" class="btn btn-danger btn-sm" '
                        + ' onclick="fnObj.deleteItem(' + index + ');"> 삭제 </button> ';

                $('.btn_common_code_group_' + index).html(htmlString);
                $('#orgId_' + index).val(item.id);
            }

            if (PROC_TYPE_COMMON_CODE_DETAIL == procType) {
                $('#flagModifyCommonCodeDetail_' + index).val('<%= Constants.USE_YN_N %>');

                htmlString = ' <button type="button" class="btn btn-primary btn-sm" '
                        + ' onclick="fnObj2.updateItem(' + index + ');"> 수정 </button> '
                        + ' <button type="button" class="btn btn-danger btn-sm" '
                        + ' onclick="fnObj2.deleteItem(' + index + ');"> 삭제 </button> ';

                $('.btn_common_code_detail_' + index).html(htmlString);
                $('#orgKey_' + index).val(item.key);

                var useYnCheckY = "checked";
                var useYnCheckN = "checked";

                if (LAST_USE_YN == "Y") {
                    useYnCheckN = "";
                } else {
                    useYnCheckY = "";
                }

                htmlString = ' <input type="radio" id="useYn_Y_' + this.index + '" name="useYn_'
                + this.index + '" value="<%= Constants.USE_YN_Y %>" disabled ' + useYnCheckY + ' /> Y '
                + ' <input type="radio" id="useYn_N_' + this.index + '" name="useYn_'
                + this.index + '" value="<%= Constants.USE_YN_N %>" disabled ' + useYnCheckN + '> N '

                $('.radio_common_code_detail_' + index).html(htmlString);
            }
        }, 1);
    };


    // INSERT
    var procInsertItem = function(index, objGrid, procType) {
        //FOR GRID BUG
        window.setTimeout(function() {
            var param = procCommonParam(index, objGrid, procType);
            if (!param) return false;

            procGridCallAjax(INSERT_PROC_URL, objGrid, procType, param, procCallbackInsertItem);

        }, 1);
    };


    // INSERT CALLBACK
    var procCallbackInsertItem = function(objGrid, procType, data, index) {
        if (PROC_TYPE_COMMON_CODE_GROUP == procType) {
            procGetList (myGrid2, PROC_TYPE_COMMON_CODE_DETAIL, objGrid.list[0].id);
            GROUP_ID = objGrid.list[0].id;
        }

        //FOR GRID BUG
        window.setTimeout(function () {
            procModifyButtons(objGrid, procType, index);
        }, 1);

        procAlert("success", '<spring:message code="common.info.result.success" />');
    };


    // UPDATE
    var procUpdateItem = function(index, objGrid, procType) {
        $('div.modal').modal('toggle');

        //FOR GRID BUG
        window.setTimeout(function() {
            var param = procCommonParam(index, objGrid, procType);
            if (!param) return false;

            procGridCallAjax(UPDATE_PROC_URL, objGrid, procType, param, procCallbackUpdateItem);

        }, 1);
    };


    // UPDATE CALLBACK
    var procCallbackUpdateItem = function(objGrid, procType, data, index) {
        //FOR GRID BUG
        window.setTimeout(function () {
            procModifyButtons(objGrid, procType, index);
        }, 1);

        procAlert("success", '<spring:message code="common.info.result.success" />');
    };


    // DELETE
    var procDeleteItem = function(index, objGrid, procType) {
        $('div.modal').modal('toggle');

        var param = procCommonParam(index, objGrid, procType);

        if (!param) return false;

        procGridCallAjax(DELETE_PROC_URL, objGrid, procType, param, procCallbackDeleteItem);
    };


    // DELETE CALLBACK
    var procCallbackDeleteItem = function(objGrid, procType, data, index) {
        var removeList = [{index:index}];
        objGrid.removeListIndex(removeList);

        if (PROC_TYPE_COMMON_CODE_GROUP == procType) {
            procGetList (myGrid2, PROC_TYPE_COMMON_CODE_DETAIL, objGrid.list[0].id);
        }

        procAlert("success", '<spring:message code="common.info.result.success" />');
    };


    // DELETE CHECKED ITEMS
    var procDeleteList = function(objGrid, procType) {
        $('div.modal').modal('toggle');

        LAST_CHECKED_LIST = objGrid.getCheckedList(0);

        var param = {
            commonCodeList: LAST_CHECKED_LIST,
            procType: procType
        };

        procGridCallAjax(DELETE_PROC_URL, objGrid, procType, param, procCallbackDeleteList);
    };


    // DELETE CHECKED ITEMS CALLBACK
    var procCallbackDeleteList = function(objGrid) {
        var listSize = LAST_CHECKED_LIST.length;

        for (var i = 0; i < listSize; i++) {
            var removeList = [{index:i}];
            objGrid.removeListIndex(removeList);
        }

        procAlert("success", '<spring:message code="common.info.result.success" />');
    };


    // BIND :: BUTTON EVENT
    $("#btnSearch").on("click", function() {
        procGetList(myGrid, PROC_TYPE_COMMON_CODE_GROUP, null);
    });


    // CHECK SEARCH FORM KEY EVENT
    var procCheckSearchFormKeyEvent = function(e) {
        if (e.keyCode==13 && e.srcElement.type != 'textarea') {
            procGetList(myGrid, PROC_TYPE_COMMON_CODE_GROUP, null);
        }
    };


    // ON LOAD
    $(document.body).ready(function() {
        fnObj.pageStart();
        fnObj2.pageStart();

        // GET LIST
        procGetList (myGrid, PROC_TYPE_COMMON_CODE_GROUP, null);
        procAlert("info", WELCOME_MESSAGE);
    });


//////////////////////////////////////////////////////////////////////////////////////////////////////////////
// FUNCTION :: END
//////////////////////////////////////////////////////////////////////////////////////////////////////////////


</script>


<%--
====================================================================================================
SCRIPT END
====================================================================================================
--%>


<%--FOOTER--%>
<%@ include file="../common/footer.jsp"%>
