<template>
  <v-card>
    <v-container fluid>
      <v-row
        align="center"
      >
        <v-col cols="12">
          <v-autocomplete
            v-model="value"
            :items="spots"
            item-text="name"
            prepend-icon="mdi-database-search"
            
            filled
            hide-no-data
            label="Filled"
          ></v-autocomplete>
        </v-col>
      </v-row>
      <v-row>
        <v-col v-for="spot in spots" :key="spot.id">
          a{{ spot.name }}
        </v-col>
      </v-row>
    </v-container>
  </v-card>
</template>

<script>
import axios from "~/plugins/axios"

export default {

  data () {
    return {
      spots: [],
      value: null,
      
    }
  },
  created() {
    // ユーザーをaxiosで取得
    axios.get("/api/v1/spots").then(res => {
      if (res.data) {
        this.spots = res.data

      }
    })
  }

}
</script>