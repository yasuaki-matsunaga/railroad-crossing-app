document.getElementById("get-current-range-btn").onclick = function(){
  var bounds = map.getBounds();
  var southWest = bounds.getSouthWest(); // 左下
  var northEast = bounds.getNorthEast(); // 右上

  var northLat = northEast.lat;
  var southLat = southWest.lat;
  var eastLng = northEast.lng;
  var westLng = southWest.lng;

  window.location.href = `/?northLat=${northLat}&southLat=${southLat}&eastLng=${eastLng}&westLng=${westLng}`;
}