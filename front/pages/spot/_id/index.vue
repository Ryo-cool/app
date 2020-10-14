<template>
  <div> 
    <p>スポット名:{{spot.name}}</p>
    <p>説明:{{spot.introduction}}</p>
    <h1>{{spot.id}}</h1>
    <v-list-item-group color="primary">
      <v-list-item
        v-for="review in reviews"
        :key="reviews.id"
        @click=""
      >
        <v-list-item-content>
          <v-list-item-title v-text="review.title"></v-list-item-title>
          
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
      reviews: {}
    }
  },
  computed: {
  },
  created () {
    axios.get("/api/v1/reviews").then(res => {
      if (res.data) {
        this.reviews = res.data
      }
    })
  },
  mounted () {
    axios
      .get(`/api/v1/spots/${this.$route.params.id}`)
      .then((res) => {
        const spot = res.data
        this.spot = spot
        // this.review = res.data.review
      })
      .catch((error) => {
        console.error(error)
      })
  }
  
}
</script>
