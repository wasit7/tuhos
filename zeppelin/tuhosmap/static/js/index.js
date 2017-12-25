String.prototype.format = function() {
  a = this;
  for (k in arguments) {
    a = a.replace("{" + k + "}", arguments[k])
  }
  return a
}

const numberWithCommas = (x) => {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

var map = L.map('map').setView([13.753,  100.5], 8);

const tileURL = 'http://a.tile.openstreetmap.org/{z}/{x}/{y}.png'
L.tileLayer(tileURL, {
  attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);
debts.forEach(function(entry) {
  // console.log(entry)
  var circle = L.circle([entry['LAT'], entry['LONG']], {
    color: 'red',
    fillColor: '#f03',
    fillOpacity: 0.5,
    radius: entry['invsum']/5000
  }).addTo(map);
  var tooltipPane = "<div> <h2> จังหวัด {0} </h2> <hr/><p> มูลค่าหนี้รวม: <br><span style=\"font-size: 18px; margin-left: 12\">{1} บาท</span></p> </div>"
          .format(entry['changwat_name'], numberWithCommas(entry['invsum']));
  circle.bindTooltip(tooltipPane);
})