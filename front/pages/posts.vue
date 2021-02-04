<template>
  <v-container>
    <v-row align="center" justify="center">
      <v-col cols="6">
        <v-text-field
        label="ポケモン名"
        v-model="name"
        prepend-icon=""
        type="text"
        />
        <v-btn color="primary" @click="createPost">ポケモンを検索する</v-btn>
      </v-col>
      <v-col cols="6">
          <v-card>
          <v-img
            :src="image"
            :aspect-ratio="1/1"
            max-height="300"
            contain
          ></v-img>
          <v-card-title>{{s.name}}</v-card-title>
          <v-card-text>身長:{{ height }}m</v-card-text>
          <v-card-text>重さ:{{ weight }}kg</v-card-text>
          <v-card-sub-title>ステータス</v-card-sub-title>
          <v-card-text>HP:{{ hp.base_stat }}</v-card-text>
          <v-card-text>こうげき:{{ attack.base_stat }}</v-card-text>
          <v-card-text>ぼうぎょ:{{ defense.base_stat }}</v-card-text>
          <v-card-text>とくこう:{{ specialAttack.base_stat }}</v-card-text>
          <v-card-text>とくぼう:{{ specialDefense.base_stat }}</v-card-text>
          <v-card-text>すばやさ:{{ speed.base_stat }}</v-card-text>
          </v-card>

        </v-col>
      </v-row>
    </v-container>
</template>

<script>
import axios from "~/plugins/axios"

export default {
  data() {
    return {
      name: "",
      msgs: [],
      posts: [],
      s:[],
      image:[],
      height:[],
      weight:[],
      hp:[],
      attack:[],
      defense:[],
      specialAttack:[],
      specialDefense:[],
      speed: []
    }
  },
  methods: {
    // ユーザーをaxiosで登録
    createPost(){
      axios.get(`https://pokeapi.co/api/v2/pokemon/${this.name}`).then(res => {
        if (res.data) {
            this.s = res.data
            this.height = res.data.height / 10
            this.weight = res.data.weight /10
            this.image = res.data.sprites.front_default
            this.hp = res.data.stats[0]
            this.attack = res.data.stats[1]
            this.defense = res.data.stats[2]
            this.specialAttack = res.data.stats[3]
            this.specialDefense = res.data.stats[4]
            this.speed = res.data.stats[4]
        }
      })
    }
  }
}
</script>