package org.openpaas.paasta.portal.api.service;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.openpaas.paasta.portal.api.common.Common;
import org.openpaas.paasta.portal.api.common.Constants;
import org.openpaas.paasta.portal.api.common.CustomCloudFoundryClient;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.*;

import static org.slf4j.LoggerFactory.getLogger;

/**
 * ClientService
 *
 * @author yjkim
 * @version 1.0
 * @since 2016.9.29
 */


@Service
@Transactional
public class ClientService extends Common {

    /**
     * 클라이언트 목록 조회
     *
     * @param customCloudFoundryClient CustomCloudFoundryClient
     * @param param the param
     * @return client list (map)
     * @throws Exception the exception
     */
    public Map getClientList(CustomCloudFoundryClient customCloudFoundryClient, Map<String, Object> param) throws Exception { //CustomCloudFoundryClient customCloudFoundryClient

        ResponseEntity<String> responseEntity = customCloudFoundryClient.getClientList(uaaClientId, uaaClientSecret, uaaTarget);

        String str = responseEntity.getBody();
        JSONArray rtnArray = new JSONArray();

        try {

            JSONParser jsonParser = new JSONParser();

            //JSON데이터를 넣어 JSON Object 로 만들어 준다.
            JSONObject stringToJson = (JSONObject) jsonParser.parse(str);

            //배열을 추출
            rtnArray = (JSONArray) stringToJson.get("resources");

        } catch (Exception e) {
            return null;
        }

        Map<String, Object> resultMap = new HashMap<>();

        resultMap.put("list", rtnArray);
        resultMap.put("RESULT", Constants.RESULT_STATUS_SUCCESS);

        return resultMap;

    }


    /**
     * 클라이언트 정보 조회
     *
     * @param customCloudFoundryClient CustomCloudFoundryClient
     * @param param the param
     * @return client (map)
     */
    public Map getClient(CustomCloudFoundryClient customCloudFoundryClient, Map<String, Object> param) throws Exception {

        ResponseEntity<String> responseEntity = customCloudFoundryClient.getClient(uaaClientId, uaaClientSecret, uaaTarget, param);
        String str = responseEntity.getBody();

        JSONObject stringToJson = new JSONObject();

        try {

            JSONParser jsonParser = new JSONParser();

            //JSON데이터를 넣어 JSON Object 로 만들어 준다.
            stringToJson = (JSONObject) jsonParser.parse(str);

        } catch (Exception e) {
            return null;
        }

        Map<String, Object> resultMap = new HashMap<>();

        resultMap.put("info", stringToJson);
        resultMap.put("infoString", str);

        resultMap.put("RESULT", Constants.RESULT_STATUS_SUCCESS);

        return resultMap;
    }

    /**
     * 클라이언트 등록
     *
     * @param customCloudFoundryClient CustomCloudFoundryClient
     * @param param the param
     * @return result, status (map)
     */
    public Map registerClient(CustomCloudFoundryClient customCloudFoundryClient, Map<String, Object> param) throws Exception {

        ResponseEntity<String> responseEntity = customCloudFoundryClient.registerClient(uaaAdminClientId, uaaAdminClientSecret, uaaTarget, param);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("RESULT", Constants.RESULT_STATUS_SUCCESS);
        resultMap.put("CODE", responseEntity.getStatusCode());

        return resultMap;
    }

    /**
     * 클라이언트 수정
     *
     * @param customCloudFoundryClient CustomCloudFoundryClient
     * @param param the param
     * @return result, status (map)
     */
    public Map updateClient(CustomCloudFoundryClient customCloudFoundryClient, Map<String, Object> param) throws Exception {

        ResponseEntity<String> responseEntity = customCloudFoundryClient.updateClient(uaaAdminClientId, uaaAdminClientSecret, uaaTarget, param);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("RESULT", Constants.RESULT_STATUS_SUCCESS);
        resultMap.put("CODE", responseEntity.getStatusCode());

        return resultMap;


    }

    /**
     * 클라이언트 삭제
     *
     * @param customCloudFoundryClient CustomCloudFoundryClient
     * @param param the param
     * @return result, status (map)
     */
    public Map deleteClient(CustomCloudFoundryClient customCloudFoundryClient, Map<String, Object> param) throws Exception {

        ResponseEntity<String> responseEntity = customCloudFoundryClient.deleteClient(uaaAdminClientId, uaaAdminClientSecret, uaaTarget, param);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("RESULT", Constants.RESULT_STATUS_SUCCESS);
        resultMap.put("CODE", responseEntity.getStatusCode());

        return resultMap;
    }

}