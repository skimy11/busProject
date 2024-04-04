package egovframework.burin.cmmn.vo;

public class BookMarkVO {
    private String userId; // 사용자 ID
    private String busId; // 버스 ID
    private String routeNm; // 버스 번호

    // Getter와 Setter 메소드
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getBusId() {
        return busId;
    }

    public void setBusId(String busId) {
        this.busId = busId;
    }

	public String getRouteNm() {
		return routeNm;
	}

	public void setRouteNm(String routeNm) {
		this.routeNm = routeNm;
	}
}

