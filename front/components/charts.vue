<script>
import { Radar, mixins } from 'vue-chartjs'
export default {
  extends: Radar,
  mixins: [mixins.reactiveProp],
  props: {data: null,options: null},
  mounted () {
    this.renderChart(this.chartdata, this.options)
  },
  watch: {
      data: function() {
        this.chartdata = this.data
      }
    }
    
}
</script>