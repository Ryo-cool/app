<template>
  <div>
    <GmapMap
      :center="{lat:38.6, lng:140}"
      :zoom="8"
      :options="{streetViewControl: false}"
      ref="map"
      map-type-id="roadmap"
      style="width: 500px; height: 300px"
      
    >
      <GmapMarker
        :key="index"
        v-for="(m, index) in markers"
        :position="m.position"
        :clickable="true"
        :draggable="true"
        @click="center=m.position"
      />
    </GmapMap>
  </div>
</template>

<script>

export default {
  data () {
    return {
      // latが緯度、lngが経度
      markers: [{ position: { lat: 38.6, lng: 140 } }],
      
    }
  },
}
</script>