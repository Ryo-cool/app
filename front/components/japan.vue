<template>
  <v-container>
    <v-row>
      <v-col
        cols="12"
      >
        <radio-svg-map v-model="selectedLocation" :map="Japan" />
      </v-col>
    </v-row>
  </v-container>
</template>
 
<script>
import Japan from "@svg-maps/japan";
 
export default {
  components: {
  },
  data() {
    return {
      Japan,
      selectedLocation: null
    }
  }
}
</script>
 
<style>

.svg-map {
  width: 30%;
}
</style>