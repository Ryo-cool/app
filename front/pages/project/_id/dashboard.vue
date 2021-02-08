<template>
  <v-container>
    <v-row align="center" justify="center">
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
        <v-btn color="primary" @click="createUser" class="ma-2">
          ADD POST<v-icon>mdi-train</v-icon>
        </v-btn>
      </v-col>
      <v-col cols="12">
          <h1>こんにちは！ </h1>
          <v-icon large>mdi-train</v-icon>
          <v-color-picker
            class="ma-2"
            hide-canvas
          ></v-color-picker>
          <v-progress-circular
            indeterminate
            color="primary"
          ></v-progress-circular>
          <v-rating
            v-model="rating"
            background-color="purple lighten-3"
            color="purple"
            large
          ></v-rating>
        </v-col>
      </v-row>

      <v-card
        class="mx-auto"
        max-width="600"
        tile
      >
        <v-list rounded>
          <v-subheader>posts</v-subheader>
          <v-list-item-group color="primary">
            <v-list-item
              v-for="post in posts"
              :key="posts.id"
              @click=""
            >
              <v-list-item-content>
                <v-list-item-title v-text="post.name"></v-list-item-title>
                <v-list-item-title v-text="post.text"></v-list-item-title>
                <v-list-item-title v-text="post.id"></v-list-item-title>
                <v-btn color="primary" @click="deletePost">DElETE POST</v-btn>
              </v-list-item-content>
            </v-list-item>
          </v-list-item-group>
        </v-list>
      </v-card>
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
      posts: []
    }
  },
  created() {

  },
  methods: {
    // ユーザーをaxiosで登録
    createUser(){
      axios.post(url, {name: this.name,text: this.text})
      .then(res => {
        if (res.data) {
            this.posts.push(res.data)
            }
      })
    },
    deletePost(){
      axios.delete(url, {params: {id: 28}})
      .then(res => {
        if (res.data) {
            this.posts.push(res.data)
            }
      })
      .catch(error => {
          alert("削除失敗");
          console.log(error, id, params);
      });
    }
  }
}
</script>