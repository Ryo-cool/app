<template>
  <v-container>
    <v-row>
      <v-col
      cols ="12"
      sm="6"
      class="my-6 text-center"
      align-self="start"
      >
        <v-text-field
        label="スポット名"
        v-model="name"
        prepend-icon=""
        type="text"
        @change="onChange"
        />
        <v-text-field
        label="説明"
        v-model="introduction"
        prepend-icon=""
        type="text"
        />
        <v-select
        label="都道府県"
        v-model= "prefectures"
        item-text="attributes.name"
        item-value="attributes.id"
        :items="prefecture"
        outlined
        />
        <v-file-input
          chips
          small-chips
          show-size
          accept="image/png, image/jpeg, image/bmp"
          prepend-icon="mdi-camera"
          @change="onUpload"
          
        >
        
        </v-file-input>
        <h2>経度[{{ lng }}]緯度[{{ lat }}]です</h2>
        <h3>住所{{ formatted_address }}</h3>
        <v-btn color="primary" @click="createSpot">ADD post</v-btn>
      </v-col>
      <v-col
      cols ="12"
      sm="6"
      >
        <v-card
          class="mx-auto"
          
          tile
        >
            <v-list rounded>
              <v-subheader>SPOTS</v-subheader>
              <v-list-item-group color="primary">
                <v-list-item
                  v-for="spot in spots"
                  :key="spot.id"
                  @click=""
                >
                  <v-list-item-content>

                    <v-list-item-title v-text="spot.name"></v-list-item-title>
                    <v-list-item-title v-text="spot.introduction"></v-list-item-title>
                    
                  </v-list-item-content>
                </v-list-item>
              </v-list-item-group>
            </v-list>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>


<script>
import axios from "~/plugins/axios"

export default {
  data () {
    return {
      name: "",
      introduction: "",
      photo:"",
      prefectures: "",
      // uploadImageUrl: '',
      lat: "",
      lng: "",
      formatted_address: "",
      spots: [],
      prefecture: []
    }
  },
  mounted() {
    // ジオコーディングを使用する
    this.$gmapApiPromiseLazy().then(() => {this.geocoder = new google.maps.Geocoder() })
  },
  created() {
    // ユーザーをaxiosで取得
    axios.get("/api/v1/spots").then(res => {
      if (res.data) {
        this.spots = res.data.spots
        this.prefecture = res.data.prefecture
      }
    })
  },
  methods: {
    onUpload: function() {
      this.photo = event.target.files;
    },
    // テキストフィールドが変更された時にジオコーディング発火
    onChange() {
      this.geocoder.geocode({
        'address': this.name
      },(results, status) =>{
        if(status === google.maps.GeocoderStatus.OK) {
          this.lat = results[0].geometry.location.lat();
          this.lng = results[0].geometry.location.lng();
          this.formatted_address = results[0].formatted_address;
        }
      }
      )
    },
    // onImagePicked(file) {
    //   if (file !== undefined && file !== null) {
    //     if (file.name.lastIndexOf('.') <= 0) {
    //       return
    //     }
    //     const fr = new FileReader()
    //     fr.readAsDataURL(file)
    //     fr.addEventListener('load', () => {
    //       this.uploadImageUrl = fr.result
    //     })
    //   } else {
    //     this.uploadImageUrl = ''
    //   }
    // },
     // ユーザーをaxiosで登録
    createSpot(){
      axios.post("/api/v1/spots", 
      {
      name: this.name,
      introduction: this.introduction,
      photo: this.photo,
      prefecture_id: this.prefectures,
      latitude: this.lat,
      longitude: this.lng})
      .then(res => {
        if (res.data) {
            this.spots.push(res.data)
        }
      })
    }
  }
}
</script>

<style>

</style>