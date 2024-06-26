package egovframework.burin.cmmn.vo;

public class LatLngVO {
    private double lat;
    private double lng;

    public LatLngVO(double lat, double lng) {
        this.lat = lat;
        this.lng = lng;
    }

    // Getter and Setter
    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public double getLng() {
        return lng;
    }

    public void setLng(double lng) {
        this.lng = lng;
    }
}
