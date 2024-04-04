package egovframework.burin.cmmn.vo;

public class RouteInfoVO {
    private int routeOrd; // 노선순서
    private String nodeNm; // 정거장 이름
    private String lat; // 위도 
    private String lng; // 경도 
    private String arsId; // 정거장 고유번호 

    // Getter와 Setter 메소드
    public int getRouteOrd() {
        return routeOrd;
    }

    public void setRouteOrd(int routeOrd) {
        this.routeOrd = routeOrd;
    }

    public String getNodeNm() {
        return nodeNm;
    }

    public void setNodeNm(String nodeNm) {
        this.nodeNm = nodeNm;
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
    
    public String getArsId() {
        return arsId;
    }

    public void setArsId(String arsId) {
        this.arsId = arsId;
    }
}
