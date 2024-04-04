package egovframework.burin.cmmn.vo;

public class ChartVO {
    private double roundedLngt; // 반올림된 경도
    private double roundedLa; // 반올림된 위도
    private int stationCount; // 정거장 수

    // Getter와 Setter 메소드
    public double getRoundedLngt() {
        return roundedLngt;
    }

    public void setRoundedLngt(double roundedLngt) {
        this.roundedLngt = roundedLngt;
    }

    public double getRoundedLa() {
        return roundedLa;
    }

    public void setRoundedLa(double roundedLa) {
        this.roundedLa = roundedLa;
    }

    public int getStationCount() {
        return stationCount;
    }

    public void setStationCount(int stationCount) {
        this.stationCount = stationCount;
    }
}
