<template>
  <v-container>
    <v-col cols="12">
      <v-text-field
      label="name"
      v-model="name"
      prepend-icon=""
      type="text"
      />
      <v-text-field
      label="text"
      v-model="text"
      prepend-icon=""
      type="text"
      />
      <v-btn color="primary" @click="createUser">ADD POST</v-btn>
    </v-col>
    <v-list-item-group color="primary">
      <v-list-item
        v-for="post in posts"
        :key="posts.id"
      >
        <v-list-item-content>
          <v-list-item-title v-text="post.name"></v-list-item-title>
          <v-list-item-title v-text="post.text"></v-list-item-title>
          <v-list-item-title v-text="post.id"></v-list-item-title>
        </v-list-item-content>
      </v-list-item>
    </v-list-item-group>
  </v-container>
</template>

<script>
import axios from "~/plugins/axios"

let url = "/api/v1/posts/"

export default {
  data() {
    return {
      name: "",
      text: "",
    }
  },
  // created() {
  //   // ユーザーをaxiosで取得
  //   axios.get(url).then(res => {
  //     if (res.data) {
  //         this.posts = res.data
  //         }
  //       })
  // },
  asyncData: async function() {
    let result = await axios.get(url);
    return { posts: result.data}
  },
  methods: {
    createUser(){
      axios.post(url, {name: this.name,text: this.text})
      .then(res => {
        if (res.data) {
            this.posts.push(res.data)
            }
      })
    }
  }
}
</script>