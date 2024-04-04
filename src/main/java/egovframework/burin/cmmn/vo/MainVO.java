package egovframework.burin.cmmn.vo;

public class MainVO {
    private String nodeNm; // 정거장 이름
    private String routeNm; // 버스 번호
    private String lat;    // 위도 
    private String lng;    // 경도 
    private String errorMessage; // 오류 메시지
    private String busId; // 버스 ID

    // Getter와 Setter 메소드
    public String getNodeNm() {
        return nodeNm;
    }

    public void setNodeNm(String nodeNm) {
        this.nodeNm = nodeNm;
    }

    public String getRouteNm() {
        return routeNm;
    }

    public void setRouteNm(String routeNm) {
        this.routeNm = routeNm;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLng() {
        return lng;
    }

    public void setLng(String lng) {
        this.lng = lng;
    }
    
    // errorMessage의 Getter 메소드
    public String getErrorMessage() {
        return errorMessage;
    }

    // errorMessage의 Setter 메소드
    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

	public String getBusId() {
		return busId;
	}

	public void setBusId(String busId) {
		this.busId = busId;
	}

}
