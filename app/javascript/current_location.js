//現在地の取得と反映
document.getElementById("get-location-btn").onclick = function(){
  navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
};

function successCallback(position){
  var latitude = position.coords.latitude;
  var longitude = position.coords.longitude;
  window.location.href = `/?latitude=${latitude}&longitude=${longitude}`;
};

function errorCallback(error){
  alert("位置情報が取得できませんでした");
};