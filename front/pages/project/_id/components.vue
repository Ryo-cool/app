<template>
  <v-container>
    <v-row>
      <v-col
        cols="6"
      >
        <v-carousel
        >
          <v-carousel-item
            v-for="spot in spots"
            :key="spots.id"
            @click=""
          >
            <v-sheet
              height="100%"
              tile
            >
              <nuxt-link
                :to="$my.spotLinkTo(spot.id)"
                class="text-decoration-none"
              >
              <v-row
                class="fill-height"
                align="center"
                justify="center"

              >

                <div class="display-3">
                  <v-list-item-title v-text="spot.name"></v-list-item-title>
                  <v-list-item-title v-text="spot.introduction"></v-list-item-title>
                </div>
              </v-row>
              </nuxt-link>
            </v-sheet>
          </v-carousel-item>
        </v-carousel>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from "~/plugins/axios"
let url = "/api/v1/spots/"

export default {
  data: () => ({
    spots:[],
    
    colors: [
      'primary',
      'secondary',
      'yellow darken-2',
      'red',
      'orange',
    ],
  }),
  computed: {
    spots: function() {
        return this.spots.slice(0, 2);
    }
  },
  created() {
    // ユーザーをaxiosで取得
    axios.get(url).then(res => {
      if (res.data) {
          this.spots = res.data
          }
        })
  }
}
</script>