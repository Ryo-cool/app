<template>
  <v-container>
    <v-row>
    {{ app }}
      <h1>{{ title }}</h1>
    </v-row>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      app: 'tomorrow',
      title: 'hellow'
    }
  }
}
</script>