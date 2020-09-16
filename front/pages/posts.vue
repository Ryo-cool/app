<template>
  <v-container>
    <v-row align="center" justify="center">
      <v-col cols="12">
        <v-text-field
        label="postname"
        v-model="name"
        prepend-icon=""
        type="text"
        />
        <v-btn color="primary" @click="createPost">ADD post</v-btn>
      </v-col>
      <v-col cols="12">
          <h1>投稿画面 </h1>
        </v-col>
      </v-row>

      <v-card
        class="mx-auto"
        max-width="300"
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
                </v-list-item-content>
              </v-list-item>
            </v-list-item-group>
          </v-list>
      </v-card>
    </v-container>
</template>

<script>
import axios from "~/plugins/axios"

export default {
  data() {
    return {
      name: "",
      text: "",
      msgs: [],
      posts: []
    }
  },
  created() {
    // ユーザーをaxiosで取得
    axios.get("/api/v1/posts").then(res => {
      if (res.data) {
          this.posts = res.data
          }
        })
  },
  methods: {
    // ユーザーをaxiosで登録
    createPost(){
      axios.post("/posts", {name: this.name,text: this.text})
    .then(res => {
      if (res.data) {
          this.posts.push(res.data)
          }
        })
      }
  }
}
</script>