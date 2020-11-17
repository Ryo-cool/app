<template>
  <v-container>
    <v-row>
      <v-col>
        <v-form enctype="multipart/form-data"/>
          <v-text-field
          v-model="title"
          placeholder="感想や思い出に残ったことをまとめましょう"
          outlined
          ></v-text-field>
          <v-img v-if="uploadImageUrl" :src="uploadImageUrl" />
          <v-file-input
            v-model="image"
            accept="image/*"
            show-size
            counter
            label="File input"
            @change="onImagePicked"
          ></v-file-input>
          <v-btn color="success" dark min-width="300" @click="create">
            投稿する
          </v-btn>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from "~/plugins/axios"

export default {
  data(){
    return{
      title:"",
      uploadImageUrl: '',
      image:[]
    }
  },
  methods:{
    create(){
      let formData = new FormData
      formData.append('name', this.title)
      for( let i = 0; i < this.image.length; i++) {
        let image = this.image[i];
        formData.append('photo.url[]', image);
      }
      axios.post("/api/v1/spots/",
      formData,
        {
        headers: {
          'Content-Type': 'multipart/form-data'
        }
      }).then(response => {
        console.log(response.data.status);
      }).catch(error => {
        console.log(error);
      })
    },
    onImagePicked(file) {
      if (file !== undefined && file !== null) {
        if (file.name.lastIndexOf('.') <= 0) {
          return
        }
        const fr = new FileReader()
        fr.readAsDataURL(file)
        fr.addEventListener('load', () => {
          this.uploadImageUrl = fr.result
        })
      } else {
        this.uploadImageUrl = ''
      }
    },
  }
}
</script>