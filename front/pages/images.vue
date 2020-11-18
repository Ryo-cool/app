<template>
  <v-container>
    <v-row>
      <v-col>
        {{ post.name.length}}
        <v-form enctype="multipart/form-data">
          <v-text-field
          v-model="post.name"
          placeholder="感想や思い出に残ったことをまとめましょう"
          outlined
          ></v-text-field>
          <v-img v-if="post.image" :src="post.image" />
          <v-file-input
            type="file"
            accept="image/*"
            show-size
            counter
            multiple
            ref="file"
            label="File input"
            @change="onFileChange"
          ></v-file-input>
          <v-btn color="success" dark min-width="300" @click="create">
            投稿する
          </v-btn>
        </v-form>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from "~/plugins/axios"

export default {
  data(){
    return{
      post: {
        name:"",
        image:""
      },
      uploadedImage: '',
      // image:[]
    }
  },
  methods:{
    create(){
      var formData = new FormData();
      formData.append('name', this.post.name)
      formData.append('image', this.post.image)
      const config = {
        headers: {
          'content-type': 'multipart/form-data'
        }
      }
      axios.post("/api/v1/spots/",
        formData,config
      ).then(response => {
        this.post.name = ''
        this.post.image = ''
        console.log("success");
        // this.$refs.file.value = ''
        
      }).catch(error => {
        console.log(error);
      })
    },
    onFileChange() {
      this.post.image = event.files;
    },
  }
}

</script>