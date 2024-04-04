package egovframework.burin.cmmn.vo;

import java.util.List;

public class DistrictVO {
    private String districtNm;
    private List<LatLngVO> path; // 구역을 구성하는 경로 지점들

    // Getter와 Setter 메소드
    public String getDistrictNm() {
        return districtNm;
    }

    public void setDistrictNm(String districtNm) {
        this.districtNm = districtNm;
    }

    public List<LatLngVO> getPath() {
        return path;
    }

    public void setPath(List<LatLngVO> path) {
        this.path = path;
    }
}
