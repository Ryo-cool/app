<template>
  <div class="app">
    <GmapMap 
    :center="center" 
    :zoom="zoom" 
    ref="map" 
    style="width: 500px; height: 300px"
    >
      <GmapMarker :key="id" v-for="(m,id) in marker_items"
        :position="m.position"
        :title="m.title"
        :clickable="true" :draggable="false" />
    </GmapMap>
    <v-container>
      <v-text-field label="ここにスポット名前を入力" v-model="address" @change="onChange"></v-text-field>
      <v-text-field label="緯度"></v-text-field>
      <v-text-field label="経度"></v-text-field>
      
      <div>{{ location }}</div>
      <div>{{ formatted_address}}</div>
    </v-container>
  </div>
</template>
<script>
export default {
  data () {
    return {
      center: {lat: 35.71, lng: 139.72},
      zoom: 14,
      marker_items: [
      {position: {lat: 35.71, lng: 139.72}, title: 'marker_1'},
      {position: {lat: 35.72, lng: 139.73}, title: 'marker_2'},
      {position: {lat: 35.70, lng: 139.71}, title: 'marker_3'},
      {position: {lat: 35.71, lng: 139.70}, title: 'marker_4'}
      ],
      infos: [],
      geocoder: {},
      address: "",
      // lat: "",
      // lng: "",
      location: {lat: "", lng: ""},
      formatted_address: ""
    }
  },
  mounted() {
    this.$gmapApiPromiseLazy().then(() => {this.geocoder = new google.maps.Geocoder() })
    
  },
  methods: {
    getInfo () {
    let mapBounds = this.$refs.map.$mapObject.getBounds()
    this.infos.push(`[bounds-lat:] ${mapBounds.lat} ～ ${mapBounds.lat}`)
    this.infos.push(`[bounds-lng:] ${mapBounds.ea} ～ ${mapBounds.ea}`)
    let center = this.$refs.map.$mapObject.getCenter()
    this.infos.push(`[center] lat: ${center.lat()} lng: ${center.lng()}`)
    },
    onChange() {
      this.geocoder.geocode({
        'address': this.address
      },(results, status) =>{
        if(status === google.maps.GeocoderStatus.OK) {
          // this.lat = results[0].geometry.location.lat();
          // this.lng = results[0].geometry.location.lng();
          this.location = results[0].geometry.location;
          this.formatted_address = results[0].formatted_address;
        }
        else{
          console.log(error)
        }
      }
      )
    }
  }
}
</script>