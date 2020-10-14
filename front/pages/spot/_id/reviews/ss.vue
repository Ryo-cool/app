<template>
  <v-container>
    <v-row>
      <v-col>
        <h3>{{ spots.name }}</h3>
        <h4>{{ spots.introduction }}</h4>
        <h3>{{ id }}</h3>
        <!-- <v-list-item-group color="primary">
          <v-list-item
            v-for="spot in spots"
            :key="spots.id"
            @click=""
          >
            <v-list-item-content>
              <v-list-item-title v-text="spot.name"></v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list-item-group> -->
        <v-text-field
          v-model="title"
          counter="25"
          hint="This field uses counter prop"
          label="タイトル"
        ></v-text-field>
        <v-text-field
          v-model="text"
          counter="25"
          hint="This field uses counter prop"
          label="内容"
        ></v-text-field>
        <v-btn color="success" dark min-width="300" @click="createReviews">
          投稿する
        </v-btn>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from "~/plugins/axios"

export default {
  data () {
    return {
      title: "",
      text: "",
      id: [],
      tt: [],
      spots: []
    }
  },
  computed: {
    spotId() {
      return this.$route.params.id
    }
  },
  created () {
    axios
      .get(`/api/v1/spots/${this.$route.params.id}`)
      .then((res) => {
        // const spot = res.data
        this.spots = res.data
        this.id = res.data.id
        // this.review = res.data.review
      })
      .catch((error) => {
        console.error(error)
      })
  },
  methods: {
    createReviews() {
      axios.post("/api/v1/reviews", 
      {title: this.title,text: this.text,spot_id: this.id})
      .then(res => {
        if (res.data) {
            this.tt.push(res.data)
            message: "投稿が完了しました"
        }
      })
      .catch((error) => {
        console.error(error)
        message: "投稿が失敗しました"
      })
    }
  }
}
</script>