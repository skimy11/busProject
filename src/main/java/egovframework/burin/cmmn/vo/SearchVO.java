package egovframework.burin.cmmn.vo;

public class SearchVO {
	private String routeId;
	private String routeNm; // 버스 번호
    private String pointLat;    // 위도 
    private String pointLngt;    // 경도 
    private String nodeNm;    // 정거장명
    private int routeOrd; // 노선순서
    private int estimatedTime; // 걸리는 시간
    private String startStation; // 출발 정거장명
    private String endStation; // 도착 정거장명
    
    public String getStartStation() {
		return startStation;
	}
	public void setStartStation(String startStation) {
		this.startStation = startStation;
	}
	public String getEndStation() {
		return endStation;
	}
	public void setEndStation(String endStation) {
		this.endStation = endStation;
	}
	// Getter와 Setter 메소드
	public String getRouteNm() {
		return routeNm;
	}
	public void setRouteNm(String routeNm) {
		this.routeNm = routeNm;
	}
	public String getPointLat() {
		return pointLat;
	}
	public void setPointLat(String pointLat) {
		this.pointLat = pointLat;
	}
	public String getPointLngt() {
		return pointLngt;
	}
	public void setPointLngt(String pointLngt) {
		this.pointLngt = pointLngt;
	}
	public String getNodeNm() {
		return nodeNm;
	}
	public void setNodeNm(String nodeNm) {
		this.nodeNm = nodeNm;
	}
	public int getRouteOrd() {
		return routeOrd;
	}
	public void setRouteOrd(int routeOrd) {
		this.routeOrd = routeOrd;
	}
	public String getRouteId() {
		return routeId;
	}
	public void setRouteId(String routeId) {
		this.routeId = routeId;
	}
	public int getEstimatedTime() {
		return estimatedTime;
	}
	public void setEstimatedTime(int estimatedTime) {
		this.estimatedTime = estimatedTime;
	}
    
 
}
