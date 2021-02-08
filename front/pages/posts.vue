<template>
  <v-container>
    <v-row align="center" justify="center">
      <v-col cols="3">
        <v-text-field
        label="ポケモン"
        v-model="name"
        prepend-icon=""
        type="text"
        />
        <v-btn color="primary" @click="createPost">ポケモンを検索する</v-btn>
      </v-col>
      <v-col cols="7">
          <v-card>
          <v-img
            :src="image"
            :aspect-ratio="1/1"
            max-height="300"
            contain
          ></v-img>
          </v-card>
        <v-card>
          <v-card-title>{{s.name}}</v-card-title>
          <v-card-title>身長:{{ heights }}m</v-card-title>
          <v-card-title>重さ:{{ weight }}kg</v-card-title>
          <v-card-title>ステータス</v-card-title>
          <charts  :chartData="chartData" :options="options"/>
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
      image:"",
      heights:[],
      weight:[],
      hp:[],
      attack:[],
      defense:[],
      specialAttack:[],
      specialDefense:[],
      speed: [],
      chartData: {
          labels: ['HP','こうげき', 'ぼうぎょ', 'とくこう', 'とくぼう', 'すばやさ'],
          datasets: [
              {
              label: ['ステータス'],
              backgroundColor: "rgba(255,0,0,0.3)",
              data: []
              }
          ]
      },
      options: {
          responsive: true,
          maintainAspectRatio: false,
          scale:{
            ticks: {
              beginAtZero: true,
              suggestedMin: 0,
              suggestedMax: 170
            }
          }
      }
    }
  },
  methods: {
    async createPost(){
      await axios.get(`https://pokeapi.co/api/v2/pokemon/${this.name}`).then(res => {
        if (res.data) {
            this.s = res.data
            this.heights = res.data.height / 10
            this.weight = res.data.weight /10
            this.image = res.data.sprites.front_default
            this.hp = res.data.stats[0].base_stat
            this.attack = res.data.stats[1].base_stat
            this.defense = res.data.stats[2].base_stat
            this.specialAttack = res.data.stats[3].base_stat
            console.log(this.specialAttack)
            this.specialDefense = res.data.stats[4].base_stat
            this.speed = res.data.stats[4].base_stat
            const newChartData = Object.assign({}, this.chartData)
            newChartData.datasets[0].data.splice(0, newChartData.datasets[0].data.length)
            newChartData.datasets[0].data.push(
              ...[this.hp,
              this.attack,
              this.defense,
              this.specialAttack,
              this.specialDefense,
              this.speed]
              )
            // newChartData.datasets[0].data[0]
            // console.log(newChartData.datasets[0].data[0])
            // newChartData.datasets[0].data[2] = this.defense
            this.chartData = newChartData
        }
      })
    }
  }
}
</script>