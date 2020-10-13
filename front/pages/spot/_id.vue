<template>
  <div> 
    <p>スポット名:{{spot.name}}</p>
    <p>説明:{{spot.introduction}}</p>
    <h1>{{spot.id}}</h1>
    <!-- <h2>{{ review.title }}</h2> -->
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
      // review: {}
    }
  },
  computed: {
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
