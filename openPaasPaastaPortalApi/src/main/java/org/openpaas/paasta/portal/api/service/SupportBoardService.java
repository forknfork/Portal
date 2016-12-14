package org.openpaas.paasta.portal.api.service;

import org.openpaas.paasta.portal.api.common.Common;
import org.openpaas.paasta.portal.api.common.Constants;
import org.openpaas.paasta.portal.api.mapper.SupportBoardMapper;
import org.openpaas.paasta.portal.api.model.Support;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

/**
 * org.openpaas.paasta.portal.api.service
 *
 * @author yjkim
 * @version 1.0
 * @since 2016.07.28
 */

@Transactional
@Service
public class SupportBoardService extends Common{

    @Autowired
    private SupportBoardMapper supportBoardMapper;

    /**
     * 게시판 게시글 목록 조회
     *
     * @param param the param
     * @return Board list
     * @throws Exception the exception
     */
    public Map<String, Object> getBoardList(Support param) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();

        resultMap.put("list", supportBoardMapper.getBoardList(param));
        resultMap.put("RESULT", Constants.RESULT_STATUS_SUCCESS);

        return resultMap;
    }

    /**
     * 게시판 게시글 조회
     *
     * @param param the param
     * @return Board
     * @throws Exception the exception
     */
    public Map<String, Object> getBoard(Support param) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();

        resultMap.put("info", supportBoardMapper.getBoard(param));
        resultMap.put("RESULT", Constants.RESULT_STATUS_SUCCESS);

        return resultMap;
    }

    /**
     * 게시판 댓글 목록 조회
     *
     * @param param the param
     * @return Board list
     * @throws Exception the exception
     */
    public Map<String, Object> getBoardCommentList(Support param) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();

        resultMap.put("list", supportBoardMapper.getBoardCommentList(param));
        resultMap.put("RESULT", Constants.RESULT_STATUS_SUCCESS);

        return resultMap;
    }

    /**
     * 게시판 게시글 등록
     *
     * @param param the param
     * @return Board
     * @throws Exception the exception
     */
    public Map<String, Object> insertBoard(Support param) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();

        supportBoardMapper.insertBoard(param);
        supportBoardMapper.setGroupNo(param);

        resultMap.put("RESULT", Constants.RESULT_STATUS_SUCCESS);

        return resultMap;
    }

    /**
     * 게시판 게시글 수정
     *
     * @param param the param
     * @return Board
     * @throws Exception the exception
     */
    public Map<String, Object> updateBoard(Support param) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();

        supportBoardMapper.updateBoard(param);

        resultMap.put("RESULT", Constants.RESULT_STATUS_SUCCESS);

        return resultMap;
    }

    /**
     * 게시판 게시글 삭제
     *
     * @param param the param
     * @return Board
     * @throws Exception the exception
     */
    public Map<String, Object> deleteBoard(Support param) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();

        supportBoardMapper.deleteBoard(param);
        supportBoardMapper.deleteAllComments(param);

        resultMap.put("RESULT", Constants.RESULT_STATUS_SUCCESS);

        return resultMap;
    }

    /**
     * 게시판 댓글 수 조회
     *
     * @param param the param
     * @return Board
     * @throws Exception the exception
     */
    public Map<String, Object> getReplyNum(Support param) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();

        resultMap.put("info", supportBoardMapper.getReplyNum(param));
        resultMap.put("RESULT", Constants.RESULT_STATUS_SUCCESS);

        return resultMap;
    }

    /**
     * 게시판 댓글 수 조회
     *
     * @param param the param
     * @return Board
     * @throws Exception the exception
     */
    public Map<String, Object> getCommentReplyNum(Support param) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();

        resultMap.put("info", supportBoardMapper.getCommentReplyNum(param));
        resultMap.put("RESULT", Constants.RESULT_STATUS_SUCCESS);

        return resultMap;
    }




    /**
     * 게시판 댓글 등록
     *
     * @param param the param
     * @return BoardComment
     * @throws Exception the exception
     */
    public Map<String, Object> insertBoardComment(Support param) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();

        supportBoardMapper.insertBoardComment(param);
        supportBoardMapper.setCommentGroupNo(param);

        resultMap.put("RESULT", Constants.RESULT_STATUS_SUCCESS);

        return resultMap;
    }

    /**
     * 게시판 댓글 수정
     *
     * @param param the param
     * @return BoardComment
     * @throws Exception the exception
     */
    public Map<String, Object> updateBoardComment(Support param) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();

        supportBoardMapper.updateBoardComment(param);
        resultMap.put("RESULT", Constants.RESULT_STATUS_SUCCESS);

        return resultMap;
    }




    /**
     * 게시판 댓글 삭제
     *
     * @param param the param
     * @return BoardComment
     * @throws Exception the exception
     */
    public Map<String, Object> deleteBoardComment(Support param) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();

        supportBoardMapper.deleteBoardComment(param);
        resultMap.put("RESULT", Constants.RESULT_STATUS_SUCCESS);

        return resultMap;
    }

}
