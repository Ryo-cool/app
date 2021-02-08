<script>
import { Radar, mixins } from 'vue-chartjs'
export default {
  extends: Radar,
  mixins: [mixins.reactiveProp],
  props: {data: null,options: null},
  mounted () {
    this.renderChart(this.chartData, this.options)
  },
  watch: {
      data: function() {
        this.chartData = this.data
      }
    }
    
}
</script>