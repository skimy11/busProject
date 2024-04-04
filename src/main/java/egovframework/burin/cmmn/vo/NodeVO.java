package egovframework.burin.cmmn.vo;

public class NodeVO {
    private String routeNm; // 버스 번호
    private String pointLat;    // 위도 
    private String pointLngt;    // 경도 
    private String pointId; // 버스 ID
    
    
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
	public String getPointId() {
		return pointId;
	}
	public void setPointId(String pointId) {
		this.pointId = pointId;
	}
}
