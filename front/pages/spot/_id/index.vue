<template>
  <div> 
    <p>スポット名:{{spot.name}}</p>
    <p>説明:{{spot.introduction}}</p>
    <h1>{{spot.id}}</h1>
    <h2>{{ spot.latitude }}</h2>
    <h3>{{ prefecture }}</h3>
      <GmapMap 
      :center="{lat: spot.latitude, lng: spot.longitude}"
      :zoom="zoom" 
      ref="map" 
      style="width: 500px; height: 300px"
      >
        <GmapMarker :key="id" v-for="(m,id) in marker_items"
          :position="{lat: spot.latitude, lng: spot.longitude}"
          :title="m.title"
          :clickable="true" :draggable="false" />
      </GmapMap>
    <v-list-item-group color="primary">
      <v-list-item
        v-for="review in reviews"
        :key="reviews.id"
        @click=""
      >
        <v-list-item-content>
          <v-list-item-title v-text="review.title"></v-list-item-title>
          <v-list-item-title v-text="review.wentday"></v-list-item-title>
        </v-list-item-content>
      </v-list-item>
    </v-list-item-group>
    <nuxt-link
    :to="`${spot.id}/reviews/new`"
    class="text-decoration-none"
    >
    レビューを書く
    </nuxt-link>
  </div>
</template>

<script>
import axios from '~/plugins/axios'

export default {
  data () {
    return {
      spot: {},
      prefecture: {},
      reviews: {},
      // center: {lat: 35.71, lng: 139.72},
      zoom: 14,
      marker_items: [
      {position: {lat: 35.71, lng: 139.72}, title: 'marker_1'},
      {position: {lat: 35.72, lng: 139.73}, title: 'marker_2'},
      {position: {lat: 35.70, lng: 139.71}, title: 'marker_3'},
      {position: {lat: 35.71, lng: 139.70}, title: 'marker_4'}
      ],
    }
  },
  computed: {
  },
  // created () {
  //   axios.get(`/api/v1/spots/${this.$route.params.id}/reviews`).then(res => {
  //     if (res.data) {
  //       this.reviews = res.data
  //     }
  //   })
  // },
  mounted () {
    axios
      .get(`/api/v1/spots/${this.$route.params.id}`)
      .then((res) => {
        this.spot = res.data.spot
        this.reviews = res.data.review
        this.prefecture = res.data.prefecture.attributes.name
      })
      .catch((error) => {
        console.error(error)
      })
  }
  
}
</script>
