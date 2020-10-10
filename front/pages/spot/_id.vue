<template>
  <div> 
    <p>スポット名:{{spot.name}}</p>
    <p>説明:{{spot.introduction}}</p>
    <nuxt-link
    :to="$my.spotLinkTo(spot.id)"
    class="text-decoration-none"
    >ssssss</nuxt-link>
  </div>
</template>

<script>
import axios from '~/plugins/axios'

export default {
  data () {
    return {
      spot: {}         
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

      })
      .catch((error) => {
        console.error(error)
      })
  }
  
}
</script>
