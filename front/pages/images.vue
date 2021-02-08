<template>
    <div>
        <v-text-field
        label="ポケモン"
        v-model="name"
        prepend-icon=""
        type="text"
        />
        {{ counter }}
        <button type='button' v-on:click='createPost'>{{btnName}}</button>
        <line-chart
            :data="chartData"
            :options="options"
            :height="100"
        />
    </div>
</template>

<script>
import axios from "~/plugins/axios"
export default {
  data: function() {
    return {
      name:"",
      pokemon:"",
      counter: 0,
      btnName: '追加',
      chartData: {
        labels: [],
        // データ詳細
        datasets: [
          {
            label: "データ",
            data: []
          }
        ]
      },
      options: {responsive: true
                      , maintainAspectRatio: true
                      },
      addFlag: false
    };
  },
  methods: {
    // add: function() {
    //   this.addFlag = !this.addFlag;
    //   if (this.addFlag) {
    //     this.createPost();
    //     this.btnName = '停止'
    //   } else {
    //     this.btnName = '追加'
    //   }
    // },
    addData: function() {
      const newChartData = Object.assign({}, this.chartData)
      this.counter++;
      newChartData.labels.push(this.counter);
      let value = Math.floor(Math.random() * Math.floor(100));
      newChartData.datasets[0].data.push(value);
      this.chartData = newChartData
      setTimeout(() => {
        if (this.addFlag) {
          this.addData();
        }
      }, 1000);
    },
    async createPost(){
      await axios.get(`https://pokeapi.co/api/v2/pokemon/${this.name}`).then(res => {
        if (res.data) {
          const newChartData = Object.assign({}, this.chartData)
          this.counter = res.data.stats[1].base_stat
          this.pokemon = res.data.stats[1].base_stat
          newChartData.datasets[0].data.push(this.counter);
          this.chartData = newChartData
        }
      })
    }
  },
  // created: function() {
  //   this.addData();
  // }
};
</script>

<style>
</style>