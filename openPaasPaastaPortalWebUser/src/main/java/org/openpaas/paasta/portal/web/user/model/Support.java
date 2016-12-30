package org.openpaas.paasta.portal.web.user.model;

/**
 * Support.java
 * 모델 클래스
 *
 * @author yjkim
 * @version 1.0
 * @since 2016.7.28 최초작성
 */

public class Support {
    private int no;
    private String title;
    private String important;
    private String classification;
    private String useYn;
    private String userId;
    private String content;
    private String fileName;
    private String filePath;
    private int fileSize;
    private String startDate;
    private String endDate;
    private String created;
    private String lastModified;

    private String status;

    private int boardNo;
    private int parentNo;
    private int questionNo;
    private int groupNo;
    private int replyNum;

    private int commentNum;

    private String searchKeyword;
    private String searchTypeColumn;
    private String searchTypeUseYn;
    private String searchTypeStatus;
    private String searchStartDate;
    private String searchEndDate;

    private int rowNum;
    private int listLength;
    private int pageLimit;
    private int pageOffset;
    private int level;

    private String classificationValue;
    private String statusValue;

    private String answerer;

    private String cellPhone;
    private int pageNo;
    private int pageSize;
    private int totalCount;

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImportant() {
        return important;
    }

    public void setImportant(String important) {
        this.important = important;
    }

    public String getClassification() {
        return classification;
    }

    public void setClassification(String classification) {
        this.classification = classification;
    }

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public int getFileSize() {
        return fileSize;
    }

    public void setFileSize(int fileSize) {
        this.fileSize = fileSize;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getCreated() {
        return created;
    }

    public void setCreated(String created) {
        this.created = created;
    }

    public String getLastModified() {
        return lastModified;
    }

    public void setLastModified(String lastModified) {
        this.lastModified = lastModified;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getBoardNo() {
        return boardNo;
    }

    public void setBoardNo(int boardNo) {
        this.boardNo = boardNo;
    }

    public int getParentNo() {
        return parentNo;
    }

    public void setParentNo(int parentNo) {
        this.parentNo = parentNo;
    }

    public int getQuestionNo() {
        return questionNo;
    }

    public void setQuestionNo(int questionNo) {
        this.questionNo = questionNo;
    }

    public int getGroupNo() {
        return groupNo;
    }

    public void setGroupNo(int groupNo) {
        this.groupNo = groupNo;
    }

    public int getReplyNum() {
        return replyNum;
    }

    public void setReplyNum(int replyNum) {
        this.replyNum = replyNum;
    }

    public int getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(int commentNum) {
        this.commentNum = commentNum;
    }

    public String getSearchKeyword() {
        return searchKeyword;
    }

    public void setSearchKeyword(String searchKeyword) {
        this.searchKeyword = searchKeyword;
    }

    public String getSearchTypeColumn() {
        return searchTypeColumn;
    }

    public void setSearchTypeColumn(String searchTypeColumn) {
        this.searchTypeColumn = searchTypeColumn;
    }

    public String getSearchTypeUseYn() {
        return searchTypeUseYn;
    }

    public void setSearchTypeUseYn(String searchTypeUseYn) {
        this.searchTypeUseYn = searchTypeUseYn;
    }

    public String getSearchTypeStatus() {
        return searchTypeStatus;
    }

    public void setSearchTypeStatus(String searchTypeStatus) {
        this.searchTypeStatus = searchTypeStatus;
    }

    public String getSearchStartDate() {
        return searchStartDate;
    }

    public void setSearchStartDate(String searchStartDate) {
        this.searchStartDate = searchStartDate;
    }

    public String getSearchEndDate() {
        return searchEndDate;
    }

    public void setSearchEndDate(String searchEndDate) {
        this.searchEndDate = searchEndDate;
    }

    public int getRowNum() {
        return rowNum;
    }

    public void setRowNum(int rowNum) {
        this.rowNum = rowNum;
    }

    public int getListLength() {
        return listLength;
    }

    public void setListLength(int listLength) {
        this.listLength = listLength;
    }

    public int getPageLimit() {
        return pageLimit;
    }

    public void setPageLimit(int pageLimit) {
        this.pageLimit = pageLimit;
    }

    public int getPageOffset() {
        return pageOffset;
    }

    public void setPageOffset(int pageOffset) {
        this.pageOffset = pageOffset;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getClassificationValue() {
        return classificationValue;
    }

    public void setClassificationValue(String classificationValue) {
        this.classificationValue = classificationValue;
    }

    public String getStatusValue() {
        return statusValue;
    }

    public void setStatusValue(String statusValue) {
        this.statusValue = statusValue;
    }

    public String getAnswerer() {
        return answerer;
    }

    public void setAnswerer(String answerer) {
        this.answerer = answerer;
    }

    public String getCellPhone() {
        return cellPhone;
    }

    public void setCellPhone(String cellPhone) {
        this.cellPhone = cellPhone;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    @Override
    public String toString() {
        return "Support{" +
                "no=" + no +
                ", title='" + title + '\'' +
                ", important='" + important + '\'' +
                ", classification='" + classification + '\'' +
                ", useYn='" + useYn + '\'' +
                ", userId='" + userId + '\'' +
                ", content='" + content + '\'' +
                ", fileName='" + fileName + '\'' +
                ", filePath='" + filePath + '\'' +
                ", fileSize=" + fileSize +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", created='" + created + '\'' +
                ", lastModified='" + lastModified + '\'' +
                ", status='" + status + '\'' +
                ", boardNo=" + boardNo +
                ", parentNo=" + parentNo +
                ", questionNo=" + questionNo +
                ", groupNo=" + groupNo +
                ", replyNum=" + replyNum +
                ", commentNum=" + commentNum +
                ", searchKeyword='" + searchKeyword + '\'' +
                ", searchTypeColumn='" + searchTypeColumn + '\'' +
                ", searchTypeUseYn='" + searchTypeUseYn + '\'' +
                ", searchTypeStatus='" + searchTypeStatus + '\'' +
                ", searchStartDate='" + searchStartDate + '\'' +
                ", searchEndDate='" + searchEndDate + '\'' +
                ", rowNum=" + rowNum +
                ", listLength=" + listLength +
                ", pageLimit=" + pageLimit +
                ", pageOffset=" + pageOffset +
                ", level=" + level +
                ", classificationValue='" + classificationValue + '\'' +
                ", statusValue='" + statusValue + '\'' +
                ", answerer='" + answerer + '\'' +
                ", cellPhone='" + cellPhone + '\'' +
                ", pageNo=" + pageNo +
                ", pageSize=" + pageSize +
                ", totalCount=" + totalCount +
                '}';
    }
}
